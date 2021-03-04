package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.domain.GradeVO;
import com.carproject.domain.SalesVO;

@Repository("SalesDAO")
public class SalesDAOImpl implements SalesDAO {
	
	 @Autowired 
	 private SqlSessionTemplate mybatis;
	
	@Override
	public void salesInsert(SalesVO vo) {
		System.out.println("===> salesMap salesInsert() 호출");
		mybatis.insert("salesMap.salesInsert", vo);
	}
	
	@Override
	public void salesModify(SalesVO vo) {
		System.out.println("===> salesMap salesModify() 호출");
		mybatis.update("salesMap.salesModify", vo);
	}
	
	@Override
	public void salesDelete(SalesVO vo) {
		System.out.println("===> salesMap salesDelete() 호출");
		mybatis.delete("salesMap.salesDelete", vo);
	}
	
	@Override
	public SalesVO salesCheck(SalesVO vo) {
		System.out.println("===> salesMap salesCheck() 호출");
		return (SalesVO) mybatis.selectOne("salesMap.salesCheck", vo);
	}
	
	
	///////////////////////////////////////////////////////////
	@Override
	public List<HashMap<String, Object>> brandList() {
		System.out.println("===> salesMap brandList() 호출");
		return mybatis.selectList("salesMap.brandList");
	}
	
	@Override
	public List<HashMap<String, Object>> model() {
		System.out.println("===> salesMap model() 호출");
		return mybatis.selectList("salesMap.model");
	}
	
	@Override
	public List<HashMap<String, Object>> detailmodel() {
		System.out.println("===> salesMap detailmodel() 호출");
		return mybatis.selectList("salesMap.detailmodel");
	}
	
	@Override
	public List<HashMap<String, Object>> grade() {
		System.out.println("===> salesMap grade() 호출");
		return mybatis.selectList("salesMap.grade");
	}
	
	@Override
	public List<HashMap<String, Object>> detailgrade() {
		System.out.println("===> salesMap grade() 호출");
		return mybatis.selectList("salesMap.detailgrade");
	}
	
}
