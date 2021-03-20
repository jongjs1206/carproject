package com.carproject.service;

import java.util.List;

import com.carproject.domain.MycarVO;

public interface MycarService {	
	//안본 블랙박스
	public String selectnow();
	//블랙박스 리스트 가져오기
	public String selectpath(String day);
	//블랙박스 사진 가져오기
	public void updateblackbox();
	//사진 본걸로 업데이트
	public List<MycarVO> selectblackbox();
}