package com.carproject.controller;

import java.io.File;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.carproject.domain.GradeVO;
import com.carproject.domain.HeartVO;
import com.carproject.domain.MemberVO;
import com.carproject.domain.SalesVO;
import com.carproject.service.HeartService;
import com.carproject.service.LetterService;
import com.carproject.service.MemberService;
import com.carproject.service.MycarService;
import com.carproject.service.SalesService;



@Controller
public class SalesController {
	
	@Autowired
	private SalesService salesService;	
	@Autowired
	private MemberService memberService;
	@Autowired
	private MycarService mycarService;
	@Autowired
	private LetterService letterService;
	@Autowired
	private HeartService heartService;
	
	String[] alloption = { "선루프", "파노라마선루프", "알루미늄휠", "전동사이드미러", "HID램프", "LED헤드램프", "어댑티드헤드램프", "LED리어램프", "데이라이트",
			"하이빔어시스트", "압축도어", "자동슬라이딩도어", "전동사이드스탭", "루프랙", "가죽시트", "전동시트(운전석)", "전동시트(동승석)", "열선시트(앞좌석)", "열선시트(뒷좌석)",
			"통풍시트", "메모리시트", "폴딩시트", "마사지시트", "워크인시트", "요추받침", "하이패스룸미러", "ECM룸미러", "뒷자석에어벤트", "패들쉬프트", "전동햇빛가리개",
			"엠비언트라이트", "동승석에어백", "측면에어백", "커튼에어백", "무릎에어백", "승객감지에어백", "브레이크잠금방지(ABS)", "차체자세제어장치(ESC)", "후방센서", "전방센서",
			"후방카메라", "전방카메라", "어라운드뷰", "타이어공기압감지(TPMS)", "차선이탈경보(LDWS)", "자동긴급제동", "전자제어서스펜션(ECS)", "후측방경보",
			"미끄럼방지(TCS)", "스마트키", "열선핸들", "리모컨핸들", "자동에어컨", "좌우독립에어컨", "오토라이트", "크루즈컨트롤", "스마트크루즈컨트롤", "스탑앤고", "전동트렁크",
			"스마트트렁크", "전자주차브레이크(EPB)", "경사로밀림방지", "헤드업디스플레이(HUD)", "무선충전", "자동주차", "냉장고", "네비게이션(순정)", "네비게이션(비순정)",
			"USB", "AUX", "블루투스", "MP3", "DMB", "CD플레이어", "AV시스템", "뒷좌석TV", "텔레매틱스", "스마트폰미러링" };
	
	//////////////////////////////////////////////////////////
	// 제조사 리스트
	@RequestMapping("user/sales.do")
	public String brandList(Model model,HttpSession session) {
		
		// (1) m_id값 가져오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = "";
		if (principal instanceof UserDetails) {
			id = ((UserDetails)principal).getUsername();
	    } else {
	    	id = principal.toString();
	    }

		// (2) 글 작성하는 id로 작성자정보 가져오기      
		MemberVO mvo = new MemberVO();
		mvo.setM_id(id);
		MemberVO info = memberService.checkUniqueId(mvo);
		System.out.println("글 작성자 정보 : " + info.getM_name() + "님 ID : " + info.getM_id());
		
		// (3) 코인 충전량이 있는지 확인 -- 코인이 없을 경우 코인충전페이지로 이동
		String coin = info.getCoin();
		System.out.println("코인검사 : " + coin);
		String zero = "0";
		if (coin.equals(zero)) {
			System.out.println("충전된 코인이 없습니다.");
			return "redirect:/all/alert.do";
		}
		
		List<HashMap<String, Object>> list = salesService.brandList();
		model.addAttribute("brandList", list);
		
		// 연식
		List<String> array = new ArrayList<String>();
		int total = 2021-1950;
		for (int i=0; i<total; i++) {			
			String year = String.valueOf(2021 - i);
			array.add(year);
		}
		
		String crash = mycarService.selectnow();
		session.setAttribute("crash", crash);
		
		String user_id="";
		if(session.getAttribute("info")!=null) {
			user_id=((MemberVO)session.getAttribute("info")).getM_id();
		}
		
		String note = letterService.selectnotecount(user_id);
		session.setAttribute("note", note);
		
		model.addAttribute("arr", array);
		
		System.out.println("제조사리스트");
		
		return null;
	}
	
	// 모델 리스트
	@RequestMapping("user/model.do")
	@ResponseBody
	public List<HashMap<String, Object>> model(SalesVO vo) {
		System.out.println(vo.getJejosa() + " -> 모델리스트");
		List<HashMap<String, Object>> list = salesService.model(vo);
		return list;
	}
		
