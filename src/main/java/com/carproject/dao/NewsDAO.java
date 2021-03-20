package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.HeartVO;
import com.carproject.domain.NewsVO;
import com.carproject.domain.ReplyVO;

public interface NewsDAO {
	//뉴스 불러오기
	List<HashMap<String, Object>> news_list(String page);
	//좋아요 여부 불러오기 
	List<HashMap<String, Object>> popularity();
	//뉴스 보기
	HashMap<String, Object> newsview(String num);
	//뉴스 총 개수
	int newscount();
	//뉴스 좋아요 갯수 추가
	void goodadd(String news_num);
	//뉴스 좋아요 갯수 빼기
	void goodsub(String news_num);
	//좋아요 추가
	void goodinsert(HeartVO vo);
	//좋아요 취소
	void gooddelete(HeartVO vo);
	//읽은 수 추가 
	void viewadd(String num);
	//좋아요 가져오기 
	String goodselect(HeartVO vo);
	//댓글 달기
	void replyinsert(ReplyVO vo);
	//댓글 불러오기
	List<HashMap<String, Object>> selectreply(ReplyVO vo);
	//댓글 수
	int reply_count(String num);
	//댓글 삭제버튼 여부 
	ReplyVO reply_num(ReplyVO vo);
	//댓글 삭제
	void reply_delete(String r_id);

	
	List<NewsVO> adminNews(NewsVO vo);	// 관리자 자동차뉴스 리스트
	void newsDelete(NewsVO vo);			// 관리자 자동차뉴스 삭제
}
