package com.carproject.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.domain.MemberVO;



@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	

	@Override
	public int memberInsert(MemberVO vo) {
		System.out.println("===>  MemberMapper userInsert() 호출");
		return mybatis.insert("MemberMAP.insertMember", vo);
	}
	
	@Override
	public MemberVO checkUniqueId(MemberVO vo) {
		System.out.println("===> MemberMapper checkUniqueId 호출");
		return mybatis.selectOne("MemberMAP.checkUniqueId", vo);
	}

	@Override
	public MemberVO selectByEmail(MemberVO vo) {
		System.out.println("===> MemberMapper selectByEmail 호출");
		return mybatis.selectOne("MemberMAP.selectByEmail", vo);
	}

	@Override
	public int addGoogle(MemberVO vo) {
		System.out.println("===>  MemberMapper addGoogle() 호출");
		return mybatis.insert("MemberMAP.addGoogle", vo);
	}
	



	

}
