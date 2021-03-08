package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.CoinVO;

public interface CoinDAO {

	// 내 코인 충전 내역 확인
	List<HashMap<String, Object>> coinView(String m_id);
	Integer onlyCoin(String m_id);

	
	// 관리자
	// 코인현황 목록 가져오기 - 코인 충전량 불러오기 위한 함수
	List<CoinVO> allCoinList();
	
	// 관리자
	// 코인현황 목록 가져오기 - 월별 코인량을 불러오기 위한 함수
	List<CoinVO> monthlyCoinList();
	
	
}
