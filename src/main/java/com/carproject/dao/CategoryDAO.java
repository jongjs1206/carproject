package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

public interface CategoryDAO {
	List<HashMap<String, Object>> categoryselect();
	List<HashMap<String, Object>> modelselect(String category);
}
