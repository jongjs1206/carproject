package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.LetterVO;
import com.carproject.domain.MemberVO;

public interface LetterDAO {
	void insertsend(LetterVO vo);
	List<HashMap<String, Object>> getselect(MemberVO vo);
	List<HashMap<String, Object>> sendselect(MemberVO vo);
	HashMap<String, Object> selectgetnote(String l_id);
	HashMap<String, Object> selectsendnote(String l_id);
}
