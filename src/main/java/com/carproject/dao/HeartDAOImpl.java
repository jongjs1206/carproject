package com.carproject.dao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.domain.GradeVO;
import com.carproject.domain.HeartVO;

@Repository("HeartDAO")
public class HeartDAOImpl implements HeartDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public void insertHeart(HeartVO vo) {
		System.out.println("===>  HeartMapper insertHeart() 호출");
		mybatis.insert("HeartMAP.insertHeart", vo);
	}

	@Override
	public List<HeartVO> selectHeart(String m_id) {
		System.out.println("===>  HeartMapper selectHeart() 호출");
		return mybatis.selectList("HeartMAP.selectHeart", m_id);
	}

	@Override
	public void deleteHeart(HeartVO vo) {
		System.out.println("===>  HeartMapper deleteHeart() 호출");
		mybatis.delete("HeartMAP.deleteHeart", vo);
	}

}
