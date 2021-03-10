package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.domain.CoinVO;
import com.carproject.domain.MemberVO;

@Repository("coinDAO")
public class CoinDAOImpl implements CoinDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	// 내 코인 충전 내역 확인
	@Override
	public List<HashMap<String, Object>> coinView(String m_id) {
		System.out.println("===> CoinMapper coinView 호출");
		return mybatis.selectList("CoinMap.coinView", m_id);
	}
	@Override
	public Integer onlyCoin(String m_id) {
		System.out.println("===> CoinMapper onlyCoin 호출");
		return mybatis.selectOne("CoinMap.onlyCoin", m_id);
	}
	
	// 내 코인 잔여량으로 member 테이블의 coin 수를 업데이트
	@Override
	public void updateCoin(MemberVO vo) {
		System.out.println("===> CoinMapper updateCoin 호출");
		mybatis.update("CoinMap.updateCoin", vo);
	}
	
	// 결제 결과를 DB에 반영 - coin 테이블
	@Override
	public void coinTblUpdate(CoinVO vo) {
		System.out.println("===> CoinMapper insertCoin 호출");
		mybatis.insert("CoinMap.insertCoin", vo);
	}

	// 내 코인 충전 내역 확인 - 기간 별 
	@Override
	public List<HashMap<String, Object>> coinViewPeriod1(HashMap<String, Object> map) {
		System.out.println("===> CoinMapper coinViewPeriod1 호출");
		List<HashMap<String, Object>> list = mybatis.selectList("CoinMap.coinViewPeriod1", map);
		return list;
	}
	@Override
	public List<HashMap<String, Object>> coinViewPeriod2(HashMap<String, Object> map) {
		System.out.println("===> CoinMapper coinViewPeriod2 호출");
		List<HashMap<String, Object>> list = mybatis.selectList("CoinMap.coinViewPeriod2", map);
		return list;
	}
	@Override
	public List<HashMap<String, Object>> coinViewPeriod3(HashMap<String, Object> map) {
		System.out.println("===> CoinMapper coinViewPeriod3 호출");
		List<HashMap<String, Object>> list = mybatis.selectList("CoinMap.coinViewPeriod3", map);
		return list;
	}
	
	
	// 관리자
	// 코인현황 목록 가져오기 - 코인 충전량 불러오기 위한 함수
	@Override
	public List<CoinVO> allCoinList() {
	    System.out.println("===> CoinMapper checkUniqueId  호출");
	    return mybatis.selectList("CoinMap.allCoinList"); 
	}

	// 관리자
	// 코인현황 목록 가져오기 - 월별 코인량을 불러오기 위한 함수
	@Override
	public List<CoinVO> monthlyCoinList() {
		System.out.println("===> CoinMapper checkUniqueId  호출");
		return mybatis.selectList("CoinMap.monthlyCoin");
	}

	
}
