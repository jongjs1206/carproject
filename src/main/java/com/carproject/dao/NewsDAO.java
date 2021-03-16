package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.HeartVO;
import com.carproject.domain.NewsVO;
import com.carproject.domain.ReplyVO;

public interface NewsDAO {
	List<HashMap<String, Object>> news_list(String page);
	List<HashMap<String, Object>> popularity();
	HashMap<String, Object> newsview(String num);
	int newscount();
	void goodadd(String news_num);
	void goodsub(String news_num);
	void goodinsert(HeartVO vo);
	void gooddelete(HeartVO vo);
	void viewadd(String num);
	String goodselect(HeartVO vo);
	void replyinsert(ReplyVO vo);
	List<HashMap<String, Object>> selectreply(ReplyVO vo);
	int reply_count(String num);
	ReplyVO reply_num(ReplyVO vo);
	void reply_delete(String r_id);
	
	List<NewsVO> adminNews(NewsVO vo);	// 관리자 자동차뉴스 리스트
	void newsDelete(NewsVO vo);			// 관리자 자동차뉴스 삭제
}
