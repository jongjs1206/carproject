package com.carproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carproject.service.CategoryService;

@Controller
public class UserController {
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("all/product_list.do")
	public void product_list(Model model) {
		List<HashMap<String, Object>> category = categoryService.categoryselect();
		for (int i = 0; i < category.size(); i++) {
			System.out.println(category.get(i).get("jejosa"));
		}
	}
}
