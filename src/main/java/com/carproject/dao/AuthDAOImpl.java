package com.carproject.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.domain.AuthVO;



@Repository("authDAO")
public class AuthDAOImpl implements AuthDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public int insertAuth(AuthVO vo) {
		System.out.println("===>  AuthMapper insertAuth() 호출");
		return mybatis.insert("AuthMAP.insertAuth", vo);
	}


}
