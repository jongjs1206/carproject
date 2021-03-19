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
	
	/*
	 * 카테고리 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> categoryselect() {
		System.out.println("===>  CategoryMapper categoryselect 호출");
		return mybatis.selectList("categoryMap.categoryselect");
	}

	/*
	 * 모델 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> modelselect(String category) {
		System.out.println("===>  CategoryMapper modelselect 호출");
		return mybatis.selectList("categoryMap.modelselect", category);
	}
	
	/*
	 * 세부모델 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> detailselect(String car_num) {
		System.out.println("===>  CategoryMapper detailselect 호출");
		return mybatis.selectList("categoryMap.detailselect", car_num);
	}

	/*
	 * 등급 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> gradeselect(String grade) {
		System.out.println("===>  CategoryMapper gradeselect 호출");
		return mybatis.selectList("categoryMap.gradeselect", grade);
	}

	/*
	 * 세부등급 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> grade2select(GradeVO vo) {
		System.out.println("===>  CategoryMapper grade2select 호출");
		return mybatis.selectList("categoryMap.grade2select", vo);
	}

	/*
	 * 나라 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> countryselect(String abroad) {
		System.out.println("===>  CategoryMapper countryselect 호출");
		return mybatis.selectList("categoryMap.countryselect", abroad);
	}

	/*
	 * 판매 리스트 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> sellselect(HeartVO vo) {
		System.out.println("===>  CategoryMapper sellselect 호출");
		return mybatis.selectList("categoryMap.sellselect",vo);
	}

	/*
	 * 카테고리 글 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> category_productselect(HeartVO vo) {
		System.out.println("===>  CategoryMapper category_productselect 호출");
		return mybatis.selectList("categoryMap.category_productselect", vo);
	}

	/*
	 * 모델 글 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> model_productselect(HeartVO vo) {
		System.out.println("===>  CategoryMapper model_productselect 호출");
		return mybatis.selectList("categoryMap.model_productselect", vo);
	}

	/*
	 * 세부모델 글 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> detail_productselect(HeartVO vo) {
		System.out.println("===>  CategoryMapper detail_productselect 호출");
		return mybatis.selectList("categoryMap.detail_productselect", vo);
	}

	/*
	 * 등급 글 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> grade1_productselect(MemberVO vo) {
		System.out.println("===>  CategoryMapper grade1_productselect 호출");
		return mybatis.selectList("categoryMap.grade1_productselect", vo);
	}

	/*
	 * 세부등급 글 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> grade2_productselect(MemberVO vo) {
		System.out.println("===>  CategoryMapper grade2_productselect 호출");
		return mybatis.selectList("categoryMap.grade2_productselect", vo);
	}

	/*
	 * 글 등록 숫자 가져오기
	 */
	@Override
	public int sellcount() {
		System.out.println("===>  CategoryMapper sellcount 호출");
		return mybatis.selectOne("categoryMap.sellcount");
	}

	/*
	 * 나라 글 등록 숫자 가져오기
	 */
	@Override
	public int country_count(String country) {
		System.out.println("===>  CategoryMapper country_count 호출");
		return mybatis.selectOne("categoryMap.country_count",country);
	}

	/*
	 * 검색 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> searchselect(HeartVO vo) {
		System.out.println("===>  CategoryMapper searchselect 호출");
		return mybatis.selectList("categoryMap.searchselect",vo);
	}

	/*
	 * 검색 숫자 가져오기
	 */
	@Override
	public int search_count(String search) {
		System.out.println("===>  CategoryMapper search_count 호출");
		return mybatis.selectOne("categoryMap.search_count", search);
	}

	/*
	 * 찜 목록 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> heartlistselect(HeartVO vo) {
		System.out.println("===>  CategoryMapper heartlistselect 호출");
		return mybatis.selectList("categoryMap.heartlistselect", vo);
	}

	/*
	 * 찜 숫자 가져오기
	 */
	@Override
	public int heartlistcount(HeartVO vo) {
		System.out.println("===>  CategoryMapper heartlistcount 호출");
		return mybatis.selectOne("categoryMap.heartlistcount", vo);
	}

	/*
	 * 최신 등록 글 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> homesellselect(HeartVO vo) {
		System.out.println("===>  CategoryMapper homesellselect 호출");
		return mybatis.selectList("categoryMap.homesellselect", vo);
	}
}
