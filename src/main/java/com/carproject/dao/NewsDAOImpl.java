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

	@Override
	public List<HashMap<String, Object>> popularity() {
		System.out.println("===>  NewsMapper popularity() 호출");
		return mybatis.selectList("NewsMAP.popularity");
	}

	@Override
	public HashMap<String, Object> newsview(String num) {
		System.out.println("===>  NewsMapper newsview() 호출");
		return mybatis.selectOne("NewsMAP.newsview",num);
	}

	@Override
	public void goodadd(String news_num) {
		System.out.println("===>  NewsMapper goodadd() 호출");
		mybatis.update("NewsMAP.goodadd",news_num);
	}

	@Override
	public void goodsub(String news_num) {
		System.out.println("===>  NewsMapper goodsub() 호출");
		mybatis.update("NewsMAP.goodsub",news_num);
	}

}
