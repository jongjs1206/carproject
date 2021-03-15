package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.domain.LetterVO;
import com.carproject.domain.MemberVO;



@Repository("letterDAO")
public class LetterDAOImpl implements LetterDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public void insertsend(LetterVO vo) {
		System.out.println("===>  LetterMAP insertsend() 호출");
		mybatis.insert("LetterMAP.insertsend",vo);
	}

	@Override
	public List<HashMap<String, Object>> getselect(MemberVO vo) {
		System.out.println("===>  LetterMAP getselect() 호출");
		return mybatis.selectList("LetterMAP.getselect",vo);
	}

	@Override
	public List<HashMap<String, Object>> sendselect(MemberVO vo) {
		System.out.println("===>  LetterMAP sendselect() 호출");
		return mybatis.selectList("LetterMAP.sendselect",vo);
	}

	@Override
	public HashMap<String, Object> selectgetnote(String l_id) {
		System.out.println("===>  LetterMAP selectgetnote() 호출");
//		System.out.println(l_id+"fdsa");
		return mybatis.selectOne("LetterMAP.selectgetnote",l_id);
	}
	
	@Override
	public HashMap<String, Object> selectsendnote(String l_id) {
		System.out.println("===>  LetterMAP selectsendnote() 호출");
		return mybatis.selectOne("LetterMAP.selectsendnote",l_id);
	}
}
