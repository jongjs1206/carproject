package com.carproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carproject.domain.GradeVO;
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
	
	@RequestMapping("all/category.do")
	@ResponseBody
	public List<HashMap<String, Object>> category(String category) {
		List<HashMap<String, Object>> model = categoryService.modelselect(category);
		return model;
	}
	
	@RequestMapping("all/detail.do")
	@ResponseBody
	public List<HashMap<String, Object>> detail(String car_num) {
		List<HashMap<String, Object>> model_detail = categoryService.detailselect(car_num);
		return model_detail;
	}
	
	@RequestMapping("all/grade.do")
	@ResponseBody
	public List<HashMap<String, Object>> grade(String d_id) {
		List<HashMap<String, Object>> grade = categoryService.gradeselect(d_id);
		return grade;
	}
	
	@RequestMapping("all/grade2.do")
	@ResponseBody
	public List<HashMap<String, Object>> grade2(String d_id ,String grade1) {
		GradeVO vo = new GradeVO();
		vo.setD_id(Integer.parseInt(d_id));
		vo.setGrade1(grade1);
		List<HashMap<String, Object>> grade2 = categoryService.grade2select(vo);
		for (int i = 0; i < grade2.size(); i++) {
			System.out.println(grade2.get(i).get("grade2"));
		}
		return grade2;
	}
}