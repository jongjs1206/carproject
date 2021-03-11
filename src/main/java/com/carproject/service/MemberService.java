package com.carproject.service;


import java.util.HashMap;
import java.util.List;

import com.carproject.domain.AuthVO;
import com.carproject.domain.MemberVO;

public interface MemberService {
	
	public int userInsert(MemberVO vo );
	public MemberVO checkUniqueId( MemberVO vo);
	public String checkAuth(MemberVO vo);				// 관리자 권한을 갖고 있는지 확인 (admin 메뉴 노출 여부)
	public MemberVO selectByGoogle( MemberVO vo);
	public MemberVO selectByEmail( MemberVO vo);
	public int addGoogle(MemberVO vo );
	//내가 쓴 판매글 가져오기
	public List<HashMap<String, Object>> selectAllsale( MemberVO vo);
	//필터 
	public List<HashMap<String, Object>> selectMySale( HashMap<String, Object> map);
	public HashMap<String, Object> saleSearchDefault( HashMap<String, Object> map, MemberVO vo);
	
	
	// 모든 회원 목록을 불러오기 위한 함수
	public List<HashMap<String, Object>> allMember();
	// 해당 id의 row를 불러오기 위한 함수
	public MemberVO pickUserById(String id);
	// 멤버 테이블의 데이터를 update(수정)하기 위한 함수
	public void updateMember(MemberVO vo);
	// 관리자 권한을 가진 모든 회원을 불러오기 위한 함수
	public List<HashMap<String, Object>> allAdmin();
	// 관리자 권한을 부여하기 위한 함수
	public void updateAuthAdmin(String id);
	// 관리자 권한을 해제하기 위한 함수
	public void updateAuthUser(String id);
	// 모든 블랙리스트 목록을 불러오기 위한 함수
	public List<HashMap<String, Object>> allBlacklist(); 
	// 블랙리스트 등록을 위한 함수
	public void setBlacklist(String id);
	// 블랙리스트 해제를 위한 함수
	public void setNormal(String id);
	
	
	//프로필 사진 업데이트
	public int updatePhoto(MemberVO vo);
	public void insertImg (String projectId, String bucketName, String objectName, String filePath) throws Exception;
	
	
	
}

