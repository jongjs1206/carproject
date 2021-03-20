package com.carproject.service;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.HeartVO;

public interface HeartService {
	//찜 등록
	public void insertHeart(HeartVO vo);
		
	//찜 제거
	public void deleteHeart(HeartVO vo);
		
	//찜 가져오기
	public List<HeartVO> selectHeart(String m_id);
		
	//찜 숫자 가져오기
	public String seletheartone(HeartVO hvo);
}