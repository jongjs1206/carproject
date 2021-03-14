package com.carproject.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.domain.MycarVO;



@Repository("mycarDAO")
public class MycarDAOImpl implements MycarDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public String selectnow() {
		System.out.println("===>  MycarMapper selectnow() 호출");
		return mybatis.selectOne("MycarMAP.selectnow");
	}

	@Override
	public List<MycarVO> selectblackbox() {
		System.out.println("===>  MycarMapper selectblackbox() 호출");
		return mybatis.selectList("MycarMAP.selectblackbox");
	}

	@Override
	public String selectpath(String day) {
		System.out.println("===>  MycarMapper selectpath() 호출");
		return mybatis.selectOne("MycarMAP.selectpath",day);
	}

	@Override
	public void updateblackbox() {
		System.out.println("===>  MycarMapper updateblackbox() 호출");
		mybatis.update("MycarMAP.updateblackbox");
	}
}
