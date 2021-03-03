package com.carproject.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.carproject.domain.MemberVO;

public interface MemberService {
	
	public int userInsert(MemberVO vo );
	public MemberVO checkUniqueId( MemberVO vo);
	
	public int addGoogleEmail( MemberVO vo);
	
	// 코인내역 확인
	public List<HashMap<String, Object>> coinView(String m_id);
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
	
}

