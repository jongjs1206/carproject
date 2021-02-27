package com.carproject.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.carproject.domain.MemberVO;

public interface MemberService {
	
	public int userInsert(MemberVO vo );
	public MemberVO checkUniqueId( MemberVO vo);
	
	
}

