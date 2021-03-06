package com.carproject.service;

import com.carproject.domain.MemberVO;

public interface FindService {

	// ID 찾기
	public String findId(MemberVO vo);
	
	// PW 찾기
	public MemberVO findPw(MemberVO vo);
	
	// PW 수정
	public Integer confirmInfo(MemberVO vo);
	public void updatePw(MemberVO vo);
	
}
