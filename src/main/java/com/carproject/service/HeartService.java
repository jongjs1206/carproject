package com.carproject.service;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.HeartVO;

public interface HeartService {
	public void insertHeart(HeartVO vo);
	public void deleteHeart(HeartVO vo);
	public List<HeartVO> selectHeart(String m_id);
}