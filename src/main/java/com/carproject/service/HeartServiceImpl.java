package com.carproject.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.dao.HeartDAOImpl;
import com.carproject.domain.HeartVO;

@Repository("HeartService")
public class HeartServiceImpl implements HeartService{

	@Autowired
	private HeartDAOImpl heartDAO;

	/*
	 * 찜 등록
	 */
	@Override
	public void insertHeart(HeartVO vo) {
		heartDAO.insertHeart(vo);
	}

	/*
	 * 찜 제거
	 */
	@Override
	public List<HeartVO> selectHeart(String m_id) {
		return heartDAO.selectHeart(m_id);
	}

	/*
	 * 찜 가져오기
	 */
	@Override
	public void deleteHeart(HeartVO vo) {
		heartDAO.deleteHeart(vo);
	}

	/*
	 * 찜 숫자 가져오기
	 */
	@Override
	public String seletheartone(HeartVO hvo) {
		return heartDAO.seletheartone(hvo);
	}

}