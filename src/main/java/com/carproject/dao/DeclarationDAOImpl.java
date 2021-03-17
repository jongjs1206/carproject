package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

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

	@Override
	public List<HashMap<String, Object>> selectUserReport(DeclarationVO vo) {
		System.out.println("===> DeclarationMAP selectUserReport 호출");
		return mybatis.selectList("DeclarationMAP.selectUserReport", vo);
	}
	
	public int updateDe_ok(DeclarationVO vo) {
		System.out.println("===> DeclarationMAP updateDe_ok 호출");
		return mybatis.update("DeclarationMAP.updateDe_ok", vo);
	}


}
