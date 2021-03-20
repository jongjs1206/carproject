package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.domain.LetterVO;
import com.carproject.domain.MemberVO;

@Repository("letterDAO")
public class LetterDAOImpl implements LetterDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	/*
	 * 쪽지 등록
	 */
	@Override
	public void insertsend(LetterVO vo) {
		System.out.println("===>  LetterMAP insertsend() 호출");
		mybatis.insert("LetterMAP.insertsend",vo);
	}

	/*
	 * 받은 쪽지 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> getselect(MemberVO vo) {
		System.out.println("===>  LetterMAP getselect() 호출");
		return mybatis.selectList("LetterMAP.getselect",vo);
	}

	/*
	 * 보낸 쪽지 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> sendselect(MemberVO vo) {
		System.out.println("===>  LetterMAP sendselect() 호출");
		return mybatis.selectList("LetterMAP.sendselect",vo);
	}

	/*
	 * 받은 쪽지
	 */
	@Override
	public HashMap<String, Object> selectgetnote(String l_id) {
		System.out.println("===>  LetterMAP selectgetnote() 호출");
		return mybatis.selectOne("LetterMAP.selectgetnote",l_id);
	}
	
	/*
	 * 보낸 쪽지
	 */
	@Override
	public HashMap<String, Object> selectsendnote(String l_id) {
		System.out.println("===>  LetterMAP selectsendnote() 호출");
		return mybatis.selectOne("LetterMAP.selectsendnote",l_id);
	}

	/*
	 * 쪽지 봤을 때
	 */
	@Override
	public void updatesend(String l_id) {
		System.out.println("===>  LetterMAP updatesend() 호출");
		mybatis.update("LetterMAP.updatesend",l_id);
	}

	/*
	 * 받은 쪽지 수
	 */
	@Override
	public String getcount(MemberVO vo) {
		System.out.println("===>  LetterMAP getcount() 호출");
		return mybatis.selectOne("LetterMAP.getcount",vo);
	}

	/*
	 * 보낸 쪽지 수
	 */
	@Override
	public String sendcount(MemberVO vo) {
		System.out.println("===>  LetterMAP sendcount() 호출");
		return mybatis.selectOne("LetterMAP.sendcount",vo);
	}

	/*
	 * 받은사람 쪽지 삭제
	 */
	@Override
	public void noshowget(String l_id) {
		System.out.println("===>  LetterMAP noshowget() 호출");
		mybatis.update("LetterMAP.noshowget",l_id);
	}

	/*
	 * 보낸사람 쪽지 삭제
	 */
	@Override
	public void noshowsend(String l_id) {
		System.out.println("===>  LetterMAP noshowsend() 호출");
		mybatis.update("LetterMAP.noshowsend",l_id);
	}

	/*
	 * 안본 쪽지 수
	 */
	@Override
	public String selectnotecount(String id) {
		System.out.println("===>  LetterMAP selectnotecount() 호출");
		return mybatis.selectOne("LetterMAP.selectnotecount",id);
	}
}
