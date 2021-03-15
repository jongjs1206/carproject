package com.carproject.service;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.LetterVO;
import com.carproject.domain.MemberVO;

public interface LetterService {
	public void insertsend(LetterVO vo);
	public List<HashMap<String, Object>> getselect(MemberVO vo);
	public List<HashMap<String, Object>> sendselect(MemberVO vo);
	public HashMap<String, Object> selectgetnote(String l_id);
	public HashMap<String, Object> selectsendnote(String l_id);
}