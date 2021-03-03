package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

public interface CoinQnaDAO {
	
	List<HashMap<String, Object>> coinView(String m_id);

}
