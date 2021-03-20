package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.LetterVO;
import com.carproject.domain.MemberVO;

public interface LetterDAO {
	//쪽지 등록
	void insertsend(LetterVO vo);
	//받은 쪽지 가져오기
	List<HashMap<String, Object>> getselect(MemberVO vo);
	//보낸 쪽지 가져오기
	List<HashMap<String, Object>> sendselect(MemberVO vo);
	//받은 쪽지 
	HashMap<String, Object> selectgetnote(String l_id);
	//보낸 쪽지
	HashMap<String, Object> selectsendnote(String l_id);
	//쪽지 봤을 때
	void updatesend(String l_id);
	//받은 쪽지 수
	String getcount(MemberVO vo);
	//보낸 쪽지 수
	String sendcount(MemberVO vo);
	//받은사람 쪽지 삭제
	void noshowget(String l_id);
	//보낸사람 쪽지 삭제
	void noshowsend(String l_id);
	//안본 쪽지 수
	String selectnotecount(String id);
}
