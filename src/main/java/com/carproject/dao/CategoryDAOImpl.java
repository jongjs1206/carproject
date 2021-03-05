package com.carproject.dao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.domain.GradeVO;
import com.carproject.domain.HeartVO;
import com.carproject.domain.MemberVO;

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
	public List<HashMap<String, Object>> sellselect(HeartVO vo) {
		System.out.println("===>  CategoryMapper sellselect 호출");
		return mybatis.selectList("categoryMap.sellselect",vo);
	}

	@Override
	public List<HashMap<String, Object>> category_productselect(HeartVO vo) {
		System.out.println("===>  CategoryMapper category_productselect 호출");
		return mybatis.selectList("categoryMap.category_productselect", vo);
	}

	@Override
	public List<HashMap<String, Object>> model_productselect(HeartVO vo) {
		System.out.println("===>  CategoryMapper model_productselect 호출");
		return mybatis.selectList("categoryMap.model_productselect", vo);
	}

	@Override
	public List<HashMap<String, Object>> detail_productselect(HeartVO vo) {
		System.out.println("===>  CategoryMapper detail_productselect 호출");
		return mybatis.selectList("categoryMap.detail_productselect", vo);
	}

	@Override
	public List<HashMap<String, Object>> grade1_productselect(MemberVO vo) {
		System.out.println("===>  CategoryMapper grade1_productselect 호출");
		return mybatis.selectList("categoryMap.grade1_productselect", vo);
	}

	@Override
	public List<HashMap<String, Object>> grade2_productselect(MemberVO vo) {
		System.out.println("===>  CategoryMapper grade2_productselect 호출");
		return mybatis.selectList("categoryMap.grade2_productselect", vo);
	}

	@Override
	public int sellcount() {
		System.out.println("===>  CategoryMapper sellcount 호출");
		return mybatis.selectOne("categoryMap.sellcount");
	}

	@Override
	public int country_count(String country) {
		System.out.println("===>  CategoryMapper country_count 호출");
		return mybatis.selectOne("categoryMap.country_count",country);
	}

	@Override
	public List<HashMap<String, Object>> searchselect(HeartVO vo) {
		System.out.println("===>  CategoryMapper searchselect 호출");
		return mybatis.selectList("categoryMap.searchselect",vo);
	}

	@Override
	public int search_count(String search) {
		System.out.println("===>  CategoryMapper search_count 호출");
		return mybatis.selectOne("categoryMap.search_count", search);
	}
}
