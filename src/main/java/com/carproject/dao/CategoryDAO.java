package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.GradeVO;

public interface CategoryDAO {
	List<HashMap<String, Object>> categoryselect();
	List<HashMap<String, Object>> sellselect();
	List<HashMap<String, Object>> modelselect(String category);
	List<HashMap<String, Object>> detailselect(String car_num);
	List<HashMap<String, Object>> gradeselect(String grade);
	List<HashMap<String, Object>> grade2select(GradeVO vo);
	List<HashMap<String, Object>> countryselect(String abroad);
	List<HashMap<String, Object>> category_productselect(String category);
}
