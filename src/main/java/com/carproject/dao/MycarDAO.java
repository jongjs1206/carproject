package com.carproject.dao;

import java.util.List;

import com.carproject.domain.MycarVO;

public interface MycarDAO {
	//안본 블랙박스
	String selectnow();
	//블랙박스 리스트 가져오기
	String selectpath(String day);
	//블랙박스 사진 가져오기
	void updateblackbox();
	//사진 본걸로 업데이트
	List<MycarVO> selectblackbox();
}
