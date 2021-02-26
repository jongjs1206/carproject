package com.carproject.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.domain.CategoryVO;

@Repository("CategoryDAO")
public class CategoryDAOImpl implements CategoryDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<CategoryVO> categoryselect() {
		System.out.println("===>  CategoryMapper categoryselect 호출");
		return mybatis.selectList("categoryMap.categoryselect");
	}
}
