package com.carproject.service;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.CoinVO;
import com.carproject.domain.MemberVO;

public interface CoinService {
		
	// 내 코인 충전 내역 확인
	public List<HashMap<String, Object>> coinView(String m_id);	
	public Integer onlyCoin(String m_id);
	// 내 코인 잔여량으로 member 테이블의 coin 수를 업데이트
	public void updateCoin(MemberVO vo);
	
	
	// 결제 결과를 DB에 반영 - coin 테이블
	public void coinTblUpdate(CoinVO vo);

	
	// 관리자
	// 코인 충전량 불러오기 위한 함수
	public  List<CoinVO> allCoinList() ;
	
	// 관리자
	// 월별 코인량을 불러오기 위한 메소드
	public List<CoinVO> monthlyCoinList();
}
