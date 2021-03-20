package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.GradeVO;
import com.carproject.domain.HeartVO;

public interface HeartDAO {
	//찜 등록
	void insertHeart(HeartVO vo);
	
	//찜 제거
	void deleteHeart(HeartVO vo);
	
	//찜 가져오기
	List<HeartVO> selectHeart(String m_id);
	
	//찜 숫자 가져오기
	String seletheartone(HeartVO hvo);
}