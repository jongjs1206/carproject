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
	
}

