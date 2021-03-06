package com.carproject.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carproject.service.NewsService;

@Controller
public class NewsController {
	@Autowired
	private NewsService newsservice;
	
	@RequestMapping("all/carnewsBoardList.do")
	public void news_list(String page, Model model) {
		int page_re = (Integer.parseInt(page)-1)*15;
		List<HashMap<String, Object>> newslist = newsservice.news_list(Integer.toString(page_re));
		int newscount = newsservice.newscount();
				
		model.addAttribute("newslist", newslist);
		model.addAttribute("newscount", newscount);
		model.addAttribute("page", page);
	}
}
