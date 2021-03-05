package com.carproject.service;

import java.util.HashMap; 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Repository;

import com.carproject.dao.CategoryDAOImpl;
import com.carproject.dao.SalesDAOImpl;
import com.carproject.domain.GradeVO;
import com.carproject.domain.SalesVO;

@Repository("SalesService") 
public class SalesServiceImpl implements SalesService {

	@Autowired 
	private SalesDAOImpl salesDAO;

	@Override 
	public void salesInsert(SalesVO vo) {
		salesDAO.salesInsert(vo);
	}
	
	@Override 
	public void salesModify(SalesVO vo) {
		salesDAO.salesModify(vo);
	}
	
	@Override 
	public void salesDelete(SalesVO vo) {
		salesDAO.salesDelete(vo);
	}
	
	@Override 
	public SalesVO salesCheck(SalesVO vo) {
		return salesDAO.salesCheck(vo);
	}
	
	@Override
	public List<HashMap<String, Object>> model(){
		return salesDAO.model();
	}
	
	@Override
	public List<HashMap<String, Object>> detailmodel(){
		return salesDAO.detailmodel();
	}
	
	@Override
	public List<HashMap<String, Object>> grade(){
		return salesDAO.grade();
	}
	
	@Override
	public List<HashMap<String, Object>> detailgrade(){
		return salesDAO.detailgrade();
	}
	
	@Override
	public List<HashMap<String, Object>> brandList(){
		return salesDAO.brandList();
	}
}


