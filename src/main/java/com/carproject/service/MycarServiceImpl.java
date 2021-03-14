package com.carproject.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carproject.dao.MycarDAO;
import com.carproject.domain.MycarVO;



@Service("MycarService")
public class MycarServiceImpl implements MycarService{

	
	@Autowired
	private MycarDAO mycarDAO;

	@Override
	public String selectnow() {
		return mycarDAO.selectnow();
	}

	@Override
	public List<MycarVO> selectblackbox() {
		return mycarDAO.selectblackbox();
	}

	@Override
	public String selectpath(String day) {
		return mycarDAO.selectpath(day);
	}

	@Override
	public void updateblackbox() {
		mycarDAO.updateblackbox();
	}

}