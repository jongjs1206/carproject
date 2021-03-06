package com.carproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carproject.domain.MemberVO;
import com.carproject.service.FindService;

@Controller
public class FindController {

	@Autowired
	private FindService findService;
	@Autowired
	private MemberController memberController;

	// ID 찾기 - 쿼리스트링으로 m_name,tel 가져와서 DB 정보 출력
	@RequestMapping("all/confirm_id.do")
	public void findId(@RequestParam("m_name") String m_name, @RequestParam("tel") String tel, Model model) {
		MemberVO vo = new MemberVO();
		vo.setM_name(m_name);
		vo.setTel(tel);
		
		String id = findService.findId(vo);
		model.addAttribute("m_id", id);
		System.out.println("===>" + m_name + "의 id 확인");
	}
	
	// PW 찾기 - 쿼리스트링으로 m_id, email 가져와서 일치하는 DB 정보 출력
	@RequestMapping("all/confirm_pw.do")
	public void findPw(@RequestParam("m_id") String m_id, @RequestParam("user_email") String mail, HttpSession session, Model model) {
		MemberVO vo = new MemberVO();
		vo.setM_id(m_id);
		vo.setEmail(mail);
		
		System.out.printf("===> 아이디가 %s 이고 이메일이 %s 인 회원의 정보 존재여부 확인", m_id, mail);
		Integer i = findService.confirmInfo(vo);
		
		if (i == 1) {
			MemberVO resultvo = findService.findPw(vo);
			model.addAttribute("resultvo", resultvo);			
			// DB에 사용자정보 있을 경우 memberController의 mailCheck 호출하여 인증번호를 메일로 발송
			memberController.mailCheck(vo, session, resultvo.getEmail());
		}else {
			model.addAttribute("resultvo", null);
		}
	}
	
	// 이메일 인증번호 확인
	@RequestMapping(value="all/check_Mail.do", produces="application/text;charset=utf-8")
	@ResponseBody
	public String checkMail(HttpSession session, @RequestParam("certCode") String certCode) {
		return  memberController.certNumChk(null, session, certCode);
	}
	
	// PW 변경 - 쿼리스트링으로 m_id 가져옴
	@RequestMapping(value="all/update_pw.do", produces="application/text;charset=utf-8")
	@ResponseBody
	public void updatePw(@RequestParam("m_id") String m_id, @RequestParam("m_pw") String m_pw, Model model) {
		MemberVO vo = new MemberVO();
		vo.setM_id(m_id);
		vo.setM_pw(m_pw);
		
		System.out.println("===>" + m_id + "의 비밀번호 변경");
		findService.updatePw(vo);
		
	}
	
	
}
