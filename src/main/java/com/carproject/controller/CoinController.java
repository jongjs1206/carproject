package com.carproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.carproject.domain.CoinVO;
import com.carproject.service.CoinService;

@Controller
public class CoinController {

	@Autowired
	private CoinService coinService;

	// 내 코인 충전 내역 확인 - 쿼리스트링으로 m_id 가져와서 DB 정보 출력
	@RequestMapping("user/coin.do")
	public void coin(@RequestParam("m_id") String m_id, Model model) {
		List<HashMap<String, Object>> list = coinService.coinView(m_id);
		model.addAttribute("coinlist", list);
		System.out.println("===>" + m_id + "의 코인리스트 출력");
	}
	
	
	
	// 관리자
	// 일일 코인 페이지에 매핑 -> coin테이블의 데이터를 모두 출력
	@RequestMapping("admin/dailycoin.do")
	public void coinlist(Model model) {
		List<CoinVO> list = coinService.allCoinList();
		model.addAttribute("coinList", list);
	}
	
	// 관리자
	// 월별 코인량을 불러오기 위한 함수
	@RequestMapping("admin/monthlycoin.do")
	public void monthlyCoinList(Model model) {
		List<CoinVO> list = coinService.monthlyCoinList();
		model.addAttribute("coinList", list);
	}
}
