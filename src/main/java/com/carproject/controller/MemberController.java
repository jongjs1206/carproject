package com.carproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carproject.domain.MemberVO;
import com.carproject.service.MemberService;


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
		System.out.println("***************************************"+vo.getM_pw());
		
		return "redirect:/all/login.do";
	}
	
		
}
