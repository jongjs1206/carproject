package com.carproject.service;

import java.util.HashMap; 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Repository;

import com.carproject.dao.SalesDAOImpl;
import com.carproject.domain.MemberVO;
import com.carproject.domain.SalesVO;

@Repository("SalesService") 
public class SalesServiceImpl implements SalesService {

	@Autowired 
	private SalesDAOImpl salesDAO;

	//////////////////////////////////////////////////////////////////////////////////////
	@Override 
	public void salesInsert(SalesVO vo) {		// 글 등록
		salesDAO.salesInsert(vo);
	}
	
	@Override 
	public void salesModify(SalesVO vo) {		// 글 수정
		salesDAO.salesModify(vo);
	}
	
	@Override 
	public void salesDelete(SalesVO vo) {		// 글 수정
		salesDAO.salesDelete(vo);
	}
	
	@Override 
	public void salesCheck(SalesVO vo) {		// 글 확인
		salesDAO.salesCheck(vo);
	}
	
	
	//////////////////////////////////////////////////////////////////////////////////////
	@Override
	public List<HashMap<String, Object>> brandList(){					// 제조사
		return salesDAO.brandList();
	}
	
	@Override
	public List<HashMap<String, Object>> model(SalesVO vo){				// 모델
		return salesDAO.model(vo);
	}
	
	@Override
	public List<HashMap<String, Object>> detailmodel(SalesVO vo){		// 세부모델
		return salesDAO.detailmodel(vo);
	}
	
	@Override
	public List<HashMap<String, Object>> grade(SalesVO vo){				// 등급
		return salesDAO.grade(vo);
	}
	
	@Override
	public List<HashMap<String, Object>> detailgrade(SalesVO vo){		// 세부등급
		return salesDAO.detailgrade(vo);
	}
		
	//////////////////////////////////////////////////////////////////////////////////////
	@Override
	public void uploadBtn(SalesVO vo){			// 등록하기 버튼
		salesDAO.uploadBtn(vo);
	}
	
	@Override
	public int modifyBtn(SalesVO vo){			// 수정하기 버튼(상세페이지)
		return salesDAO.modifyBtn(vo);
	}
	
	@Override
	public void saveModify(SalesVO vo){			// 수정하기 버튼(글 수정 페이지)
		salesDAO.saveModify(vo);
	}
	
	@Override
	public void deleteBtn(SalesVO vo){			// 삭제하기 버튼
		salesDAO.deleteBtn(vo);
	}
	
	 @Override
	 public int find_sell_id() {            // 신규부여 될 sell_id 
		 return salesDAO.find_sell_id();
	 }

	
	//////////////////////////////////////////////////////////////////////////////////////
	@Override
	public SalesVO salesDetail(Long num) {		// 상세페이지
		return salesDAO.salesDetail(num);
	}
	
}


