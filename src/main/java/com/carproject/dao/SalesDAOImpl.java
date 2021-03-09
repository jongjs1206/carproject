package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		System.out.println(vo.getModel());
		return mybatis.selectList("salesMap.model", vo);
	}
	
	@Override	
	public List<HashMap<String, Object>> detailmodel(SalesVO vo) {		// 세부모델
		System.out.println("===> salesMap detailmodel() 호출");
		System.out.println(vo.getDetail());
		return mybatis.selectList("salesMap.detailmodel", vo);
	}
	
	@Override
	public List<HashMap<String, Object>> grade(SalesVO vo) {			// 등급
		System.out.println("===> salesMap grade() 호출");
		System.out.println(vo.getGrade1());
		return mybatis.selectList("salesMap.grade", vo);
	}
	
	@Override
	public List<HashMap<String, Object>> detailgrade(SalesVO vo) {		// 세부등급
		System.out.println("===> salesMap detailgrade() 호출");
		System.out.println(vo.getGrade2());
		return mybatis.selectList("salesMap.detailgrade", vo);
	}
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////
	@Override
	public void uploadBtn(SalesVO vo) {										// 등록하기 버튼
		System.out.println("===> salesMap uploadBtn() 호출");
		System.out.println(vo.getM_id()); 
		mybatis.insert("salesMap.uploadBtn", vo);
	}
	
	@Override
	public void modifyBtn(SalesVO vo) {										// 수정하기 버튼
		System.out.println("===> salesMap modifyBtn() 호출");
		mybatis.update("salesMap.modifyBtn", vo);
	}
	
	@Override
	public void deleteBtn(SalesVO vo) {
		System.out.println("===> salesMap deleteBtn() 호출");					// 삭제하기 버튼
		mybatis.update("salesMap.deleteBtn", vo);
	}
	
	//////////////////////////////////////////////////////////////////////////////////////
	@Override
	public SalesVO salesDetail(Long num) {									// 상세페이지
		SalesVO sales  = mybatis.selectOne("salesMap.salesCheck", num);
		return sales;
	}
}
