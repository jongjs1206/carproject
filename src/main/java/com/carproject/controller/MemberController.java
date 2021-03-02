package com.carproject.controller;


import java.util.Base64;
import java.util.Base64.Decoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.carproject.domain.MemberVO;
import com.carproject.service.MemberService;
import com.carproject.service.SnsLoginService;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import ch.qos.logback.core.util.SystemInfo;



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

//sns로그인
	
	@Autowired
	SnsLoginService snsLoginService;
	
	@RequestMapping(value="/all/googleLogin.do")
	public String googleLogin(MemberVO vo) {
		
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
		
		JsonParser Parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) Parser.parse(googleLoginInfo);
//		String access_token = jsonObj.get("access_token").getAsString();
//		String refresh_token = jsonObj.get("refresh_token").getAsString();
		String id_token = jsonObj.get("id_token").getAsString();

//		System.out.println("+++++access_token+++++++++"+access_token);
//		System.out.println("+++++refresh_token+++++++++"+refresh_token);
		System.out.println("+++++id_token+++++"+id_token);
		

		
		return "redirect:/all/login.do";
    
}
	

}
