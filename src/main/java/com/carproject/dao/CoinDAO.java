package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.CoinVO;
import com.carproject.domain.MemberVO;

public interface CoinDAO {

	// 내 코인 충전 내역 확인
	List<HashMap<String, Object>> coinView(String m_id);
	Integer onlyCoin(String m_id);
	
	// 내 코인 잔여량으로 member 테이블의 coin 수를 업데이트
	void updateCoin(MemberVO vo);
	
	// 결제 결과를 DB에 반영 - coin 테이블
	void coinTblUpdate(CoinVO vo);
	
	// 내 코인 충전 내역 확인 - 기간 별
	List<HashMap<String, Object>> coinViewPeriod1(HashMap<String, Object> map);
	List<HashMap<String, Object>> coinViewPeriod2(HashMap<String, Object> map);
	List<HashMap<String, Object>> coinViewPeriod3(HashMap<String, Object> map);

	
	// 관리자
	// 코인현황 목록 가져오기 - 코인 충전량 불러오기 위한 함수
	List<CoinVO> allCoinList();
	
	// 관리자
	// 코인현황 목록 가져오기 - 월별 코인량을 불러오기 위한 함수
	List<CoinVO> monthlyCoinList();
	
	
}
