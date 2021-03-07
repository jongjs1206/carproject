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
}