package com.carproject.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carproject.dao.DeclarationDAO;
import com.carproject.domain.DeclarationVO;



@Service("DeclarationService")
public class DeclarationServiceImpl implements DeclarationService{

	
	@Autowired
	private DeclarationDAO declarationDAO;

	/*
	 * 신고 보내기
	 */
	@Override
	public void declaration_insert(DeclarationVO vo) {
		declarationDAO.declaration_insert(vo);
	}

	/*
	 * 신고 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> selectUserReport(DeclarationVO vo) {
		return declarationDAO.selectUserReport(vo);
	}

	/*
	 * 신고 확인
	 */
	@Override
	public int updateDe_ok(DeclarationVO vo) {
		return declarationDAO.updateDe_ok(vo);
	}

}