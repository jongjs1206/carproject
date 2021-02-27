package com.carproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carproject.service.CategoryService;

@Controller
public class UserController {
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("all/product_list.do")
	public void product_list(Model model) {
		List<HashMap<String, Object>> category = categoryService.categoryselect();
		model.addAttribute("category",category);
	}
	
	@RequestMapping(value = "all/category.do", method=RequestMethod.POST, produces="application/text;charset=utf8")
	@ResponseBody
	public String category(@RequestBody String category) {
		System.out.println(category);
		return category;
	}
}