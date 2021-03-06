package com.carproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carproject.dao.CoinDAO;
import com.carproject.domain.CoinVO;

@Service("coinService")
public class CoinServiceImpl implements CoinService{

	@Autowired
	private CoinDAO coinDAO;

	// 내 코인 충전 내역 확인
	@Override
	public List<HashMap<String, Object>> coinView(String m_id) {
		return coinDAO.coinView(m_id);
	}
	
	
	// 관리자
	// 코인 충전량 불러오기 위한 함수
	@Override	
	public List<CoinVO> allCoinList()
	{   
		return coinDAO.allCoinList(); 
	}

	// 관리자
	// 월별 코인량을 불러오기 위한 메소드
	@Override
	public List<CoinVO> monthlyCoinList() {
		return coinDAO.monthlyCoinList();
	}
	
}
