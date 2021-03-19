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

	
	/*
	 * 찜 등록
	 */
	@Override
	public void insertHeart(HeartVO vo) {
		System.out.println("===>  HeartMapper insertHeart() 호출");
		mybatis.insert("HeartMAP.insertHeart", vo);
	}

	/*
	 * 찜 제거
	 */
	@Override
	public List<HeartVO> selectHeart(String m_id) {
		System.out.println("===>  HeartMapper selectHeart() 호출");
		return mybatis.selectList("HeartMAP.selectHeart", m_id);
	}

	/*
	 * 찜 가져오기
	 */
	@Override
	public void deleteHeart(HeartVO vo) {
		System.out.println("===>  HeartMapper deleteHeart() 호출");
		mybatis.delete("HeartMAP.deleteHeart", vo);
	}

	/*
	 * 찜 숫자 가져오기
	 */
	@Override
	public String seletheartone(HeartVO hvo) {
		System.out.println("===>  HeartMapper seletheartone() 호출");
		return mybatis.selectOne("HeartMAP.seletheartone", hvo);
	}

}