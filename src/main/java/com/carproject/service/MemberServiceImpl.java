package com.carproject.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aspectj.lang.annotation.SuppressAjWarnings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.carproject.dao.MemberDAO;
import com.carproject.domain.MemberVO;



@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	  
	  /**
	   * 회원가입 sql
	   */
	   public int userInsert(MemberVO vo ){ 
		String psw = pwdEncoder.encode(vo.getM_pw());
		vo.setM_pw(psw);
		
		  return memberDAO.memberInsert(vo);
	   }
	   
		/**
	  * 아이디 중복 체크하는 sql + 로그인 기능 sql
	  * 회원정보 하나 가져오기
	  */
	  public MemberVO checkUniqueId( MemberVO vo)
	  {	
		  return memberDAO.checkUniqueId(vo);
	  }
	  
	  //구글 로그인
	  public int addGoogleEmail( MemberVO vo)
	  {	
		  return memberDAO.addGoogleEmail(vo);
	  }
	  

	  /**
	   * 내 코인 정보를 출력
	   */
	  	@Override
		public List<HashMap<String, Object>> coinView(String m_id) {
			return memberDAO.coinView(m_id);
		}	
	

	


}
