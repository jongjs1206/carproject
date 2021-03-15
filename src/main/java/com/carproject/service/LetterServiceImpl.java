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

	@Override
	public void insertsend(LetterVO vo) {
		letterDAO.insertsend(vo);
	}

	@Override
	public List<HashMap<String, Object>> getselect(MemberVO vo) {
		return letterDAO.getselect(vo);
	}

	@Override
	public List<HashMap<String, Object>> sendselect(MemberVO vo) {
		return letterDAO.sendselect(vo);
	}

	@Override
	public HashMap<String, Object> selectgetnote(String l_id) {
		return letterDAO.selectgetnote(l_id);
	}
	
	@Override
	public HashMap<String, Object> selectsendnote(String l_id) {
		return letterDAO.selectsendnote(l_id);
	}

	@Override
	public void updatesend(String l_id) {
		letterDAO.updatesend(l_id);
	}

	@Override
	public String getcount(MemberVO vo) {
		return letterDAO.getcount(vo);
	}

	@Override
	public String sendcount(MemberVO vo) {
		return letterDAO.sendcount(vo);
	}

	@Override
	public void noshowget(String l_id) {
		letterDAO.noshowget(l_id);
		
	}

	@Override
	public void noshowsend(String l_id) {
		letterDAO.noshowsend(l_id);
	}

	@Override
	public String selectnotecount(String id) {
		return letterDAO.selectnotecount(id);
	}

}