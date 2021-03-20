package com.carproject.service;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.HeartVO;
import com.carproject.domain.NewsVO;
import com.carproject.domain.ReplyVO;

public interface NewsService {
	//뉴스 불러오기
	public List<HashMap<String, Object>> news_list(String page);
	//좋아요 여부 불러오기 
	public List<HashMap<String, Object>> popularity();
	//뉴스 보기
	public HashMap<String, Object> newsview(String num);
	//뉴스 총 개수
	public int newscount();
	//뉴스 좋아요 갯수 추가
	public void goodadd(String news_num);
	//뉴스 좋아요 갯수 빼기
	public void goodsub(String news_num);
	//좋아요 추가
	public void goodinsert(HeartVO vo);
	//좋아요 취소
	public void gooddelete(HeartVO vo);
	//읽은 수 추가 
	public void viewadd(String num);
	//좋아요 가져오기 
	public String goodselect(HeartVO vo);
	//댓글 달기
	public void replyinsert(ReplyVO vo);
	//댓글 불러오기
	public List<HashMap<String, Object>> selectreply(ReplyVO vo);
	//댓글 수
	public int reply_count(String num);
	//댓글 삭제버튼 여부 
	public ReplyVO reply_num(ReplyVO vo);
	//댓글 삭제
	public void reply_delete(String r_id);

	public List<NewsVO> adminNews(NewsVO vo);	// 관리자 자동차뉴스 리스트
	public void newsDelete(NewsVO vo);			// 관리자 자동차뉴스 삭제


}