package com.carproject.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carproject.domain.HeartVO;
import com.carproject.domain.MemberVO;
import com.carproject.domain.ReplyVO;
import com.carproject.service.NewsService;

@Controller
public class NewsController {
	@Autowired
	private NewsService newsservice;
	
	@RequestMapping("all/carnewsBoardList.do")
	public void news_list(String page, Model model) {
		int page_re = (Integer.parseInt(page)-1)*15;
		List<HashMap<String, Object>> newslist = newsservice.news_list(Integer.toString(page_re));
		List<HashMap<String, Object>> popularity = newsservice.popularity();
		int newscount = newsservice.newscount();
		
		
		model.addAttribute("newslist", newslist);
		model.addAttribute("popularity", popularity);
		model.addAttribute("newscount", newscount);
		model.addAttribute("page", page);
	}
	
	
	@RequestMapping("all/carnewsBoardview.do")
	public void carnewsBoardview(String num, Model model, HttpSession session) {
		HeartVO vo = new HeartVO();
		if (session.getAttribute("info") != null) {
			MemberVO info = (MemberVO) session.getAttribute("info");
			vo.setM_id(info.getM_id());
		}
		vo.setW_id(Integer.parseInt(num));
		String heart_id = newsservice.goodselect(vo);
		HashMap<String, Object> newsview =  newsservice.newsview(num);
		newsservice.viewadd(num);
		
		ReplyVO rvo = new ReplyVO();
		rvo.setW_id(Integer.parseInt(num));
		rvo.setR_id(0);
		List<HashMap<String, Object>> reply = newsservice.selectreply(rvo);
		
		model.addAttribute("newsview", newsview);
		model.addAttribute("news_num", num);

		if(heart_id!=null){
			model.addAttribute("heart_ok", "1");
		}
		model.addAttribute("reply", reply);
	}
	
	@RequestMapping("all/good_news.do")
	@ResponseBody
	public void good(String id, String news_num) {
		HeartVO vo = new HeartVO();
		vo.setM_id(id);
		vo.setW_id(Integer.parseInt(news_num));
		newsservice.goodadd(news_num);
		newsservice.goodinsert(vo);
	}
	
	@RequestMapping("all/nogood_news.do")
	@ResponseBody
	public void nogood(String id, String news_num) {
		HeartVO vo = new HeartVO();
		vo.setM_id(id);
		vo.setW_id(Integer.parseInt(news_num));
		newsservice.goodsub(news_num);
		newsservice.gooddelete(vo);
	}
	
	@RequestMapping("all/review_insert.do")
	@ResponseBody
	public void review_insert(String id, String w_id, String content) {
		ReplyVO vo = new ReplyVO();
		vo.setWriter(id);
		vo.setW_id(Integer.parseInt(w_id));
		vo.setContent(content);
		newsservice.replyinsert(vo);
	}
}
