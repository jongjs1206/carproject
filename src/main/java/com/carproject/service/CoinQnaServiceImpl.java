package com.carproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carproject.dao.CoinQnaDAO;
import com.carproject.domain.CoinVO;

@Service("coinqnaService")
public class CoinQnaServiceImpl implements CoinQnaService{

	@Autowired
	private CoinQnaDAO coinqnaDAO;

	/**
	 * 내 코인 정보를 출력
	 */
	@Override
	public List<HashMap<String, Object>> coinView(String m_id) {
		return coinqnaDAO.coinView(m_id);
	}
	
	@Override	
	public List<CoinVO> allCoinList()
	{   
		return coinqnaDAO.allCoinList(); 
	}

	@Override
	public List<CoinVO> monthlyCoinList() {
		return coinqnaDAO.monthlyCoinList();
	}
	
}
