package com.carproject.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aspectj.lang.annotation.SuppressAjWarnings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carproject.dao.MemberDAO;
import com.carproject.domain.MemberVO;



@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
//	@Autowired
//	BCryptPasswordEncoder pwdEncoder;
	
	  
	  /**
	   * 회원가입 sql
	   */
	   public int userInsert(MemberVO vo ){ 
//		String psw = pwdEncoder.encode(vo.getM_pw());
//		vo.setM_pw(m_pw);(psw);
		
		  return memberDAO.memberInsert(vo);
	   }

	
	

	


}
