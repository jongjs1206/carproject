package com.carproject.service;

import java.util.HashMap;
import java.util.List;

public interface CategoryService {
	public List<HashMap<String, Object>> categoryselect();
	public List<HashMap<String, Object>> modelselect(String category);
}