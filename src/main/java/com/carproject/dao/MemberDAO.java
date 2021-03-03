package com.carproject.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.carproject.domain.MemberVO;


public interface MemberDAO {

	/**
	 * 회원가입기능 구현
	 */
	int memberInsert(MemberVO vo);
	
	MemberVO checkUniqueId( MemberVO vo );
	
	int addGoogleEmail( MemberVO vo );
	
	// 코인내역 확인
	List<HashMap<String, Object>> coinView(String m_id);
	
}
