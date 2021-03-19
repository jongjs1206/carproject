package com.carproject.dao;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.DeclarationVO;

public interface DeclarationDAO {
	
	//신고 보내기
	void declaration_insert(DeclarationVO vo);
	
	//신고 가져오기
	List<HashMap<String, Object>> selectUserReport(DeclarationVO vo);
	
	//신고 확인
	int updateDe_ok(DeclarationVO vo);
}
