package com.carproject.service;

import java.util.List;

import com.carproject.domain.MycarVO;

public interface MycarService {	
	public String selectnow();
	public String selectpath(String day);
	public void updateblackbox();
	public List<MycarVO> selectblackbox();
}