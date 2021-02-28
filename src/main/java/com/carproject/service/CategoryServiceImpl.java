package com.carproject.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.dao.CategoryDAOImpl;
import com.carproject.domain.GradeVO;

@Repository("CategoryService")
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryDAOImpl categoryDAO;
	
	@Override
	public List<HashMap<String, Object>> categoryselect(){
		return categoryDAO.categoryselect();
	}

	@Override
	public List<HashMap<String, Object>> modelselect(String category) {
		return categoryDAO.modelselect(category);
	}

	@Override
	public List<HashMap<String, Object>> detailselect(String car_num) {
		return categoryDAO.detailselect(car_num);
	}

	@Override
	public List<HashMap<String, Object>> gradeselect(String grade) {
		return categoryDAO.gradeselect(grade);
	}

	@Override
	public List<HashMap<String, Object>> grade2select(GradeVO vo) {
		return categoryDAO.grade2select(vo);
	}
	
}
