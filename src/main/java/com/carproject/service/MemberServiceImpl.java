package com.carproject.service;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aspectj.lang.annotation.SuppressAjWarnings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.carproject.dao.MemberDAO;
import com.carproject.domain.MemberVO;
import com.carproject.domain.SalesVO;



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
		
		//내가 쓴 모든 판매글 가져오기
		public List<HashMap<String, Object>> selectAllsale(MemberVO vo) {
	
			 return memberDAO.selectAllsale(vo);
		}
		//내 판매 글 필터 검색
		@Override
		public List<HashMap<String, Object>> selectMySale(HashMap<String, Object> map) {
			
			 return memberDAO.selectMySale(map);
		}
		//내 판매 글 기본 세팅
		public HashMap<String, Object> saleSearchDefault( HashMap<String, Object> param, MemberVO vo){
			
			param.put("m_id", vo.getM_id());
			
			SimpleDateFormat format = new SimpleDateFormat ( "MM/dd/yyyy");
			Date time = new Date();
			String day = format.format(time);
			
			if((String)param.get("startDate") ==""){
				param.put("startDate", "01/01/1990");
			}
			if((String)param.get("endDate") ==""){
				param.put("endDate", day);
			}
			
			//status
			String s = param.get("status").toString();
			String[] status = s.split(",");
			param.put("statusList", status);
			


			return param;
			
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
