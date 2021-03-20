package com.carproject.service;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.GradeVO;
import com.carproject.domain.HeartVO;
import com.carproject.domain.MemberVO;

public interface CategoryService {
	//카테고리 가져오기
	public List<HashMap<String, Object>> categoryselect();
	//판매 리스트 가져오기
	public List<HashMap<String, Object>> sellselect(HeartVO vo);
	//최신 등록 글 가져오기
	public List<HashMap<String, Object>> homesellselect(HeartVO vo);
	//모델 가져오기
	public List<HashMap<String, Object>> modelselect(String category);
	//세부모델 가져오기
	public List<HashMap<String, Object>> detailselect(String car_num);
	//등급 가져오기
	public List<HashMap<String, Object>> gradeselect(String grade);
	//세부등급 가져오기
	public List<HashMap<String, Object>> grade2select(GradeVO vo);
	//나라 가져오기
	public List<HashMap<String, Object>> countryselect(String abroad);
	//카테고리 글 가져오기
	public List<HashMap<String, Object>> category_productselect(HeartVO vo);
	//모델 글 가져오기
	public List<HashMap<String, Object>> model_productselect(HeartVO vo);
	//세부모델 글 가져오기
	public List<HashMap<String, Object>> detail_productselect(HeartVO vo);
	//등급 글 가져오기
	public List<HashMap<String, Object>> grade1_productselect(MemberVO vo);
	//세부등급 글 가져오기
	public List<HashMap<String, Object>> grade2_productselect(MemberVO vo);
	//검색 가져오기
	public List<HashMap<String, Object>> searchselect(HeartVO vo);
	//찜 목록 가져오기
	public List<HashMap<String, Object>> heartlistselect(HeartVO vo);
	//찜 숫자 가져오기
	public int heartlistcount(HeartVO vo);
	//글 등록 숫자 가져오기
	public int sellcount();
	//나라 글 등록 숫자 가져오기
	public int country_count(String country);
	//검색 숫자 가져오기
	public int search_count(String search);
}