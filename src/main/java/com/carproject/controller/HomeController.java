package com.carproject.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carproject.domain.AuthVO;
import com.carproject.domain.MemberVO;
import com.carproject.service.LetterService;
import com.carproject.service.MemberService;
import com.carproject.service.MycarService;

@Controller
public class HomeController {
	@Autowired
	private MemberService memberService;	
	@Autowired
	private MycarService mycarService;
	@Autowired
	private LetterService letterService;
	
	
	/*
	 * 기본으로 jsp에 들어가는 코드
	 */
	@RequestMapping("{step1}/{step2}.do")
	public String loginPage(@PathVariable String step1,@PathVariable String step2,HttpSession session) {
		//스프링 시큐리티 값 얻어오는 코드
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String id = "";
		if (principal instanceof UserDetails) {
			id = ((UserDetails) principal).getUsername();
		}
		MemberVO vo = new MemberVO();
		vo.setM_id(id);

		// 회원정보를 세션에 저장
		MemberVO info = memberService.checkUniqueId(vo);
		session.setAttribute("info", info);

		// 관리자인지 권한정보를 세션에 저장
		String auth = memberService.checkAuth(vo);
		session.setAttribute("auth", auth);
		
		//차 충격을 세션에 저장
		String crash = mycarService.selectnow();
		session.setAttribute("crash", crash);
		
		String user_id="";
		if(session.getAttribute("info")!=null) {
			user_id=((MemberVO)session.getAttribute("info")).getM_id();
		}
		
		//쪽지를 세션에 저장
		String note = letterService.selectnotecount(user_id);
		session.setAttribute("note", note);

		return step1+"/"+step2;
	}
	
	@RequestMapping("{step1}.do")
	public String loginPage(@PathVariable String step1) {
		return step1;
	}
}
