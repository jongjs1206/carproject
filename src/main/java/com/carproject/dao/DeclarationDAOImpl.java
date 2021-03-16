package com.carproject.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.domain.DeclarationVO;



@Repository("declarationDAO")
public class DeclarationDAOImpl implements DeclarationDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public void declaration_insert(DeclarationVO vo) {
		System.out.println("===> DeclarationMAP declaration_insert 호출");
		mybatis.insert("DeclarationMAP.declaration_insert", vo);
	}
}
