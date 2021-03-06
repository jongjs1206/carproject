package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.GradeVO;
import com.carproject.domain.HeartVO;

public interface HeartDAO {
	void insertHeart(HeartVO vo);
	void deleteHeart(HeartVO vo);
	List<HeartVO> selectHeart(String m_id);
}