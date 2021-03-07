package com.carproject.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.domain.MemberVO;
import com.carproject.domain.SalesVO;



@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	

	@Override
	public int memberInsert(MemberVO vo) {
		System.out.println("===>  MemberMapper userInsert() 호출");
		return mybatis.insert("MemberMAP.insertMember", vo);
	}
	
	@Override
	public MemberVO checkUniqueId(MemberVO vo) {
		System.out.println("===> MemberMapper checkUniqueId 호출");
		return mybatis.selectOne("MemberMAP.checkUniqueId", vo);
	}

	@Override
	public MemberVO selectByEmail(MemberVO vo) {
		System.out.println("===> MemberMapper selectByEmail 호출");
		return mybatis.selectOne("MemberMAP.selectByEmail", vo);
	}

	@Override
	public int addGoogle(MemberVO vo) {
		System.out.println("===>  MemberMapper addGoogle() 호출");
		return mybatis.insert("MemberMAP.addGoogle", vo);
	}
	
	
	
	
	@Override
	public List<HashMap<String, Object>> selectAllsale(MemberVO vo) {
		System.out.println("===>  MemberMapper selectAllsale() 호출");
		return mybatis.selectList("MemberMAP.selectAllsale", vo);
	} 
	@Override
	public List<HashMap<String, Object>> selectMySale(HashMap<String, Object> map) {
		System.out.println("===>  MemberMapper selectMySale() 호출");
		return mybatis.selectList("MemberMAP.selectMySale", map);
	}

	
	

	@Override
	public List<HashMap<String, Object>> allMember() {
	    System.out.println("===> MemberMapper checkUniqueId  호출");
	    return mybatis.selectList("MemberMAP.allMember");
	}
	
	@Override
	public MemberVO pickUserById(String id) {
		System.out.println("===> MemberMapper checkUniqueId  호출");
		return mybatis.selectOne("MemberMAP.pickUserById", id);
	}
	
	@Override
	public void updateMember(MemberVO vo) {
		mybatis.update("MemberMAP.updateMember", vo);
	}
	
	@Override
	public List<HashMap<String, Object>> allAdmin() {
	    System.out.println("===> MemberMapper checkUniqueId  호출");
	    return mybatis.selectList("MemberMAP.allAdmin");
	}
	
	@Override
	public void updateAuthAdmin(String id) {
		mybatis.selectOne("MemberMAP.updateAuthAdmin", id);
	}
	
	@Override
	public void updateAuthUser(String id) {
		mybatis.selectOne("MemberMAP.updateAuthUser", id);
	}
	
	@Override
	public List<HashMap<String, Object>> allBlacklist() {
	    System.out.println("===> MemberMapper checkUniqueId  호출");
	    return mybatis.selectList("MemberMAP.allBlacklist");
	}
	
	@Override
	public void setBlacklist(String id) {
		mybatis.selectOne("MemberMAP.setBlacklist", id);
	}
	
	@Override
	public void setNormal(String id) {
		mybatis.selectOne("MemberMAP.setNormal", id);
	}




	

}
