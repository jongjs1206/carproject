package com.carproject.service;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.GradeVO;

public interface CategoryService {
	public List<HashMap<String, Object>> categoryselect();
	public List<HashMap<String, Object>> sellselect();
	public List<HashMap<String, Object>> modelselect(String category);
	public List<HashMap<String, Object>> detailselect(String car_num);
	public List<HashMap<String, Object>> gradeselect(String grade);
	public List<HashMap<String, Object>> grade2select(GradeVO vo);
	public List<HashMap<String, Object>> countryselect(String abroad);
	public List<HashMap<String, Object>> category_productselect(String category);
}