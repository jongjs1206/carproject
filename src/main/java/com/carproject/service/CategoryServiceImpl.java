package com.carproject.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.dao.CategoryDAOImpl;
import com.carproject.domain.GradeVO;
import com.carproject.domain.HeartVO;
import com.carproject.domain.MemberVO;

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

	@Override
	public List<HashMap<String, Object>> countryselect(String abroad) {
		return categoryDAO.countryselect(abroad);
	}

	@Override
	public List<HashMap<String, Object>> sellselect(HeartVO vo) {
		return categoryDAO.sellselect(vo);
	}

	@Override
	public List<HashMap<String, Object>> category_productselect(HeartVO vo) {
		return categoryDAO.category_productselect(vo);
	}

	@Override
	public List<HashMap<String, Object>> model_productselect(HeartVO vo) {
		return categoryDAO.model_productselect(vo);
	}

	@Override
	public List<HashMap<String, Object>> detail_productselect(HeartVO vo) {
		return categoryDAO.detail_productselect(vo);
	}

	@Override
	public List<HashMap<String, Object>> grade1_productselect(MemberVO vo) {
		return categoryDAO.grade1_productselect(vo);
	}

	@Override
	public List<HashMap<String, Object>> grade2_productselect(MemberVO vo) {
		return categoryDAO.grade2_productselect(vo);
	}
	
}
