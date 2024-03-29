package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.domain.MemberVO;
import com.carproject.domain.SalesVO;

@Repository("SalesDAO")
public class SalesDAOImpl implements SalesDAO {
	
	 @Autowired 
	 private SqlSessionTemplate mybatis;
	
	@Override
	public void salesInsert(SalesVO vo) {						// 글 등록
		System.out.println("===> salesMap salesInsert() 호출");
		mybatis.insert("salesMap.salesInsert", vo);
	}
	
	@Override
	public void salesModify(SalesVO vo) {						// 글 수정
		System.out.println("===> salesMap salesModify() 호출");
		mybatis.update("salesMap.salesModify", vo);
	}
	
	@Override
	public void salesDelete(SalesVO vo) {						// 글 삭제
		System.out.println("===> salesMap salesDelete() 호출");
		mybatis.delete("salesMap.salesDelete", vo);
	}
	
	@Override
	public void salesCheck(SalesVO vo) {						// 글 확인
		System.out.println("===> salesMap salesCheck() 호출");
		mybatis.selectOne("salesMap.salesCheck", vo);
	}
	
	
	//////////////////////////////////////////////////////////////////////////////////////
	@Override
	public List<HashMap<String, Object>> brandList() {					// 제조사
		System.out.println("===> salesMap brandList() 호출");
		return mybatis.selectList("salesMap.brandList");
	}
	
	@Override
	public List<HashMap<String, Object>> model(SalesVO vo) {			// 모델
		System.out.println("===> salesMap model() 호출");
		return mybatis.selectList("salesMap.model", vo);
	}
	
	@Override	
	public List<HashMap<String, Object>> detailmodel(SalesVO vo) {		// 세부모델
		System.out.println("===> salesMap detailmodel() 호출");
		return mybatis.selectList("salesMap.detailmodel", vo);
	}
	
	@Override
	public List<HashMap<String, Object>> grade(SalesVO vo) {			// 등급
		System.out.println("===> salesMap grade() 호출");
		return mybatis.selectList("salesMap.grade", vo);
	}
	
	@Override
	public List<HashMap<String, Object>> detailgrade(SalesVO vo) {		// 세부등급
		System.out.println("===> salesMap detailgrade() 호출");
		return mybatis.selectList("salesMap.detailgrade", vo);
	}
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////
	@Override
	public void uploadBtn(SalesVO vo) {										// 등록하기 버튼
		System.out.println("===> salesMap uploadBtn() 호출");
		mybatis.insert("salesMap.uploadBtn", vo);
	}
	
	@Override
	public int modifyBtn(SalesVO vo) {										// 수정하기 버튼(상세페이지)
		System.out.println("===> salesMap modifyBtn() 호출");
		return mybatis.selectOne("salesMap.modifyBtn");
	}
	
	@Override
	public void saveModify(SalesVO vo) {									// 수정하기 버튼(글 수정 페이지)
		System.out.println("===> salesMap saveModify() 호출");
		mybatis.update("salesMap.modifyBtn");
	}
	
	@Override
	public void deleteBtn(SalesVO vo) {
		System.out.println("===> salesMap deleteBtn() 호출");					// 삭제하기 버튼
		mybatis.delete("salesMap.deleteBtn", vo);
	}
	
	@Override
	public int find_sell_id() {                                 			// 신규부여 될 sell_id
		System.out.println("===> salesMap findSellId() 호출");
	    return mybatis.selectOne("salesMap.findSellId");
	}

	
	//////////////////////////////////////////////////////////////////////////////////////
	@Override
	public SalesVO salesDetail(long num) {									// 상세페이지
		SalesVO sales = mybatis.selectOne("salesMap.salesCheck", num);
		return sales;
	}
	
	@Override
	public void insertAnalysis(HashMap<String, String> analysis) {			// 이미지분석 결과를 해당 판매글의 DB에 입력
		System.out.println("===> salesMap insertAnalysis 호출");
		mybatis.update("salesMap.insertAnalysis", analysis);
	}
	
	@Override
	public void useCoinC(MemberVO vo) {										// 글 등록시 코인 -1 반영 (코인테이블)
		System.out.println("===> salesMap useCoinC 호출");
		mybatis.insert("salesMap.useCoinC", vo);
	}
	
	@Override
	public void useCoinM(MemberVO vo) {										// 글 등록시 코인 -1 반영 (멤버테이블)
		System.out.println("===> salesMap useCoinM 호출");
		mybatis.update("salesMap.useCoinM", vo);
	}
	
	@Override
	public void insertPredict(SalesVO predict) {							// 글 등록시 시세 예측결과를 업데이트
		System.out.println("===> salesMap insertPredict 호출");
		mybatis.update("salesMap.insertPredict", predict);
	}
	

	
}
