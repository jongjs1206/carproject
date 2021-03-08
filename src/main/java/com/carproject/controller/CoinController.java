package com.carproject.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carproject.domain.CoinVO;
import com.carproject.domain.MemberVO;
import com.carproject.service.CoinService;
import com.carproject.service.MemberService;

@Controller
public class CoinController {

	@Autowired
	private CoinService coinService;
	@Autowired
	private MemberService memberService;

	// 내 코인 충전 내역 확인 - 쿼리스트링으로 m_id 가져와서 DB 정보 출력
	@RequestMapping(value = "user/coin.do")
	public void coin(@RequestParam("m_id") String m_id, Model model) {
		List<HashMap<String, Object>> list = coinService.coinView(m_id);
		Integer onlyCoin = coinService.onlyCoin(m_id);
		
		model.addAttribute("coinlist", list);
		model.addAttribute("onlyCoin", onlyCoin);
		
		System.out.println("===>" + m_id + "의 코인리스트 출력 : " + onlyCoin + "개");
	}
	
	@RequestMapping("user/cointest.do")
	public String cointest() {
		System.out.println("테스트테스트");
		return "all/homepage";
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
