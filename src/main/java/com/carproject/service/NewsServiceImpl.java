package com.carproject.service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.exec.CommandLine;
import org.apache.commons.exec.DefaultExecutor;
import org.apache.commons.exec.PumpStreamHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.carproject.dao.NewsDAO;
import com.carproject.domain.HeartVO;
import com.carproject.domain.NewsVO;
import com.carproject.domain.ReplyVO;

@Service("newsService")
public class NewsServiceImpl implements NewsService{

	@Autowired
	private NewsDAO newsDAO;

	@Override
	public List<HashMap<String, Object>> news_list(String page) {
		return newsDAO.news_list(page);
	}

	@Override
	public int newscount() {
		return newsDAO.newscount();
	}

	@Override
	public List<HashMap<String, Object>> popularity() {
		return newsDAO.popularity();
	}

	@Override
	public HashMap<String, Object> newsview(String num) {
		return newsDAO.newsview(num);
	}

	@Override
	public void goodadd(String news_num) {
		newsDAO.goodadd(news_num);
	}

	@Override
	public void goodsub(String news_num) {
		newsDAO.goodsub(news_num);
	}

	@Override
	public void goodinsert(HeartVO vo) {
		newsDAO.goodinsert(vo);
	}

	@Override
	public void gooddelete(HeartVO vo) {
		newsDAO.gooddelete(vo);
	}

	@Override
	public String goodselect(HeartVO vo) {
		return newsDAO.goodselect(vo);
	}

	@Override
	public void viewadd(String num) {
		newsDAO.viewadd(num);
		
	}

	@Override
	public void replyinsert(ReplyVO vo) {
		newsDAO.replyinsert(vo);
	}

	@Override
	public List<HashMap<String, Object>> selectreply(ReplyVO vo) {
		return newsDAO.selectreply(vo);
	}

	@Override
	public int reply_count(String num) {
		return newsDAO.reply_count(num);
	}

	@Override
	public ReplyVO reply_num(ReplyVO vo) {
		return newsDAO.reply_num(vo);
	}

	@Override
	public void reply_delete(String r_id) {
		newsDAO.reply_delete(r_id);
	}
	
	//////////////////////////////////////////////////////////////////////
	// 관리자 자동차뉴스 리스트 
	@Override
	public List<NewsVO> adminNews(NewsVO vo) {
		return newsDAO.adminNews(vo);
	}

	// 관리자 자동차뉴스 삭제
	@Override
	public void newsDelete(NewsVO vo) {
		newsDAO.newsDelete(vo);
	}
	

}