package com.carproject.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carproject.dao.DeclarationDAO;
import com.carproject.domain.DeclarationVO;



@Service("DeclarationService")
public class DeclarationServiceImpl implements DeclarationService{

	
	@Autowired
	private DeclarationDAO declarationDAO;

	@Override
	public void declaration_insert(DeclarationVO vo) {
		declarationDAO.declaration_insert(vo);
	}

}