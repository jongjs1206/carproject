package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.CoinVO;

public interface CoinQnaDAO {

	List<HashMap<String, Object>> coinView(String m_id);

	// 코인현황 목록 가져오기
	List<CoinVO> allCoinList();

	List<CoinVO> monthlyCoinList();
}
