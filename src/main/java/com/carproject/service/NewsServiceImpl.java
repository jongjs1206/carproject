package com.carproject.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carproject.dao.NewsDAO;

@Service("newsService")
public class NewsServiceImpl implements NewsService{

	@Autowired
	private NewsDAO newsDAO;

	@Override
	public List<HashMap<String, Object>> news_list(String page) {
		return newsDAO.news_list(page);
	}

	@Override
	public int newscount() {
		return newsDAO.newscount();
	}

	@Override
	public List<HashMap<String, Object>> popularity() {
		return newsDAO.popularity();
	}

	@Override
	public HashMap<String, Object> newsview(String num) {
		return newsDAO.newsview(num);
	}

	@Override
	public void goodadd(String news_num) {
		newsDAO.goodadd(news_num);
		
	}

	@Override
	public void goodsub(String news_num) {
		newsDAO.goodsub(news_num);
		
	}
}