	// 세부모델 리스트
	@RequestMapping("user/detailmodel.do")
	@ResponseBody
	public List<HashMap<String, Object>> detailmodel(SalesVO vo) {
		System.out.println(vo.getModel() + " -> 세부모델리스트");
		List<HashMap<String, Object>> list = salesService.detailmodel(vo);
		return list;
	}
	
	// 등급 리스트
	@RequestMapping("user/grade.do")
	@ResponseBody
	public List<HashMap<String, Object>> grade(SalesVO vo) {
		System.out.println(vo.getDetail() + " -> 등급리스트");
		List<HashMap<String, Object>> list = salesService.grade(vo);
		return list;
	}
	
	// 세부 등급 리스트
	@RequestMapping("user/detailgrade.do")
	@ResponseBody
	public List<HashMap<String, Object>> detailgrade(SalesVO vo) {
		List<HashMap<String, Object>> list = salesService.detailgrade(vo);
		System.out.println(vo.getGrade1() + " -> 세부등급리스트");
		
		return list;
	}

	
	
	///////////////////////////////////////////////////////////
	// 불러온 사진의 url을 리스트에 담는 함수
	public HashMap<String, Object>   getPhotoUrl(int index, String url){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("index", index);
		map.put("url", url);
		return map;
	}	

	ArrayList nowlist = new ArrayList();
	ArrayList numlist = new ArrayList();
	
		
	@RequestMapping("all/side_del.do")
	@ResponseBody
	public void side_del(String number, HttpSession session) {
		SalesVO sales  = salesService.salesDetail(Long.parseLong(number));
		 ArrayList templist = new ArrayList();
		 templist.add(Long.parseLong(number));
		 templist.add(sales.getImage());
		 numlist.remove(Long.parseLong(number));
		 nowlist.remove(templist);
		session.setAttribute("nowlist", nowlist);
	}
	
	@RequestMapping("all/side_null.do")
	@ResponseBody
	public void side_null(String number,HttpSession session) {
		SalesVO sales  = salesService.salesDetail(Long.parseLong(number));
		 ArrayList templist = new ArrayList();
		 templist.add(Long.parseLong(number));
		 templist.add(sales.getImage());
		 numlist.remove(Long.parseLong(number));
		 nowlist.remove(templist);
		session.removeAttribute("nowlist");
	}
		
