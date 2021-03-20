package com.carproject.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carproject.dao.MycarDAO;
import com.carproject.domain.MycarVO;



@Service("MycarService")
public class MycarServiceImpl implements MycarService{

	
	@Autowired
	private MycarDAO mycarDAO;

	/*
	 * 안본 블랙박스
	 */
	@Override
	public String selectnow() {
		return mycarDAO.selectnow();
	}

	/*
	 * 블랙박스 리스트 가져오기
	 */
	@Override
	public List<MycarVO> selectblackbox() {
		return mycarDAO.selectblackbox();
	}
	/*
	 * 블랙박스 사진 가져오기
	 */
	@Override
	public String selectpath(String day) {
		return mycarDAO.selectpath(day);
	}

	/*
	 * 사진 본걸로 업데이트
	 */
	@Override
	public void updateblackbox() {
		mycarDAO.updateblackbox();
	}

}