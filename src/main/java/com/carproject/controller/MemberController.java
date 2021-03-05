package com.carproject.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.Decoder;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carproject.domain.AuthVO;
import com.carproject.domain.MemberVO;
import com.carproject.service.AuthService;
import com.carproject.service.MailSendService;
import com.carproject.service.MemberService;
import com.carproject.service.SnsLoginService;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberservice;
	@Autowired
	private AuthService authService;
	@Autowired
	SnsLoginService snsLoginService;

// 회원 가입
	@RequestMapping(value = "/all/userInsert.do")
	public String userInsert(MemberVO vo, @RequestParam("email1") String email1,
			@RequestParam("email2") String email2) {
		String eamil = email1 + "@" + email2;
		vo.setEmail(eamil);
		// 삽입
		memberservice.userInsert(vo);
		// 권한
		AuthVO authVo = new AuthVO();
		authVo.setM_id(vo.getM_id());
		authService.insertAuth(authVo);

		return "redirect:/all/login.do";
	}

	// 회원가입 시 아이디 중복 확인
	@RequestMapping(value = "/all/idCheck.do", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String checkId(MemberVO vo) {
		// 이름, 이메일, 아이디 중복 확인
		MemberVO check = memberservice.checkUniqueId(vo);
		if (check == null) {
			return "성공";
		} else {
			return "기존 아이디 존재";
		}
	}

//sns로그인

	// 구글 아이디
	@RequestMapping(value = "/all/googleLogin.do")
	public String googleLogin(MemberVO vo, HttpSession session) {
		MemberVO info = (MemberVO) session.getAttribute("info");
		return "redirect:" + snsLoginService.googleRedirect();
	}

	// 가입자인지 확인
	@RequestMapping(value = "/all/googleToken.do")
	public String googleToken(Model model, @RequestParam(name = "code") String code) {

		String googleLoginInfo = snsLoginService.getToken(code);
		String googleEmail = snsLoginService.getGoogleInfo(googleLoginInfo, "email");
		String googleName = snsLoginService.getGoogleInfo(googleLoginInfo, "name");

		MemberVO vo = new MemberVO();
		vo.setEmail(googleEmail);
		vo.setM_name(googleName);
//		System.out.println("****************************");
//		System.out.println(googleEmail);
//		System.out.println(googleName);

		MemberVO member = memberservice.selectByEmail(vo);
		// 기존 가입자 이메일이 같은데 구글 로그인이 없는 경우 =>연동
		if (member != null && member.getGoogle() == null) {
			member.setGoogle(googleEmail);
			;
			memberservice.addGoogle(member);
			model.addAttribute("member", member);
			return "redirect:/all/login.do";
		}

		// 구글로그인이 이미 있거나 기존 가입자가 아닐 경우 =>새로가입
		if (member == null || member.getGoogle() != null) {
			return "redirect:/all/login.do";
		}
		return "redirect:/all/login_social.do/error";

	}

	@Autowired
	private MailSendService mailservice;

	// 이메일 인증번호 보내기
	@RequestMapping(value = "/all/mailCheck.do", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String mailCheck(MemberVO vo, HttpSession session, @RequestParam("email") String email) {
		// 랜덤문자 생성
		String authNumber = mailservice.makeTempPass();
		// 메일
		System.out.println("++++인증번호+++" + authNumber);
		mailservice.mailSend(authNumber, email);
		session.setAttribute("authNumber", authNumber);
		return "이메일을 확인해주세요.";

	}

	// 이메일 인증번호 확인
	@RequestMapping(value = "/all/certNumChk.do", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String certNumChk(MemberVO vo, HttpSession session, @RequestParam("certCode") String certCode) {

		if (certCode.equals((String) session.getAttribute("authNumber"))) {
			return "인증";
		} else {
			return "이메일 인증 실패";
		}
	}

//회원 정보 수정
	
	// 정보 가져와서 세팅
	@RequestMapping(value = "/user/profile.do")
	public void userSetting(HttpSession session, Model m) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id ="";
		if (principal instanceof UserDetails) {
		   id = ((UserDetails)principal).getUsername();
		} else {
		   id = principal.toString();
		}
	    MemberVO vo= new MemberVO();
	    vo.setM_id(id);
	    MemberVO info = memberservice.checkUniqueId(vo);
	    session.setAttribute("info", info);
	    
	    
	    
		// 유저정보 가져오기
		MemberVO member = (MemberVO) session.getAttribute("info");
//		System.out.println("+++userinfo+++++ "+member.getEmail());

		// 세팅
		String email = (String)member.getEmail();
		String[] emailSplit = email.split("@"); 
		  
		m.addAttribute("member", member);
		m.addAttribute("email",emailSplit);
	}
	
	
	//수정
	
	
	
	//프로필 외 정보 업로드
	@RequestMapping(value = "/user/userUpdate.do")
	public String userUpdate(MemberVO vo, @RequestParam("email1") String email1,
			@RequestParam("email2") String email2, HttpSession session) {
		
		String eamil = email1 + "@" + email2;
		vo.setEmail(eamil);
		
		//update
		memberservice.updateMember(vo);
		
		//세션 갱신
	    MemberVO info = memberservice.checkUniqueId(vo);
	    session.setAttribute("info", info);
	    
		//session에 다시 저장
		return "redirect:/all/homepage.do";
	}
	
	

}
