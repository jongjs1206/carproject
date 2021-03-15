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

}