package com.carproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("{step1}/{step2}.do")
	public String loginPage(@PathVariable String step1,@PathVariable String step2) {
		return step1+"/"+step2;
	}
	
	@RequestMapping("{step1}.do")
	public String loginPage(@PathVariable String step1) {
		return step1;
	}
}
