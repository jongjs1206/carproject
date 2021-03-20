package com.carproject.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carproject.dao.LetterDAO;
import com.carproject.domain.LetterVO;
import com.carproject.domain.MemberVO;



@Service("LetterService")
public class LetterServiceImpl implements LetterService{

	
	@Autowired
	private LetterDAO letterDAO;

	/*
	 * 쪽지 등록
	 */
	@Override
	public void insertsend(LetterVO vo) {
		letterDAO.insertsend(vo);
	}

	/*
	 * 받은 쪽지 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> getselect(MemberVO vo) {
		return letterDAO.getselect(vo);
	}

	/*
	 * 보낸 쪽지 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> sendselect(MemberVO vo) {
		return letterDAO.sendselect(vo);
	}

	/*
	 * 받은 쪽지
	 */
	@Override
	public HashMap<String, Object> selectgetnote(String l_id) {
		return letterDAO.selectgetnote(l_id);
	}

	/*
	 * 보낸 쪽지
	 */
	@Override
	public HashMap<String, Object> selectsendnote(String l_id) {
		return letterDAO.selectsendnote(l_id);
	}

	/*
	 * 쪽지 봤을 때
	 */
	@Override
	public void updatesend(String l_id) {
		letterDAO.updatesend(l_id);
	}

	/*
	 * 받은 쪽지 수
	 */
	@Override
	public String getcount(MemberVO vo) {
		return letterDAO.getcount(vo);
	}

	/*
	 * 보낸 쪽지 수
	 */
	@Override
	public String sendcount(MemberVO vo) {
		return letterDAO.sendcount(vo);
	}

	/*
	 * 받은사람 쪽지 삭제
	 */
	@Override
	public void noshowget(String l_id) {
		letterDAO.noshowget(l_id);
		
	}

	/*
	 * 보낸사람 쪽지 삭제
	 */
	@Override
	public void noshowsend(String l_id) {
		letterDAO.noshowsend(l_id);
	}

	/*
	 * 안본 쪽지 수
	 */
	@Override
	public String selectnotecount(String id) {
		return letterDAO.selectnotecount(id);
	}

}