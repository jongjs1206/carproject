package com.carproject.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carproject.domain.MemberVO;
import com.carproject.service.MemberService;


@Controller
public class MemberController {
	@Autowired
	private MemberService memberservice;
	
//	@Autowired
//	BCryptPasswordEncoder pwdEncoder;
	

//회원가입 시 아이디 중복 체크
@RequestMapping(value="/all/checkId.do",  produces="application/text;charset=utf-8")
@ResponseBody
public String checkId(MemberVO vo) {
	
	MemberVO userId =memberservice.checkUniqueId(vo);
	if(userId == null) {
		return "사용할 수 있는 아이디 입니다.";
	}else {
		return "이미 존재하는 아이디 입니다.";
	}
}
/*
//회원가입 시 이메일 중복 확인
@RequestMapping(value="/all/checkEamil.do",  produces="application/text;charset=utf-8")
@ResponseBody
public String checkEamil(MemberVO vo) {
	
	List<MemberVO> emailList=memberservice.checkUniqueEmail(vo);
	if(emailList.isEmpty()) {
		return "성공";
	}else {
		return "이미 존재하는 이메일 입니다.";
	}
*/
// 회원 가입
	@RequestMapping(value="all/userInsert.do")
	public String userInsert(MemberVO vo) {
		//삽입
		memberservice.userInsert(vo);
		System.out.println("***************************************"+vo.getM_pw());
		
		return "/all/login.do";
	}
	
		
}
