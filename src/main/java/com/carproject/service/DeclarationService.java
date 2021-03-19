package com.carproject.service;

import java.util.HashMap;
import java.util.List;

import com.carproject.domain.DeclarationVO;

public interface DeclarationService {
	//신고 보내기
	public void declaration_insert(DeclarationVO vo);
	//신고 가져오기
	public List<HashMap<String, Object>> selectUserReport(DeclarationVO vo);
	//신고 확인
	public int updateDe_ok(DeclarationVO vo);
}