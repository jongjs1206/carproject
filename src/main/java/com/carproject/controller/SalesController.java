package com.carproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carproject.domain.CategoryVO;
import com.carproject.domain.GradeVO;
import com.carproject.domain.MemberVO;
import com.carproject.domain.SalesVO;
import com.carproject.service.CategoryService;
import com.carproject.service.MemberService;
import com.carproject.service.SalesService;

@Controller
public class SalesController {
	
	@Autowired
	private SalesService salesService;	
	
	@Autowired
	private MemberService memberService;	
	
	@Autowired
	private CategoryService categoryService;	
	
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
		List<HashMap<String, Object>> list = salesService.detailgrade(vo);
		System.out.println(vo.getGrade1() + " -> 세부등급리스트");
		System.out.println(vo.getGrade2());		// 왜 null?
		System.out.println("g_id : " + vo.getG_id());
		
		return list;
	}

	
	///////////////////////////////////////////////////////////
	// 상세페이지
	@RequestMapping("all/salesDetail.do")
	public void salesDetail(@RequestParam("num") Long num, Model model) {
		System.out.println("판매글번호 : " + num);
		SalesVO sales  = salesService.salesDetail(num);
		//System.out.println("@@@@@@@ return vo : " + sales.getTitle());
		model.addAttribute("sales", sales);
	}
	
	// 등록하기 버튼
	@RequestMapping("user/uploadSales.do")
	public String uploadBtn(SalesVO vo, MemberVO mvo, GradeVO gvo) {
		/////// m_id값 가져오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = "";
		if (principal instanceof UserDetails) {
		   id = ((UserDetails)principal).getUsername();
		} else {
		   id = principal.toString();
		}
		vo.setM_id(id);
		//System.out.println("글 등록하기 : " + vo.getTitle());
		//System.out.println("아이디: " + vo.getM_id());
		salesService.uploadBtn(vo);
	
		
		/////// 이미지 구글 업로드
		mvo.setM_id(id);
		MemberVO info = memberService.checkUniqueId(mvo);
		
		
		
		String projectId = "sachawon";
		String bucketName = "car_image_for_analysis";		
		String objectName = "salesCarImg/" + info.getM_id() + ".jpg";	// 여기
		String filePath = "C:\\upload\\" + info.getPhoto();
		try {
			//memberService.insertImg(projectId, bucketName, objectName, filePath);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println(objectName);
		//System.out.println(filePath);
		String fileUrl = "https://storage.googleapis.com/car_image_for_analysis/" + objectName;
		System.out.println("파일주소 : " + fileUrl);
		
		////// 다중 이미지 업로드
//		List<MultipartFile> fileList = mtfRequest.getFiles("file");
//
//		String path = "C:\\upload\\";
//		
//		 for (MultipartFile mf : fileList) {
//	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
//	            long fileSize = mf.getSize(); // 파일 사이즈
//
//	            System.out.println("originFileName : " + originFileName);
//	            System.out.println("fileSize : " + fileSize);
//
//	            String safeFile = path + System.currentTimeMillis() + originFileName;
//	            try {
//	                mf.transferTo(new File(safeFile));
//	            } catch (IllegalStateException e) {
//	                e.printStackTrace();
//	            } catch (IOException e) {
//	                e.printStackTrace();
//	            }
//	        }
		
		
		return "redirect:/all/product_list.do";
	}
	
	// 수정하기 버튼 -> m_id값이 같을 때만 버튼이 떠서 수정이 가능해야 함
	@RequestMapping("user/modifySales.do")
	public String modifyBtn(SalesVO vo) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = "";
		if (principal instanceof UserDetails) {
		   id = ((UserDetails)principal).getUsername();
		} else {
		   id = principal.toString();
		}
		vo.setM_id(id);
		
		System.out.println("글 수정하기");
		salesService.modifyBtn(vo);
		
		return "redirect:/user/sales.do";
	}
	
	// 삭제하기 버튼 -> m_id값이 같을 때만 버튼이 떠서 삭제가 가능해야 함
	@RequestMapping("user/deleteSales.do")
	public String deleteBtn(SalesVO vo) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = "";
		if (principal instanceof UserDetails) {
		   id = ((UserDetails)principal).getUsername();
		} else {
		   id = principal.toString();
		}
		vo.setM_id(id);
		
		System.out.println("글 삭제하기");
		salesService.deleteBtn(vo);
		
		return "redirect:/all/product_list.do";
	}
	
	
	///////////////////////////////////////////////////////////
	// 옵션 불러오기
	
	
	
}
