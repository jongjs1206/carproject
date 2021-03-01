package com.carproject.dao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.domain.GradeVO;

@Repository("CategoryDAO")
public class CategoryDAOImpl implements CategoryDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<HashMap<String, Object>> categoryselect() {
		System.out.println("===>  CategoryMapper categoryselect 호출");
		return mybatis.selectList("categoryMap.categoryselect");
	}

	@Override
	public List<HashMap<String, Object>> modelselect(String category) {
		System.out.println("===>  CategoryMapper modelselect 호출");
		return mybatis.selectList("categoryMap.modelselect", category);
	}

	@Override
	public List<HashMap<String, Object>> detailselect(String car_num) {
		System.out.println("===>  CategoryMapper detailselect 호출");
		return mybatis.selectList("categoryMap.detailselect", car_num);
	}

	@Override
	public List<HashMap<String, Object>> gradeselect(String grade) {
		System.out.println("===>  CategoryMapper gradeselect 호출");
		return mybatis.selectList("categoryMap.gradeselect", grade);
	}

	@Override
	public List<HashMap<String, Object>> grade2select(GradeVO vo) {
		System.out.println("===>  CategoryMapper grade2select 호출");
		return mybatis.selectList("categoryMap.grade2select", vo);
	}

	@Override
	public List<HashMap<String, Object>> countryselect(String abroad) {
		System.out.println("===>  CategoryMapper countryselect 호출");
		return mybatis.selectList("categoryMap.countryselect", abroad);
	}

	@Override
	public List<HashMap<String, Object>> sellselect() {
		System.out.println("===>  CategoryMapper sellselect 호출");
		return mybatis.selectList("categoryMap.sellselect");
	}

	@Override
	public List<HashMap<String, Object>> category_productselect(String category) {
		System.out.println("===>  CategoryMapper category_productselect 호출");
		return mybatis.selectList("categoryMap.category_productselect", category);
	}
}
