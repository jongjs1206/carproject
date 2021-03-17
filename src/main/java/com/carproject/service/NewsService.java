package com.carproject.service;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.HeartVO;
import com.carproject.domain.NewsVO;
import com.carproject.domain.ReplyVO;

public interface NewsService {
	public List<HashMap<String, Object>> news_list(String page);
	public List<HashMap<String, Object>> popularity();
	public HashMap<String, Object> newsview(String num);
	public int newscount();
	public void goodadd(String news_num);
	public void goodsub(String news_num);
	public void goodinsert(HeartVO vo);
	public void gooddelete(HeartVO vo);
	public void viewadd(String num);
	public String goodselect(HeartVO vo);
	public void replyinsert(ReplyVO vo);
	public List<HashMap<String, Object>> selectreply(ReplyVO vo);
	public int reply_count(String num);
	public ReplyVO reply_num(ReplyVO vo);
	public void reply_delete(String r_id);
	
	public List<NewsVO> adminNews(NewsVO vo);	// 관리자 자동차뉴스 리스트
	public void newsDelete(NewsVO vo);			// 관리자 자동차뉴스 삭제


}