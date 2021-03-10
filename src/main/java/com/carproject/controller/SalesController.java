package com.carproject.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public String uploadBtn(SalesVO svo, MemberVO mvo, GradeVO gvo, MultipartHttpServletRequest mtfRequest) {
		
		// (1) m_id값 가져오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = "";
		if (principal instanceof UserDetails) {
		   id = ((UserDetails)principal).getUsername();
		} else {
		   id = principal.toString();
		}
		
		// (2) 글 작성하는 id로 작성자정보 가져오기		
		mvo.setM_id(id);
		MemberVO info = memberService.checkUniqueId(mvo);
		System.out.println("글 작성자 정보 : " + info.getM_name() + "님 ID : " + info.getM_id());
		
		// (3) 선택차량의 g_id 확인
		System.out.println("============> g_id : " + gvo.getG_id());
		svo.setM_id(id);
		svo.setStatus("등록대기");
		System.out.println("등록할 글 제목 : " + svo.getTitle());
		System.out.println("등록할 글 상태 : " + svo.getStatus());
		
		// (4) 새 글의 sell_id 확인
		int sell_id = salesService.find_sell_id();
		svo.setSell_id(sell_id);
		System.out.println("============> 신규등록 할 sell_id : " + sell_id);
				
		// (5) 로컬에 사진 저장
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String path = "C:\\upload\\" + sell_id + "\\";
		
		// (5-1) 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		File Folder = new File(path);
		if (!Folder.exists()) {
			try{
			    Folder.mkdir(); //폴더 생성합니다.
			    System.out.println("폴더가 생성되었습니다.");
		        } 
		        catch(Exception e){
			    e.getStackTrace();
			}        
	        }else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
		}
		
		// (5-2) C:\\upload\\sell_id 에 해당하는 로컬 폴더에 사진 파일 업로드
		int cnt = 1;
		String projectId = "sachawon";						// 구글드라이브 저장 정보
		String bucketName = "car_image_for_analysis";		// 구글드라이브 저장 정보
		String objectName = "";
		String filePath = "";
		for (MultipartFile mf : fileList) {
			String originalFileName = mf.getOriginalFilename();	// 원본 파일 명
			long fileSize = mf.getSize();		// 파일 사이즈
			
			String newFileName = "img" + cnt + ".png";			// 새 파일명
			String safeFile = path + newFileName;				// 경로를 포함한 새 파일명

			System.out.println("+++++++++++++ 파일저장 : " + cnt + "번째");
			System.out.println("oroginalFileName : " + originalFileName);
			System.out.println("newFileName : " + safeFile);
			System.out.println("fileSize : " + fileSize);
			
			try {
				mf.transferTo(new File(safeFile));				// 해당 경로에 파일 저장
				
				// (6) 구글드라이브로 이미지 업로드할 정보 지정
				// 완성되는 url : https://storage.cloud.google.com/car_image_for_analysis/1656566/img1.png
				objectName = sell_id + "/img" + cnt + ".png";	
				filePath = "C:\\upload\\" + sell_id + "\\img" + cnt + ".png";	// 사진을 가져올 로컬 경로

				// (7) 구글 드라이브에 사진 저장
				try {
					memberService.insertImg(projectId, bucketName, objectName, filePath);
				} catch (Exception e) {
					System.out.println("사진 파일 구글 드라이브 저장 실패+++++++++++++");
					e.printStackTrace();
				}
				
			} catch(IllegalStateException e) {
				System.out.println("사진 파일 로컬 저장 실패+++++++++++++");
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			cnt += 1;
		}
		
		// (7) 글 등록시 DB에 저장될 img 주소 지정하기
		String fileUrl = "https://storage.cloud.google.com/car_image_for_analysis/" + sell_id +"/";
		svo.setImage(fileUrl);
		System.out.println("사진 파일 저장 URL : " + fileUrl);
		
		// (8) 글 등록
		salesService.uploadBtn(svo);
	
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
