package com.carproject.service;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.GradeVO;
import com.carproject.domain.SalesVO;

public interface SalesService {
	public void salesInsert(SalesVO vo);	// 글 등록
	
	public void salesModify(SalesVO vo);	// 글 수정
	
	public void salesDelete(SalesVO vo);	// 글 삭제
	
	public SalesVO salesCheck(SalesVO vo);	// 글 확인
	
	public List<HashMap<String, Object>> brandList();	// 제조사
	public List<HashMap<String, Object>> model();	// 모델
	public List<HashMap<String, Object>> detailmodel();	// 세부모델
	public List<HashMap<String, Object>> grade();	// 등급
	public List<HashMap<String, Object>> detailgrade();	// 세부등급
	
}
