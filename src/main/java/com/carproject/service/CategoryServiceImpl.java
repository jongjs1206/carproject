package com.carproject.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.dao.CategoryDAOImpl;

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
	
}
