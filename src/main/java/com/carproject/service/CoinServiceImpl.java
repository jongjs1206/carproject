package com.carproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carproject.dao.CoinDAO;
import com.carproject.domain.CoinVO;
import com.carproject.domain.MemberVO;

@Service("coinService")
public class CoinServiceImpl implements CoinService{

	@Autowired
	private CoinDAO coinDAO;

	// 내 코인 충전 내역 확인
	@Override
	public List<HashMap<String, Object>> coinView(String m_id) {
		return coinDAO.coinView(m_id);
	}
	@Override
	public Integer onlyCoin(String m_id) {
		return coinDAO.onlyCoin(m_id);
	}
	
	// 내 코인 잔여량으로 member 테이블의 coin 수를 업데이트
	@Override
	public void updateCoin(MemberVO vo) {
		coinDAO.updateCoin(vo);
	}
	
	@Override
	// 결제 결과를 DB에 반영 - coin 테이블
	public void coinTblUpdate(CoinVO vo) {
		coinDAO.coinTblUpdate(vo);
	}

	// 내 코인 충전 내역 - 기간별 확인
	@Override
	public List<HashMap<String, Object>> coinViewPeriod1(HashMap<String, Object> map) {
		return coinDAO.coinViewPeriod1(map);
	}
	@Override
	public List<HashMap<String, Object>> coinViewPeriod2(HashMap<String, Object> map) {
		return coinDAO.coinViewPeriod2(map);
	}
	@Override
	public List<HashMap<String, Object>> coinViewPeriod3(HashMap<String, Object> map) {
		return coinDAO.coinViewPeriod3(map);
	}
	
	
	// 관리자
	// 코인 충전량 불러오기 위한 함수
	@Override	
	public List<HashMap<String, Object>> allCoinList()
	{   
		return coinDAO.allCoinList(); 
	}

	// 관리자
	// 월별 코인량을 불러오기 위한 메소드
	@Override
	public List<HashMap<String, Object>> monthlyCoinList() {
		return coinDAO.monthlyCoinList();
	}
	
}
