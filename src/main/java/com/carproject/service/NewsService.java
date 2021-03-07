package com.carproject.service;

import java.util.HashMap;
import java.util.List;

public interface NewsService {
	public List<HashMap<String, Object>> news_list(String page);
	public List<HashMap<String, Object>> popularity();
	public HashMap<String, Object> newsview(String num);
	public int newscount();
	public void goodadd(String news_num);
	public void goodsub(String news_num);
}