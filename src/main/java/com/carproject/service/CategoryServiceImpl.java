package com.carproject.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.dao.CategoryDAOImpl;
import com.carproject.domain.CategoryVO;

@Repository("CategoryService")
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryDAOImpl categoryDAO;
	
	@Override
	public List<CategoryVO> categoryselect(){
		return categoryDAO.categoryselect();
	}
	
}
