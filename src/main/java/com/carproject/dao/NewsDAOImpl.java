package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("newsDAO")
public class NewsDAOImpl implements NewsDAO{
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<HashMap<String, Object>> news_list(String page) {
		System.out.println("===>  NewsMapper news_list() 호출");
		return mybatis.selectList("NewsMAP.news_list", page);
	}

	@Override
	public int newscount() {
		System.out.println("===>  NewsMapper newscount() 호출");
		return mybatis.selectOne("NewsMAP.newscount");
	}

}
