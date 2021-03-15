package com.carproject.dao;

import java.util.List;

import com.carproject.domain.MycarVO;

public interface MycarDAO {
	String selectnow();
	String selectpath(String day);
	void updateblackbox();
	List<MycarVO> selectblackbox();
}
