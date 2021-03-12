package com.carproject.service;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.SalesVO;

public interface SalesService {
	public void salesInsert(SalesVO vo);	// 글 등록
	
	public void salesModify(SalesVO vo);	// 글 수정
	
	public void salesDelete(SalesVO vo);	// 글 삭제
	
	public void salesCheck(SalesVO vo);		// 글 확인
	
	public List<HashMap<String, Object>> brandList();				// 제조사
	public List<HashMap<String, Object>> model(SalesVO vo);			// 모델
	public List<HashMap<String, Object>> detailmodel(SalesVO vo);	// 세부모델
	public List<HashMap<String, Object>> grade(SalesVO vo);			// 등급
	public List<HashMap<String, Object>> detailgrade(SalesVO vo);	// 세부등급
	
	public void uploadBtn(SalesVO vo);		// 등록하기 버튼
	public void modifyBtn(SalesVO vo);		// 수정하기 버튼
	public void deleteBtn(SalesVO vo);		// 삭제하기 버튼
	
	public SalesVO salesDetail(Long num);  // 상세화면 
	
	//전체 판매글 가져오기
	public List<SalesVO> selectSalesAll();


	
}
