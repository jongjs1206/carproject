package com.carproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carproject.service.CoinQnaService;

@Controller
public class CoinQnaController {
	
	@Autowired
	private CoinQnaService coinqnaService;
	
	@RequestMapping(value = "/all/coinlist.do")
	@ResponseBody
//	public List<HashMap<String, Object>> coinlist(String m_id, Model model) {
//		List<HashMap<String, Object>> coinlist = coinqnaService.coinView(m_id);
//		System.out.println("코인리스트");
//		return coinlist;		
//	}
	public void coinlist(String m_id, Model model) {
		model.addAttribute("mycoin", coinqnaService.coinView(m_id));
	}

}
