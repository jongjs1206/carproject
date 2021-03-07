package com.carproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carproject.domain.MemberVO;
import com.carproject.service.MemberService;

@Controller
public class HomeController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("{step1}/{step2}.do")
	public String loginPage(@PathVariable String step1,@PathVariable String step2,HttpSession session) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String id = "";
		if (principal instanceof UserDetails) {
			id = ((UserDetails) principal).getUsername();
		}
		MemberVO vo = new MemberVO();
		vo.setM_id(id);

		MemberVO info = memberService.checkUniqueId(vo);

		session.setAttribute("info", info);
		return step1+"/"+step2;
	}
	
	@RequestMapping("{step1}.do")
	public String loginPage(@PathVariable String step1) {
		return step1;
	}
}
