package com.carproject.controller;

import java.io.IOException;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.Decoder;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import com.carproject.domain.AuthVO;
import com.carproject.domain.MemberVO;
import com.carproject.domain.SalesVO;
import com.carproject.service.AuthService;
import com.carproject.service.MailSendService;
import com.carproject.service.MemberService;
import com.carproject.service.MemberServiceImpl;
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

	// 구글 로그인
	@RequestMapping(value = "/all/googleLogin.do")
	public String googleLogin(MemberVO vo, HttpSession session) {
		MemberVO info = (MemberVO) session.getAttribute("info");
		
		return "redirect:" + snsLoginService.googleRedirect();
	}
	
	
	
	@Autowired
	@Qualifier("org.springframework.security.authenticationManager")
	private AuthenticationManager authenticationManager;
	
	// 가입자인지 확인
	@RequestMapping(value = "/all/googleToken.do")
	public String googleToken(Model model, @RequestParam(name = "code") String code, HttpSession session, HttpServletRequest request) {

		String googleLoginInfo = snsLoginService.getToken(code);
		String googleEmail = snsLoginService.getGoogleInfo(googleLoginInfo, "email");
		String googleName = snsLoginService.getGoogleInfo(googleLoginInfo, "name");

		MemberVO vo = new MemberVO();
		
		//google과 email 둘다 받아온 이메일 값을 넣음
		vo.setGoogle(googleEmail);
		vo.setEmail(googleEmail);
		vo.setM_name(googleName);
		System.out.println("****************************");
		System.out.println(googleEmail);
		System.out.println(googleName);

		
		MemberVO userinfo = memberservice.selectByEmail(vo);
		System.out.println("3333"+userinfo.getM_id());
		System.out.println("+++++"+userinfo.getM_pw());
		
//		Authentication authentication  = new UsernamePasswordAuthenticationToken(userinfo, userinfo.getM_pw());
//		 
//		SecurityContext securityContext = SecurityContextHolder.getContext();
//		securityContext.setAuthentication(authentication);
		
//		session = request.getSession(true);
//		session.setAttribute("SPRING_SECURITY_CONTEXT",securityContext);   // 세션에 spring security context 넣음
		
//		return "redirect:/all/homepage.do";
		
		model.addAttribute("m_id", userinfo.getM_id());
		model.addAttribute("m_pw", userinfo.getM_pw());
		
		

		return "user/sample"; // 데이터 토스
		
		// 1. 이미 사차원 회원인 경우
		// -> 확인절차 없이 바로 로그인 시켜주고 싶음
		// * google 로그인 세션은 건드릴 수 없음.
		// 발급해주는 Token, 로그인하려하는(혹은 연동하려하는) 이메일, 사용자 이름 .. etc
		// 사차원만의 회원정보중, 비교할 수 있는 정보가 있어야 함. : 구글 이메일 여부
		// 1-1. 구글 이메일이 있다면
		// List로 리턴을 받던, Object로 리턴을 받던 
		// 회원인게 증명됨 -> 세션부여 -> 홈으로 이동
		
//			
//		}
		
		// 사차원 사이트의 세션을 반드시 부여해야됨.

	}

	 @RequestMapping("/user/sample")
	 public void sampleLogin(@RequestParam("m_id") String m_id) {
		 System.out.println("m_id : " + m_id);
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
	
	
	//프로필 사진 업로드
		@RequestMapping(value = "/user/updatePhoto.do")
		public String updatePhoto(MemberVO vo, HttpSession session, Model m) throws Exception {
			
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String id ="";
			if (principal instanceof UserDetails) {
			   id = ((UserDetails)principal).getUsername();
			} else {
			   id = principal.toString();
			}
		    vo.setM_id(id);
			
			//update
			memberservice.updatePhoto(vo);
			
			MemberVO info = memberservice.checkUniqueId(vo);
			
			String projectId = "sachawon";
			String bucketName = "car_image_for_analysis";
			String objectName = "profile/" + info.getM_id() + ".jpg";
			String filePath = "C:\\upload\\" + info.getPhoto();
			memberservice.insertImg(projectId, bucketName,objectName, filePath);
			String fileUrl = "https://storage.googleapis.com/car_image_for_analysis/" + objectName;
			System.out.println("파일주소 : " + fileUrl);
			
			return "redirect:/user/profile.do";

			
		}
	
	

	
	//내가쓴 판매글
	//내가 쓴 판매글 모두 가져오기 (첫 로딩)
	@RequestMapping(value = "/user/my_sales.do")
	public void my_sales(MemberVO vo, HttpSession session, Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id ="";
		if (principal instanceof UserDetails) {
		   id = ((UserDetails)principal).getUsername();
		} else {
		   id = principal.toString();
		}
		vo.setM_id(id);
		
		//검색
		List<HashMap<String, Object>> sale_list = memberservice.selectAllsale(vo);
		//날짜에서 시간 자르기
		for(HashMap<String, Object> s : sale_list) {	
		String date = s.get("w_date").toString();
		s.put("w_date", date.split(" ")[0]);
		}
		model.addAttribute("sale_list", sale_list);

	}
	
	
	
	//내 판매글 ajax jsp 만들기
	@RequestMapping(value = "user/my_sales_ajax.do", method= {RequestMethod.POST})
	//@ResponseBody 지우기
	public void  searchMySales(MemberVO vo, HttpSession session, Model model,
			@RequestParam HashMap<String, Object> param
			) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id ="";
		if (principal instanceof UserDetails) {
		   id = ((UserDetails)principal).getUsername();
		} else {
		   id = principal.toString();
		}
		vo.setM_id(id);
		MemberVO info = memberservice.checkUniqueId(vo);
		
		
		//비어있는 곳 기본 세팅
		HashMap<String, Object> m = memberservice.saleSearchDefault(param, info);
		
		//검색
		List<HashMap<String, Object>> sale_list = memberservice.selectMySale(m);
		
		//날짜에서 시간 자르기
		for(HashMap<String, Object> s : sale_list) {	
		String date = s.get("w_date").toString();
		s.put("w_date", date.split(" ")[0]);
		}
		
		model.addAttribute("sale_list", sale_list);

	
	}
	
	
	
	

}
