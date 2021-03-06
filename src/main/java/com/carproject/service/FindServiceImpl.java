package com.carproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carproject.dao.FindDAO;
import com.carproject.domain.MemberVO;

@Service("findService")
public class FindServiceImpl implements FindService{
	
	@Autowired
	private FindDAO findDAO;
	
	// ID 찾기
	@Override
	public String findId(MemberVO vo) {		
		return findDAO.findId(vo);
	}
	
	// PW 찾기 :: 1단계
	@Override
	public MemberVO findPw(MemberVO vo) {		
		return findDAO.findPw(vo);
	}
	// PW 찾기 :: 2단계
	public Integer confirmInfo(MemberVO vo) {
		return findDAO.confirmInfo(vo);
	}
	
	// PW 수정
	public void updatePw(MemberVO vo) {
		findDAO.updatePw(vo);
	}

}
