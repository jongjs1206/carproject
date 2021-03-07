package com.carproject.service;

import java.util.HashMap;
import java.util.List;

public interface NewsService {
	public List<HashMap<String, Object>> news_list(String page);
	public int newscount();
}