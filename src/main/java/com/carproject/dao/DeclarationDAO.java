package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.DeclarationVO;

public interface DeclarationDAO {
	
	void declaration_insert(DeclarationVO vo);

	List<HashMap<String, Object>> selectUserReport(DeclarationVO vo);
	
	int updateDe_ok(DeclarationVO vo);
	

}
