package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

public interface NewsDAO {
	List<HashMap<String, Object>> news_list(String page);
	List<HashMap<String, Object>> popularity();
	HashMap<String, Object> newsview(String num);
	int newscount();
	void goodadd(String news_num);
	void goodsub(String news_num);
}
