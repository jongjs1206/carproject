package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

public interface NewsDAO {
	List<HashMap<String, Object>> news_list(String page);
	int newscount();
}
