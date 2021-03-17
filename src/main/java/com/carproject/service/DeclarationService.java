package com.carproject.service;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.DeclarationVO;

public interface DeclarationService {
	
	public void declaration_insert(DeclarationVO vo);

	public List<HashMap<String, Object>> selectUserReport(DeclarationVO vo);
	
	public int updateDe_ok(DeclarationVO vo);
}