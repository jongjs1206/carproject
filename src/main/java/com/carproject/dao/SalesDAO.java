package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.MemberVO;
import com.carproject.domain.SalesVO;

public interface SalesDAO {
	public void salesInsert(SalesVO vo);		// 글 등록
	
	public void salesModify(SalesVO vo);		// 글 수정
	
	public void salesDelete(SalesVO vo);		// 글 삭제
	
	public void salesCheck(SalesVO vo);		// 글 확인
	
	public List<HashMap<String, Object>> brandList();				// 제조사
	public List<HashMap<String, Object>> model(SalesVO vo);			// 모델
	public List<HashMap<String, Object>> detailmodel(SalesVO vo);	// 세부모델
	public List<HashMap<String, Object>> grade(SalesVO vo);			// 등급
	public List<HashMap<String, Object>> detailgrade(SalesVO vo);	// 세부등급
	
	public int find_sell_id();            // 신규부여 될 sell_id
	public void uploadBtn(SalesVO vo);		// 등록하기 버튼
	public int modifyBtn(SalesVO vo);		// 수정하기 버튼(상세페이지)
	public void saveModify(SalesVO vo);		// 수정하기 버튼(글 수정 페이지)
	public void deleteBtn(SalesVO vo);		// 삭제하기 버튼
	
	public SalesVO salesDetail(long num);	// 상세페이지
	
	public void insertAnalysis(HashMap<String, String> analysis);		// 이미지분석 결과를 해당 판매글의 DB에 입력
	
	// 글 등록시 코인 -1 반영 (코인테이블, 멤버테이블)
	public void useCoinC(MemberVO vo);
	public void useCoinM(MemberVO vo);
}
