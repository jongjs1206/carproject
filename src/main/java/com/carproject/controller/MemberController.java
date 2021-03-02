package com.carproject.controller;



import javax.servlet.http.HttpSession;

import org.apache.commons.codec.Decoder;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carproject.domain.MemberVO;
import com.carproject.service.MailSendService;
import com.carproject.service.MemberService;
import com.carproject.service.SnsLoginService;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;



@Controller
public class MemberController {
	@Autowired
	private MemberService memberservice;
	
//	@Autowired
//	BCryptPasswordEncoder pwdEncoder;
	
	

    
// 회원 가입
	@RequestMapping(value="/all/userInsert.do")
	public String userInsert(MemberVO vo) {
		//삽입
		memberservice.userInsert(vo);

		
		return "redirect:/all/login.do";
	}
	
	
	//회원가입 시  아이디 중복 확인
	@RequestMapping(value="/all/idCheck.do",  produces="application/text;charset=utf-8")
	@ResponseBody
	public String checkId(MemberVO vo) {
		//이름, 이메일, 아이디 중복 확인
		MemberVO check=memberservice.checkUniqueId(vo);
		if(check == null) {
			return "성공";
		}else {
			return"기존 아이디 존재";
		}
		}
	
	

//sns로그인
	
	@Autowired
	SnsLoginService snsLoginService;
	
	@RequestMapping(value="/all/googleLogin.do")
	public String googleLogin(MemberVO vo, HttpSession session) {
		
		MemberVO info = (MemberVO) session.getAttribute("info");
		
		
		
		
		return "redirect:"+snsLoginService.googleRedirect();
	}
	
	
	@Value("#{config['google.url']}")
	private String googleUrl;
	@Value("#{config['google.client-id']}")
	private String googleId;
	@Value("#{config['google.clientsecret']}")
	private String googleSecret;
	@Value("#{config['google.redirect']}")
	private String redirect;
	
	
	//접근 코드받기
	@RequestMapping(value = "/all/googleToken.do")
    public String googleToken(
            @RequestParam(name = "code") String code) {
		
		String googleLoginInfo = snsLoginService.getToken(code);
		String GoogleEmail = snsLoginService.getGoogleEmail(googleLoginInfo);

		MemberVO vo = new MemberVO();
		vo.setGmail(GoogleEmail);

		return "redirect:/all/login.do";
    
}
	
	

	@Autowired
	private MailSendService mailservice;
	
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	
	// 이메일 인증번호 확인
	@RequestMapping(value="/all/mailCheck.do",  produces="application/text;charset=utf-8")
	@ResponseBody
	public String mailCheck(MemberVO vo, HttpSession session, @RequestParam("confirmNum") String confirmNum) {

		//랜덤문자
		String tempPass =mailservice.makeTempPass();
		//세션에서 랜덤문자 가져옴
		String tempPassSession = (String)session.getAttribute("tempPass");
		System.out.println("/"+tempPassSession);
		//세션에 랜덤문자 기존의 랜덤문자가 없으면 새로 생성
		if(tempPassSession==null) {
			session.setAttribute("tempPass", tempPass);
			tempPassSession=(String)session.getAttribute("tempPass");
		}
		
		return "";

	}
	

}
