package com.carproject.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carproject.domain.MemberVO;
import com.carproject.domain.SalesVO;
import com.carproject.service.MemberService;
import com.carproject.service.SalesService;

@Controller
public class SalesController {
	
	@Autowired
	private SalesService salesService;	
	
	//////////////////////////////////////////////////////////
	// 제조사
	@RequestMapping("user/sales.do")
	public void brandList(Model model) {
		List<HashMap<String, Object>> list = salesService.brandList();
		model.addAttribute("brandList", list);
		System.out.println("제조사리스트");
	}
	
	// 모델
	@RequestMapping("user/model.do")
	@ResponseBody
	public List<HashMap<String, Object>> model(SalesVO vo) {
		System.out.println(vo.getJejosa() + " -> 모델리스트");
		List<HashMap<String, Object>> list = salesService.model(vo);
		return list;
	}
		
	// 세부모델
	@RequestMapping("user/detailmodel.do")
	@ResponseBody
	public List<HashMap<String, Object>> detailmodel(SalesVO vo) {
		System.out.println(vo.getModel() + " -> 세부모델리스트");
		List<HashMap<String, Object>> list = salesService.detailmodel(vo);
		return list;
	}
	
	// 등급
	@RequestMapping("user/grade.do")
	@ResponseBody
	public List<HashMap<String, Object>> grade(SalesVO vo) {
		System.out.println(vo.getDetail() + " -> 등급리스트");
		List<HashMap<String, Object>> list = salesService.grade(vo);
		return list;
	}
	
	// 세부 등급
	@RequestMapping("user/detailgrade.do")
	@ResponseBody
	public List<HashMap<String, Object>> detailgrade(SalesVO vo) {
		System.out.println(vo.getGrade1() + " -> 세부등급리스트");
		List<HashMap<String, Object>> list = salesService.detailgrade(vo);
		return list;
	}

	
	///////////////////////////////////////////////////////////
	// 상세페이지
	@RequestMapping("all/salesDetail.do")
	public void salesDetail(@RequestParam("num") Long num, Model model) {
		System.out.println("param : " + num);
		SalesVO sales  = salesService.salesDetail(num);
		System.out.println("@@@@@@@ return vo : " + sales.getTitle());
		model.addAttribute("sales", sales);
		//return sales;
	}
	
	/**
	@RequestMapping("all/salesDetail.do")
	public SalesVO salesDetail(SalesVO vo) {
		System.out.println("vo : " + vo.getNum());
		SalesVO sales  = salesService.salesDetail(vo);
		System.out.println("@@@@@@@ return vo : " + sales.getTitle());
		return sales;
	}
	**/
	
	
	// 등록하기 버튼
	@RequestMapping("user/uploadSales.do")
	public String uploadBtn(SalesVO vo) {
		System.out.println("컨트롤러 타나요? : " + vo.getTitle());
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = "";
		if (principal instanceof UserDetails) {
		   id = ((UserDetails)principal).getUsername();
		} else {
		   id = principal.toString();
		}
		vo.setM_id(id);
		
		
		System.out.println("글 등록하기 : " + vo.getTitle());
		salesService.uploadBtn(vo);
		
		// db -> sell table 조회 -> data 화면에 뿌려줌 return vo
		
		//int sellId = 11064;	// db sell table에 있는 sell_id값 하나 임의로 가져옴
		
		// insert 한 데이터 조회
		//SalesVO result = salesService.selectSalesDetail(sellId);
		
		// 01110001100000/01111010000001100/110001011100000000/11100110000000000/011111000000
		// / 기준으로 나눠서
		return "redirect:/all/product_list.do";
	}
	
	// 수정하기 버튼 -> m_id값이 같을 때만 버튼이 떠야함
	/*@RequestMapping("all/reviewDetail.do")
	public String modifyBtn(SalesVO vo) {
		System.out.println("글 수정하기");
		salesService.modifyBtn(vo);
		// return "redirect:/user/sales.do"
	}*/
	
}
