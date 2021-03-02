package com.carproject.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.dao.HeartDAOImpl;
import com.carproject.domain.HeartVO;

@Repository("HeartService")
public class HeartServiceImpl implements HeartService{

	@Autowired
	private HeartDAOImpl heartDAO;

	@Override
	public void insertHeart(HeartVO vo) {
		heartDAO.insertHeart(vo);
	}

}
