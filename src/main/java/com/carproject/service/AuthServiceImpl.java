package com.carproject.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.carproject.dao.AuthDAO;
import com.carproject.domain.AuthVO;



@Service("AuthService")
public class AuthServiceImpl implements AuthService{

	
	@Autowired
	private AuthDAO authDAO;

	@Override
	public void insertAuth(AuthVO vo) {
		authDAO.insertAuth(vo);
		
	}



}