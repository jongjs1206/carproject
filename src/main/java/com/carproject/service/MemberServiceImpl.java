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

		@Override
		public MemberVO selectByEmail(MemberVO vo) {

			 return memberDAO.selectByEmail(vo);
		}

		@Override
		public int addGoogle(MemberVO vo) {
			return memberDAO.addGoogle(vo);
		}
	  

	  

	  
	  	public List<HashMap<String, Object>> allMember()
		  {   
		      return memberDAO.allMember();
		  }
		  
		  public MemberVO pickUserById(String id)
		  {
			  return memberDAO.pickUserById(id);
		  }
		  
		  public void updateMember(MemberVO vo) {
			  memberDAO.updateMember(vo);
		  }
		  
		  public List<HashMap<String, Object>> allAdmin()
		  {   
		      return memberDAO.allAdmin();
		  }
		  
		  public void updateAuthAdmin(String id) {
			  memberDAO.updateAuthAdmin(id);
		  }
		  
		  public void updateAuthUser(String id) {
			  memberDAO.updateAuthUser(id);
		  }
		  
		  public List<HashMap<String, Object>> allBlacklist()
		  {   
		      return memberDAO.allBlacklist();
		  }
		  
		  public void setBlacklist(String id) {
			  memberDAO.setBlacklist(id);
		  }
		  
		  public void setNormal(String id) {
			  memberDAO.setNormal(id);
		  } 

	


}
