package com.carproject.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.domain.MemberVO;

@Repository("findDAO")
public class FindDAOImpl implements FindDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// ID 찾기
	@Override
	public String findId(MemberVO vo) {
		System.out.println("===> FindMapper findId 호출");
		return mybatis.selectOne("FindMap.findId", vo);
	}	
	
	// PW 찾기 :: 1단계
	// 일치하는 정보가 존재하는지 확인 - 없을 경우 null 발생하므로 일치 행 갯수를 먼저 구함
	@Override
	public Integer confirmInfo(MemberVO vo) {
		System.out.println("===> FindMapper confirmInfo 호출");
		return mybatis.selectOne("FindMap.confirmInfo", vo);		
	}
	// PW 찾기 :: 2단계
	// 1단계에서 일치하는 회원정보가 있는지 결과 행 수 구한 뒤 실제 회원정보를 가져옴
	@Override
	public MemberVO findPw(MemberVO vo) {
		System.out.println("===> FindMapper findPw 호출");
		return  mybatis.selectOne("FindMap.findPw", vo);
	}	
	
	// PW 수정
	@Override
	public void updatePw(MemberVO vo) {
		System.out.println("===> FindMapper modifyPw 호출");
		mybatis.update("FindMap.updatePw", vo);
	}

}
