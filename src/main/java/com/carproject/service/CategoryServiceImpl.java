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
	
	/*
	 * 카테고리 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> categoryselect(){
		return categoryDAO.categoryselect();
	}
	
	/*
	 * 모델 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> modelselect(String category) {
		return categoryDAO.modelselect(category);
	}

	/*
	 * 세부모델 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> detailselect(String car_num) {
		return categoryDAO.detailselect(car_num);
	}

	/*
	 * 등급 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> gradeselect(String grade) {
		return categoryDAO.gradeselect(grade);
	}

	/*
	 * 세부등급 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> grade2select(GradeVO vo) {
		return categoryDAO.grade2select(vo);
	}

	/*
	 * 나라 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> countryselect(String abroad) {
		return categoryDAO.countryselect(abroad);
	}

	/*
	 * 판매 리스트 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> sellselect(HeartVO vo) {
		return categoryDAO.sellselect(vo);
	}

	/*
	 * 카테고리 글 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> category_productselect(HeartVO vo) {
		return categoryDAO.category_productselect(vo);
	}

	/*
	 * 모델 글 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> model_productselect(HeartVO vo) {
		return categoryDAO.model_productselect(vo);
	}

	/*
	 * 세부모델 글 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> detail_productselect(HeartVO vo) {
		return categoryDAO.detail_productselect(vo);
	}

	/*
	 * 등급 글 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> grade1_productselect(MemberVO vo) {
		return categoryDAO.grade1_productselect(vo);
	}

	/*
	 * 세부등급 글 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> grade2_productselect(MemberVO vo) {
		return categoryDAO.grade2_productselect(vo);
	}

	/*
	 * 글 등록 숫자 가져오기
	 */
	@Override
	public int sellcount() {
		return categoryDAO.sellcount();
	}

	/*
	 * 나라 글 등록 숫자 가져오기
	 */
	@Override
	public int country_count(String country) {
		return categoryDAO.country_count(country);
	}

	/*
	 * 검색 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> searchselect(HeartVO vo) {
		return categoryDAO.searchselect(vo);
	}

	/*
	 * 검색 숫자 가져오기
	 */
	@Override
	public int search_count(String search) {
		return categoryDAO.search_count(search);
	}

	/*
	 * 찜 목록 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> heartlistselect(HeartVO vo) {
		return categoryDAO.heartlistselect(vo);
	}

	/*
	 * 찜 숫자 가져오기
	 */
	@Override
	public int heartlistcount(HeartVO vo) {
		return categoryDAO.heartlistcount(vo);
	}

	/*
	 * 최신 등록 글 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> homesellselect(HeartVO vo) {
		return categoryDAO.homesellselect(vo);
	}
	
}
