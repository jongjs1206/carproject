package com.carproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.carproject.domain.CoinVO;
import com.carproject.service.CoinQnaService;

@Controller
public class CoinQnaController {

	@Autowired
	private CoinQnaService coinqnaService;

//	@RequestMapping(value = "/all/coinlist.do")
//	@ResponseBody
//	public List<HashMap<String, Object>> coinlist(String m_id, Model model) {
//		List<HashMap<String, Object>> coinlist = coinqnaService.coinView(m_id);
//		System.out.println("코인리스트");
//		return coinlist;		
//	}
	@RequestMapping("user/coin.do")
	public void coin(@RequestParam("m_id") String m_id, Model model) {
		List<HashMap<String, Object>> list = coinqnaService.coinView(m_id);
		model.addAttribute("coinlist", list);
		System.out.println("코인리스트" + m_id);
//		return "../user/coin.do";
	}
	
	// 일일 코인 페이지에 매핑 -> coin테이블의 데이터를 모두 출력
	@RequestMapping("admin/dailycoin.do")
	public void coinlist(Model model) {
		List<CoinVO> list = coinqnaService.allCoinList();
		model.addAttribute("coinList", list);
	}
	
	@RequestMapping("admin/monthlycoin.do")
	public void monthlyCoinList(Model model) {
		List<CoinVO> list = coinqnaService.monthlyCoinList();
		model.addAttribute("coinList", list);
	}
}
