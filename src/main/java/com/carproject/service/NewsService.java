package com.carproject.service;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.HeartVO;
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
}