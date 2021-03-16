package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.domain.HeartVO;
import com.carproject.domain.NewsVO;
import com.carproject.domain.ReplyVO;

@Repository("newsDAO")
public class NewsDAOImpl implements NewsDAO{
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<HashMap<String, Object>> news_list(String page) {
		System.out.println("===>  NewsMapper news_list() 호출");
		return mybatis.selectList("NewsMAP.news_list", page);
	}

	@Override
	public int newscount() {
		System.out.println("===>  NewsMapper newscount() 호출");
		return mybatis.selectOne("NewsMAP.newscount");
	}

	@Override
	public List<HashMap<String, Object>> popularity() {
		System.out.println("===>  NewsMapper popularity() 호출");
		return mybatis.selectList("NewsMAP.popularity");
	}

	@Override
	public HashMap<String, Object> newsview(String num) {
		System.out.println("===>  NewsMapper newsview() 호출");
		return mybatis.selectOne("NewsMAP.newsview",num);
	}

	@Override
	public void goodadd(String news_num) {
		System.out.println("===>  NewsMapper goodadd() 호출");
		mybatis.update("NewsMAP.goodadd",news_num);
	}

	@Override
	public void goodsub(String news_num) {
		System.out.println("===>  NewsMapper goodsub() 호출");
		mybatis.update("NewsMAP.goodsub",news_num);
	}

	@Override
	public void goodinsert(HeartVO vo) {
		System.out.println("===>  NewsMapper goodinsert() 호출");
		mybatis.insert("NewsMAP.goodinsert",vo);
	}

	@Override
	public void gooddelete(HeartVO vo) {
		System.out.println("===>  NewsMapper gooddelete() 호출");
		mybatis.delete("NewsMAP.gooddelete",vo);
	}

	@Override
	public String goodselect(HeartVO vo) {
		System.out.println("===>  NewsMapper goodselect() 호출");
		return mybatis.selectOne("NewsMAP.goodselect",vo);
	}

	@Override
	public void viewadd(String num) {
		System.out.println("===>  NewsMapper viewadd() 호출");
		mybatis.update("NewsMAP.viewadd",num);
	}

	@Override
	public void replyinsert(ReplyVO vo) {
		System.out.println("===>  NewsMapper replyinsert() 호출");
		mybatis.insert("NewsMAP.replyinsert",vo);
	}

	@Override
	public List<HashMap<String, Object>> selectreply(ReplyVO vo) {
		System.out.println("===>  NewsMapper selectreply() 호출");
		return mybatis.selectList("NewsMAP.selectreply",vo);
	}

	@Override
	public int reply_count(String num) {
		System.out.println("===>  NewsMapper reply_count() 호출");
		return mybatis.selectOne("NewsMAP.reply_count",num);
	}

	@Override
	public ReplyVO reply_num(ReplyVO vo) {
		System.out.println("===>  NewsMapper reply_num() 호출");
		return mybatis.selectOne("NewsMAP.reply_num",vo);
	}

	@Override
	public void reply_delete(String r_id) {
		System.out.println("===>  NewsMapper reply_delete() 호출");
		mybatis.delete("NewsMAP.reply_delete",r_id);
	}
	
	//////////////////////////////////////////////////////////////////////
	// 관리자 자동차뉴스 리스트
	@Override
	public List<NewsVO> adminNews(NewsVO vo) {
		System.out.println("===>  NewsMapper adminNews() 호출");
		return mybatis.selectList("NewsMAP.adminNews", vo);
	}

	// 관리자 자동차뉴스 삭제
	@Override
	public void newsDelete(NewsVO vo) {
		System.out.println("===>  NewsMapper newsDelete() 호출");
		mybatis.delete("NewsMAP.newsDelete", vo);
	}
}
