package com.carproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carproject.domain.CategoryVO;
import com.carproject.service.CategoryService;

@Controller
public class UserController {
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("all/product_list.do")
	public void product_list(Model model) {
		System.out.println("aa");
		List<CategoryVO> category = categoryService.categoryselect();
		for(int i=0; i< category.size(); i++) {
			System.out.println(category.get(i).getJejosa());
		}
	}
}