	/*
	 * 상세페이지 => sell_id값으로 불러옴
	 */
	@RequestMapping("all/salesDetail.do")
	public void salesDetail(@RequestParam("num") Long num, Model model, HttpSession session) {	
		SalesVO sales  = salesService.salesDetail(num);
		model.addAttribute("sales", sales);
		System.out.println(sales.getOption());
		 if(!(numlist.contains(num))){
			 ArrayList templist = new ArrayList();
			 templist.add(num);
			 templist.add(sales.getImage());
			 numlist.add(0,num);
			 nowlist.add(0,templist);
		 }else {
			 ArrayList templist = new ArrayList();
			 templist.add(num);
			 templist.add(sales.getImage());
			 numlist.remove(num);
			 nowlist.remove(templist);
			 numlist.add(0,num);
			 nowlist.add(0,templist);
		 }
		
		session.setAttribute("nowlist", nowlist);
		// 메인 이미지
		// 사진 파일 주소 정제
		String raw_url = sales.getImage();
		String final_url = raw_url.replace("https://storage.googleapis.com/car_image_for_analysis/", "https://storage.cloud.google.com/car_image_for_analysis/");
		model.addAttribute("mainphoto", final_url);	// String 값 : 폴더명에 해당하는 숫자 0000000

		// 이미지 업로드 수 대로만 뜨게 (썸네일)
		// 사진 갯수 확인
		List<HashMap<String, Object>> photoArr = new ArrayList<HashMap<String, Object>>();
		for (int i = 1; i < 7; i++) {
			String photo_url = raw_url + "img" + i + ".png";   //img1~img20 까지의 주소 만들기      
			try {
				URL url = new URL(photo_url);

				// 해당 URL이 있으면 200에러, 없으면 404에러 responseCode
				URLConnection con = url.openConnection();
				HttpURLConnection exitCode = (HttpURLConnection)con;
				int responseCode = exitCode.getResponseCode();

				if(responseCode == 200){
					photoArr.add(getPhotoUrl(i, photo_url));   // 사진이 있을 경우 배열에 추가
				}else {
					System.out.println("문제발생" + responseCode);
				}
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println(photo_url);
				System.out.println("예외 발생");
			}
		}	// end of for 문
		model.addAttribute("allphoto", photoArr);

		// 옵션값 불러오기
		StringBuffer temp = new StringBuffer();
		String option = sales.getOption();
		ArrayList result_option = new ArrayList();
		if(option == null || option.length() < 10) {		// 옵션값이 없을때 옵션값을 0으로 처리
			for (int i = 0; i < 78; i++) {
				result_option.add("0");
			}
		} else {											// 옵션값이 있을 때 
			if (option.split("/").length > 0) {
				for (int j = 0; j < option.split("/").length; j++) {
					temp.append(option.split("/")[j]);
				}
				for (int k = 0; k < temp.length(); k++) {
					result_option.add(Character.toString(temp.charAt(k)));
				}
			}
		}
		HeartVO hvo = new HeartVO();
		
		String user_id="";
		if(session.getAttribute("info")!=null) {
			user_id=((MemberVO)session.getAttribute("info")).getM_id();
		}
		
		hvo.setM_id(user_id);
		hvo.setSell_id(num.intValue());
		String heart = heartService.seletheartone(hvo);
		model.addAttribute("result_option", result_option);
		model.addAttribute("heart", heart);
	}
	
	
	/*
	 * 등록하기 버튼
	 */
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
		String projectId = "sachawon";                  // 구글드라이브 저장 정보
		String bucketName = "car_image_for_analysis";      // 구글드라이브 저장 정보
		String objectName = "";
		String filePath = "";
		for (MultipartFile mf : fileList) {
			String originalFileName = mf.getOriginalFilename();   // 원본 파일 명
			long fileSize = mf.getSize();      // 파일 사이즈

			String newFileName = "img" + cnt + ".png";         // 새 파일명
			String safeFile = path + newFileName;            // 경로를 포함한 새 파일명

			System.out.println("+++++++++++++ 파일저장 : " + cnt + "번째");
			System.out.println("oroginalFileName : " + originalFileName);
			System.out.println("newFileName : " + safeFile);
			System.out.println("fileSize : " + fileSize);

			try {
				mf.transferTo(new File(safeFile));            // 해당 경로에 파일 저장

				// (6) 구글드라이브로 이미지 업로드할 정보 지정
				// 완성되는 url : https://storage.cloud.google.com/car_image_for_analysis/1656566/img1.png
				objectName = sell_id + "/img" + cnt + ".png";   
				filePath = "C:\\upload\\" + sell_id + "\\img" + cnt + ".png";   // 사진을 가져올 로컬 경로

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
		
		// 이미지 분석
		// (9) 파이썬으로 sell_id 보내기 -> 파이썬에서 검사 -> 결과를 수신
		String v_result = "";
		try {
			v_result = salesService.pystart(Integer.toString(sell_id));
			System.out.println("이미지 분석 결과 : " + v_result);
			
			// 글 번호와 분석결과(T/F)를 해쉬맵에 담아서 mapper로 전달, DB 입력
			HashMap<String, String> analysis = new HashMap<String, String>();
			analysis.put("sell_id", Integer.toString(sell_id));
			analysis.put("v_result", v_result);
			salesService.insertAnalysis(analysis);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		// (10) 글 등록시 코인 -1 반영 (코인테이블, 멤버테이블)
		salesService.useCoinC(info);
		salesService.useCoinM(info);
		
		// (11) 시세 예측
		try {
			// 당해년도 ~ 6년뒤 시세 구하기 - VO에 시세결과 4개 담음
			SalesVO predict = salesService.predict(svo);
			predict.setSell_id(sell_id);
			// sell 테이블에 시세 DB 입력
			salesService.insertPredict(predict);
			

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/all/product_list.do";
	}

	
	/*
	 * 상세페이지에 있는
	 * 수정하기 버튼 => 수정할 글의 데이터 셋팅
	 */
	@RequestMapping("user/salesModify.do")
	public void modifyBtn(@RequestParam("num") Long num, Model model) {
		// sell_id(num)으로 빈칸에 데이터 넣기 
		SalesVO sales  = salesService.salesDetail(num);
		model.addAttribute("sales", sales);
		
		// 연식
		List<String> array = new ArrayList<String>();
		int total = 2021-1950;
		for (int i=0; i<total; i++) {			
			String year = String.valueOf(2021 - i);
			array.add(year);
		}

		model.addAttribute("arr", array);
		
		// 차량명 - 제조사 불러오기
		List<HashMap<String, Object>> list = salesService.brandList();
		model.addAttribute("brandList", list);	
		
		// 사진 파일 주소 정제
		String raw_url = sales.getImage();
		String final_url = raw_url.replace("https://storage.googleapis.com/car_image_for_analysis/", "https://storage.cloud.google.com/car_image_for_analysis/");

		// 사진 6장에 해당하는 주소 만들어 allphoto 라는 이름의 model 에 담기
		List<HashMap<String, Object>> photoArr = new ArrayList<HashMap<String, Object>>();
		for (int i = 1; i < 7; i++) {
			String photo_url = raw_url + "img" + i + ".png";   //img1~img20 까지의 주소 만들기      
			try {
				URL url = new URL(photo_url);

				// 해당 URL이 있으면 200에러, 없으면 404에러 responseCode
				URLConnection con = url.openConnection();
				HttpURLConnection exitCode = (HttpURLConnection)con;
				int responseCode = exitCode.getResponseCode();

				if(responseCode == 200){
					photoArr.add(getPhotoUrl(i, photo_url));   // 사진이 있을 경우 배열에 추가
				}else {
					System.out.println("문제발생" + responseCode);
				}
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println(photo_url);
				System.out.println("예외 발생");
			}
		}	// end of for 문
		model.addAttribute("allphoto", photoArr);
		
		// 옵션값 불러오기
		StringBuffer temp = new StringBuffer();
		String option = sales.getOption();
		ArrayList result_option = new ArrayList();
		if(option == null || option.length() < 10) {		// 옵션값이 없을때 옵션값을 0으로 처리
			for (int i = 0; i < 78; i++) {
				result_option.add("0");
			}
		} else {											// 옵션값이 있을 때 
			if (option.split("/").length > 0) {
				for (int j = 0; j < option.split("/").length; j++) {
					temp.append(option.split("/")[j]);
				}
				for (int k = 0; k < temp.length(); k++) {
					result_option.add(Character.toString(temp.charAt(k)));
				}
			}
		}
		model.addAttribute("result_option", result_option);
		
		System.out.println(result_option);
	}
	
	
	/*
	 * 수정 페이지에 있는 
	 * 수정하기 버튼 => 업데이트
	 */
	@RequestMapping("all/salesUpdate.do")
	public String salesUpdate(SalesVO svo, MemberVO mvo, GradeVO gvo, MultipartHttpServletRequest mtfRequest) {
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
		int sell_id = svo.getSell_id();

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
		} else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
		}

		// (5-2) C:\\upload\\sell_id 에 해당하는 로컬 폴더에 사진 파일 업로드
		int cnt = 1;
		String projectId = "sachawon";                  // 구글드라이브 저장 정보
		String bucketName = "car_image_for_analysis";      // 구글드라이브 저장 정보
		String objectName = "";
		String filePath = "";
		for (MultipartFile mf : fileList) {
			String originalFileName = mf.getOriginalFilename();   // 원본 파일 명
			long fileSize = mf.getSize();      // 파일 사이즈

			String newFileName = "img" + cnt + ".png";         // 새 파일명
			String safeFile = path + newFileName;            // 경로를 포함한 새 파일명

			System.out.println("+++++++++++++ 파일저장 : " + cnt + "번째");
			System.out.println("oroginalFileName : " + originalFileName);
			System.out.println("newFileName : " + safeFile);
			System.out.println("fileSize : " + fileSize);

			try {
				mf.transferTo(new File(safeFile));            // 해당 경로에 파일 저장

				// (6) 구글드라이브로 이미지 업로드할 정보 지정
				// 완성되는 url : https://storage.cloud.google.com/car_image_for_analysis/1656566/img1.png
				objectName = sell_id + "/img" + cnt + ".png";   
				filePath = "C:\\upload\\" + sell_id + "\\img" + cnt + ".png";   // 사진을 가져올 로컬 경로

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
		
		// (8) 글 수정
		salesService.salesModify(svo);
		
		// 이미지 분석
		// (9) 파이썬으로 sell_id 보내기 -> 파이썬에서 검사 -> 결과를 수신
		String v_result = salesService.pystart(Integer.toString(sell_id));
		System.out.println("이미지 분석 결과 : " + v_result);

		// 글 번호와 분석결과(T/F)를 해쉬맵에 담아서 mapper로 전달, DB 입력
		HashMap<String, String> analysis = new HashMap<String, String>();
		analysis.put("sell_id", Integer.toString(sell_id));
		analysis.put("v_result", v_result);
		salesService.insertAnalysis(analysis);
		
		System.out.println("수정 글번호" + svo.getSell_id());
		
		return "redirect:/user/my_sales.do";	// 수정 후 내 판매글로
	}
	
	
	/*
	 * 삭제하기 버튼 
	 */
	@RequestMapping("user/deleteSales.do")
	public String deleteBtn(@RequestParam("num") int num, SalesVO vo) {
		//// m_id값 가져오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = "";
		if (principal instanceof UserDetails) {
		   id = ((UserDetails)principal).getUsername();
		} else {
		   id = principal.toString();
		}
		
		vo.setM_id(id);
		vo.setSell_id(num);		
		
		salesService.deleteBtn(vo);
		
		System.out.println("삭제 글번호" + num);
		
		return "redirect:/user/my_sales.do";	// 삭제 후 내 판매글로
	}
	
}
