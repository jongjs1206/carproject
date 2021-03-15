package com.carproject.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.carproject.domain.AuthVO;
import com.carproject.domain.MemberVO;
import com.carproject.domain.SalesVO;


public interface MemberDAO {

	/**
	 * 회원가입기능 구현
	 */
	int memberInsert(MemberVO vo);
	
	MemberVO checkUniqueId( MemberVO vo );
	String checkAuth(MemberVO vo);				// 관리자 권한을 갖고 있는지 확인 (admin 메뉴 노출 여부)
	
	MemberVO selectByGoogle( MemberVO vo );
	
	MemberVO selectByEmail( MemberVO vo );
	
	int addGoogle(MemberVO vo);
	
	//내 판매글 모두 불러오기
	List<HashMap<String, Object>> selectAllsale(MemberVO vo);
	//필터 걸어서 불러오기
	List<HashMap<String, Object>> selectMySale(HashMap<String, Object> map);
	List<HashMap<String, Object>> selectSale_admin(HashMap<String, Object> map);
	

	// 모든 회원 목록을 불러오기 위한 함수
	List<HashMap<String, Object>> allMember();
	// 해당 id의 row를 불러오기 위한 함수
	MemberVO pickUserById(String id);
	//etc update
	int updateUserEtc(MemberVO vo);
	// 멤버 테이블의 데이터를 update(수정)하기 위한 함수
	void updateMember(MemberVO vo);
	// 관리자 권한을 가진 모든 회원을 불러오기 위한 함수
	List<HashMap<String, Object>> allAdmin();
	// 관리자 권한을 부여하기 위한 함수
	void updateAuthAdmin(String id); 
	// 관리자 권한을 해제하기 위한 함수
	void updateAuthUser(String id);
	// 모든 블랙리스트 목록을 불러오기 위한 함수
	List<HashMap<String, Object>> allBlacklist();
	// 블랙리스트 등록을 위한 함수
	void setBlacklist(String id);
	// 블랙리스트 해제를 위한 함수
	void setNormal(String id);
	
	
	//프로필 사진 업데이트
	
	int updatePhoto(MemberVO vo);
	void insertImg (String projectId, String bucketName, String objectName, String filePath) throws Exception;
	
	
	
}
	 

