package com.carproject.service;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.carproject.dao.DeclarationDAO;
import com.carproject.dao.MemberDAO;
import com.carproject.domain.DeclarationVO;
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
	  public MemberVO checkUniqueId( MemberVO vo)	  {	
		  return memberDAO.checkUniqueId(vo);
	  }
	  
	  public String checkAuth(MemberVO vo) {				// 관리자 권한을 갖고 있는지 확인 (admin 메뉴 노출 여부)
		  return memberDAO.checkAuth(vo);
	  }

		@Override
		public MemberVO selectByGoogle(MemberVO vo) {
			 return memberDAO.selectByGoogle(vo);
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
			
			//status
			String s = param.get("status").toString();
			String[] status = s.split(",");
			param.put("statusList", status);
			
			return param;
			
		}
		
		// admin 판매글 관리 페이지
		@Override
		public List<HashMap<String, Object>> selectSale_admin(HashMap<String, Object> map) {
			 return memberDAO.selectSale_admin(map);
		}


		//admin 게시글 등록 관리
		@Override
		public int setPosting(SalesVO vo) {
			return memberDAO.setPosting(vo);
		}
		@Override
		public int returnPosting(SalesVO vo) {
			return memberDAO.returnPosting(vo);
		}
		@Override
		public int expiredPosting(SalesVO vo) {
			return memberDAO.expiredPosting(vo);
		}
	

		
		
		
	  
	  	public List<HashMap<String, Object>> allMember()
		  {   
		      return memberDAO.allMember();
		  }
		  
		  public MemberVO pickUserById(String id)
		  {
			  return memberDAO.pickUserById(id);
		  }
		  
		  public int updateUserEtc(MemberVO vo) {
			 return memberDAO.updateUserEtc(vo);
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

		  
		  //프로필 사진 업로드
		@Override
		public int updatePhoto(MemberVO vo) {
			return memberDAO.updatePhoto(vo);
		}

		@Override
		public void insertImg(String projectId, String bucketName, String objectName, String filePath) throws Exception {
			memberDAO.insertImg(projectId, bucketName, objectName, filePath);
			System.out.println(projectId);
			System.out.println(bucketName);
			System.out.println(objectName);
			System.out.println(filePath);
		}

		@Override
		public int memberOut(MemberVO vo) {
			return memberDAO.memberOut(vo);
		}
		
		public int deleteMember(String id) {
			return memberDAO.deleteMember(id);
		}

		
		public String today() {
			  Date today = new Date();
			    SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			    String toDay = date.format(today);
			    return toDay;
		}

		public String beforeMonth() {
		    Calendar mon = Calendar.getInstance();
		    mon.add(Calendar.MONTH , -1);
		    String beforeMonth = new java.text.SimpleDateFormat("yyyy-MM-dd").format(mon.getTime());		    
		    return beforeMonth;			
		}
		
		public String beforeTwoWeeks() {
		    Calendar week = Calendar.getInstance();
		    week.add(Calendar.DATE , -14);
		    String beforeWeek = new java.text.SimpleDateFormat("yyyy-MM-dd").format(week.getTime());
		    return beforeWeek;			
		}
		
		public String afterOneday() {
		    Calendar week = Calendar.getInstance();
		    week.add(Calendar.DATE , +1);
		    String beforeWeek = new java.text.SimpleDateFormat("yyyy-MM-dd").format(week.getTime());
		    return beforeWeek;			
		}




		
		
		
		


}
