package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.domain.CoinVO;

@Repository("coinqnaDAO")
public class CoinQnaDAOImpl implements CoinQnaDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<HashMap<String, Object>> coinView(String m_id) {
		System.out.println("===> MemberMapper coinView 호출");
		return mybatis.selectList("MemberMAP.coinView", m_id);
	}
	
	@Override
	public List<CoinVO> allCoinList() {
	    System.out.println("===> MemberMapper checkUniqueId  호출");
	    return mybatis.selectList("CoinMap.allCoinList"); 
	}

	@Override
	public List<CoinVO> monthlyCoinList() {
		return mybatis.selectList("CoinMap.monthlyCoin");
	}

	
}
