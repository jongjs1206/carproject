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
	
}
