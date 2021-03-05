package com.carproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carproject.service.SalesService;

@Controller
public class SalesController {
	
	@Autowired
	private SalesService salesService;	

	// 제조사
	@RequestMapping("user/sales.do")
	public void brandList(Model model) {
		List<HashMap<String, Object>> list = salesService.brandList();
		model.addAttribute("brandList", list);
	/*	for(HashMap<String, Object> tempValue : list) {
			for(String key : tempValue.keySet()) {
				System.out.println("키 : " + tempValue.get("jejosa"));
			}
		}	*/
		System.out.println("제조사리스트");
	}
	
	@RequestMapping("user/model.do")
	public List<HashMap<String, Object>> model() {
		List<HashMap<String, Object>> list = salesService.model();
		for(HashMap<String, Object> tempValue : list) {
			for(String key : tempValue.keySet()) {
				System.out.println("키 : " + tempValue.get("model"));
			}
		}
		System.out.println("모델리스트");
		
		return list;
	}
	
	@RequestMapping("user/detailmodel.do")
	public void detailmodel(Model model) {
		List<HashMap<String, Object>> list = salesService.detailmodel();
		model.addAttribute("detailmodel", list);
		System.out.println("세부모델리스트");
	}
	
	@RequestMapping("user/grade.do")
	public void grade(Model model) {
		List<HashMap<String, Object>> list = salesService.grade();
		model.addAttribute("grade", list);
		System.out.println("등급리스트");
	}
	
	@RequestMapping("user/detailgrade.do")
	public void detailgrade(Model model) {
		List<HashMap<String, Object>> list = salesService.detailgrade();
		model.addAttribute("detailgrade", list);
		System.out.println("세부등급리스트");
	}
	
}
