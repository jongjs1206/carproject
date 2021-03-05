package com.carproject.service;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.CoinVO;

public interface CoinQnaService {
	
	public List<HashMap<String, Object>> coinView(String m_id);
	
	// 코인 충전량 불러오기 위한 함수
	public  List<CoinVO> allCoinList() ;
	
	// 월별 코인량을 불러오기 위한 메소드
	public List<CoinVO> monthlyCoinList();
}
