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
import org.springframework.web.bind.annotation.ResponseBody;

import com.carproject.domain.GradeVO;
import com.carproject.domain.HeartVO;
import com.carproject.domain.LetterVO;
import com.carproject.domain.MemberVO;
import com.carproject.domain.MycarVO;
import com.carproject.service.CategoryService;
import com.carproject.service.HeartService;
import com.carproject.service.LetterService;
import com.carproject.service.MemberService;
import com.carproject.service.MycarService;

@Controller
public class UserController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private HeartService heartService;
	@Autowired
	private MycarService mycarService;
	@Autowired
	private LetterService letterService;
	
	String[] alloption = { "선루프", "파노라마선루프", "알루미늄휠", "전동사이드미러", "HID램프", "LED헤드램프", "어댑티드헤드램프", "LED리어램프", "데이라이트",
			"하이빔어시스트", "압축도어", "자동슬라이딩도어", "전동사이드스탭", "루프랙", "가죽시트", "전동시트(운전석)", "전동시트(동승석)", "열선시트(앞좌석)", "열선시트(뒷좌석)",
			"통풍시트", "메모리시트", "폴딩시트", "마사지시트", "워크인시트", "요추받침", "하이패스룸미러", "ECM룸미러", "뒷자석에어벤트", "패들쉬프트", "전동햇빛가리개",
			"엠비언트라이트", "동승석에어백", "측면에어백", "커튼에어백", "무릎에어백", "승객감지에어백", "브레이크잠금방지(ABS)", "차체자세제어장치(ESC)", "후방센서", "전방센서",
			"후방카메라", "전방카메라", "어라운드뷰", "타이어공기압감지(TPMS)", "차선이탈경보(LDWS)", "자동긴급제동", "전자제어서스펜션(ECS)", "후측방경보",
			"미끄럼방지(TCS)", "스마트키", "열선핸들", "리모컨핸들", "자동에어컨", "좌우독립에어컨", "오토라이트", "크루즈컨트롤", "스마트크루즈컨트롤", "스탑앤고", "전동트렁크",
			"스마트트렁크", "전자주차브레이크(EPB)", "경사로밀림방지", "헤드업디스플레이(HUD)", "무선충전", "자동주차", "냉장고", "네비게이션(순정)", "네비게이션(비순정)",
			"USB", "AUX", "블루투스", "MP3", "DMB", "CD플레이어", "AV시스템", "뒷좌석TV", "텔레매틱스", "스마트폰미러링" };

	/*
	 * 로그인 세션
	 */
	@RequestMapping("all/log.do")
	public String login(HttpSession session) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = "";
		if (principal instanceof UserDetails) {
			id = ((UserDetails) principal).getUsername();
		}
		MemberVO vo = new MemberVO();
		vo.setM_id(id);

		MemberVO info = memberService.checkUniqueId(vo);

		session.setAttribute("info", info);

		// 관리자인지 권한정보를 세션에 저장
		String auth = memberService.checkAuth(vo);
		session.setAttribute("auth", auth);

		String crash = mycarService.selectnow();
		session.setAttribute("crash", crash);
		
		String note = letterService.selectnotecount(id);
		session.setAttribute("note", note);
		
		return "all/homepage";
	}
	
	/*
	 * 로그아웃 세션 지우기
	 */
	@RequestMapping("all/out.do")
	public String out(HttpSession session) {
		session.invalidate();
		return "all/login";
	}

	/*
	 * 처음 판매리스트 들어 갈때
	 */
	@RequestMapping("all/product_list.do")
	public void product_list(Model model, HttpSession session) {
		HeartVO vo = new HeartVO();
		if (session.getAttribute("info") != null) {
			MemberVO info = (MemberVO) session.getAttribute("info");
			vo.setM_id(info.getM_id());
		}
		vo.setSell_id(1);
		List<HashMap<String, Object>> category = categoryService.categoryselect();
		List<HashMap<String, Object>> sell = categoryService.sellselect(vo);
		int product_count = categoryService.sellcount();

		for (int i = 0; i < sell.size(); i++) {
			StringBuffer resultoption = new StringBuffer();
			StringBuffer temp = new StringBuffer();
			String option = (String) sell.get(i).get("option");
			int count = 0;
			if (option.split("/").length > 0) {
				for (int j = 0; j < option.split("/").length; j++) {
					temp.append(option.split("/")[j]);
				}
				for (int k = 0; k < temp.length(); k++) {
					if (temp.charAt(k) == '1') {
						resultoption.append(alloption[k]);
						if (count == 4)
							break;
						resultoption.append("/");
						count++;
					}
				}
			}
			sell.get(i).put("resultoption", resultoption);
		}

		model.addAttribute("category", category);
		model.addAttribute("sell", sell);
		model.addAttribute("product_count", product_count);
	}

	/*
	 * 모델을 가져올때
	 */
	@RequestMapping("all/category.do")
	@ResponseBody
	public List<HashMap<String, Object>> category(String category) {
		List<HashMap<String, Object>> model = categoryService.modelselect(category);
		return model;
	}

	/*
	 * 세부모델을 가져올때
	 */
	@RequestMapping("all/detail.do")
	@ResponseBody
	public List<HashMap<String, Object>> detail(String car_num) {
		List<HashMap<String, Object>> model_detail = categoryService.detailselect(car_num);
		return model_detail;
	}

	/*
	 * 등급을 가져올때
	 */
	@RequestMapping("all/grade.do")
	@ResponseBody
	public List<HashMap<String, Object>> grade(String d_id) {
		List<HashMap<String, Object>> grade = categoryService.gradeselect(d_id);
		return grade;
	}

	/*
	 * 세부 등급을 가져올 때
	 */
	@RequestMapping("all/grade2.do")
	@ResponseBody
	public List<HashMap<String, Object>> grade2(String d_id, String grade1) {
		GradeVO vo = new GradeVO();
		vo.setD_id(Integer.parseInt(d_id));
		vo.setGrade1(grade1);
		List<HashMap<String, Object>> grade2 = categoryService.grade2select(vo);
		return grade2;
	}

	/*
	 * 수입차인지 국산차 필터 할때
	 */
	@RequestMapping("all/abroad.do")
	@ResponseBody
	public List<HashMap<String, Object>> abroad(String abroad) {
		List<HashMap<String, Object>> country = categoryService.countryselect(abroad);
		return country;
	}

	/*
	 * 수입차 국산차 전부 가져올때
	 */
	@RequestMapping("all/allabroad.do")
	@ResponseBody
	public List<HashMap<String, Object>> allabroad(String abroad) {
		List<HashMap<String, Object>> country = categoryService.categoryselect();
		return country;
	}

	/*
	 * 카테고리 선택시 상품 가져올때
	 */
	@RequestMapping("all/category_product.do")
	@ResponseBody
	public List<HashMap<String, Object>> category_product(String id, String category, String page) {
		HeartVO vo = new HeartVO();

		int page_re = (Integer.parseInt(page) - 1) * 15 + 1;

		if (id != null) {
			vo.setM_id(id);
		}
		vo.setSell_id(page_re);
		vo.setDate(category);
		List<HashMap<String, Object>> list = categoryService.category_productselect(vo);

		for (int i = 0; i < list.size(); i++) {
			StringBuffer resultoption = new StringBuffer();
			StringBuffer temp = new StringBuffer();
			String option = (String) list.get(i).get("option");
			int count = 0;
			if (option.split("/").length > 0) {
				for (int j = 0; j < option.split("/").length; j++) {
					temp.append(option.split("/")[j]);
				}
				for (int k = 0; k < temp.length(); k++) {
					if (temp.charAt(k) == '1') {
						resultoption.append(alloption[k]);
						if (count == 4)
							break;
						resultoption.append("/");
						count++;
					}
				}
			}
			list.get(i).put("resultoption", resultoption);
		}

		return list;
	}

	/*
	 * 모델 눌렀을 때 ajax
	 */
	@RequestMapping("all/model_product.do")
	@ResponseBody
	public List<HashMap<String, Object>> model_product(String id, String car_num, String page) {
		HeartVO vo = new HeartVO();
		int page_re = (Integer.parseInt(page) - 1) * 15 + 1;

		if (id != null) {
			vo.setM_id(id);
		}
		vo.setSell_id(page_re);
		vo.setDate(car_num);
		List<HashMap<String, Object>> list = categoryService.model_productselect(vo);

		for (int i = 0; i < list.size(); i++) {
			StringBuffer resultoption = new StringBuffer();
			StringBuffer temp = new StringBuffer();
			String option = (String) list.get(i).get("option");
			int count = 0;
			if (option.split("/").length > 0) {
				for (int j = 0; j < option.split("/").length; j++) {
					temp.append(option.split("/")[j]);
				}
				for (int k = 0; k < temp.length(); k++) {
					if (temp.charAt(k) == '1') {
						resultoption.append(alloption[k]);
						if (count == 4)
							break;
						resultoption.append("/");
						count++;
					}
				}
			}
			list.get(i).put("resultoption", resultoption);
		}

		return list;
	}
	
	/*
	 * 세부 모델 눌렀을 때 ajax
	 */
	@RequestMapping("all/detail_product.do")
	@ResponseBody
	public List<HashMap<String, Object>> detail_product(String id, String car_num, String options, String page) {
		HeartVO vo = new HeartVO();
		int page_re = (Integer.parseInt(page) - 1) * 15 + 1;
		if (id != null) {
			vo.setM_id(id);
		}
		vo.setSell_id(page_re);
		vo.setW_id(Integer.parseInt(car_num));
		vo.setDate(options);
		List<HashMap<String, Object>> list = categoryService.detail_productselect(vo);

		for (int i = 0; i < list.size(); i++) {
			StringBuffer resultoption = new StringBuffer();
			StringBuffer temp = new StringBuffer();
			String option = (String) list.get(i).get("option");
			int count = 0;
			if (option.split("/").length > 0) {
				for (int j = 0; j < option.split("/").length; j++) {
					temp.append(option.split("/")[j]);
				}
				for (int k = 0; k < temp.length(); k++) {
					if (temp.charAt(k) == '1') {
						resultoption.append(alloption[k]);
						if (count == 4)
							break;
						resultoption.append("/");
						count++;
					}
				}
			}
			list.get(i).put("resultoption", resultoption);
		}

		return list;
	}
	
	/*
	 * 등급 눌렀을 때 ajax
	 */
	@RequestMapping("all/grade1_product.do")
	@ResponseBody
	public List<HashMap<String, Object>> grade1_product(String id, String car_num, String options, String options2,
			String page) {
		MemberVO vo = new MemberVO();
		int page_re = (Integer.parseInt(page) - 1) * 15 + 1;
		if (id != null) {
			vo.setM_id(id);
		}
		vo.setCoin(Integer.toString(page_re));
		vo.setM_pw(car_num);
		vo.setAuth(options);
		vo.setBirth(options2);
		List<HashMap<String, Object>> list = categoryService.grade1_productselect(vo);

		for (int i = 0; i < list.size(); i++) {
			StringBuffer resultoption = new StringBuffer();
			StringBuffer temp = new StringBuffer();
			String option = (String) list.get(i).get("option");
			int count = 0;
			if (option.split("/").length > 0) {
				for (int j = 0; j < option.split("/").length; j++) {
					temp.append(option.split("/")[j]);
				}
				for (int k = 0; k < temp.length(); k++) {
					if (temp.charAt(k) == '1') {
						resultoption.append(alloption[k]);
						if (count == 4)
							break;
						resultoption.append("/");
						count++;
					}
				}
			}
			list.get(i).put("resultoption", resultoption);
		}

		return list;
	}
	
	/*
	 * 세부 모델 눌렀을 때 ajax
	 */
	@RequestMapping("all/grade2_product.do")
	@ResponseBody
	public List<HashMap<String, Object>> grade2_product(String id, String car_num, String options, String options2,
			String options3, String page) {
		MemberVO vo = new MemberVO();
		int page_re = (Integer.parseInt(page) - 1) * 15 + 1;
		if (id != null) {
			vo.setM_id(id);
		}
		vo.setCoin(Integer.toString(page_re));
		vo.setM_pw(car_num);
		vo.setAuth(options);
		vo.setBirth(options2);
		vo.setM_name(options3);
		List<HashMap<String, Object>> list = categoryService.grade2_productselect(vo);

		for (int i = 0; i < list.size(); i++) {
			StringBuffer resultoption = new StringBuffer();
			StringBuffer temp = new StringBuffer();
			String option = (String) list.get(i).get("option");
			int count = 0;
			if (option.split("/").length > 0) {
				for (int j = 0; j < option.split("/").length; j++) {
					temp.append(option.split("/")[j]);
				}
				for (int k = 0; k < temp.length(); k++) {
					if (temp.charAt(k) == '1') {
						resultoption.append(alloption[k]);
						if (count == 4)
							break;
						resultoption.append("/");
						count++;
					}
				}
			}
			list.get(i).put("resultoption", resultoption);
		}

		return list;
	}

	/*
	 * 전체 나라 눌렀을 때 ajax
	 */
	@RequestMapping("all/country_all.do")
	@ResponseBody
	public List<HashMap<String, Object>> country_all(String id, String page) {
		HeartVO vo = new HeartVO();
		int page_re = (Integer.parseInt(page) - 1) * 15 + 1;
		if (id != null) {
			vo.setM_id(id);
		}
		vo.setSell_id(page_re);
		List<HashMap<String, Object>> sell = categoryService.sellselect(vo);

		for (int i = 0; i < sell.size(); i++) {
			StringBuffer resultoption = new StringBuffer();
			StringBuffer temp = new StringBuffer();
			String option = (String) sell.get(i).get("option");
			int count = 0;
			if (option.split("/").length > 0) {
				for (int j = 0; j < option.split("/").length; j++) {
					temp.append(option.split("/")[j]);
				}
				for (int k = 0; k < temp.length(); k++) {
					if (temp.charAt(k) == '1') {
						resultoption.append(alloption[k]);
						if (count == 4)
							break;
						resultoption.append("/");
						count++;
					}
				}
			}
			sell.get(i).put("resultoption", resultoption);
		}
		return sell;
	}

	/*
	 * 나라 눌렀을 때 ajax
	 */
	@RequestMapping("all/country_one.do")
	@ResponseBody
	public List<HashMap<String, Object>> country_one(String id, String country, String page) {
		HeartVO vo = new HeartVO();
		int page_re = (Integer.parseInt(page) - 1) * 15 + 1;
		if (id != null) {
			vo.setM_id(id);
		}
		vo.setDate(country);
		vo.setSell_id(page_re);
		List<HashMap<String, Object>> sell = categoryService.sellselect(vo);

		for (int i = 0; i < sell.size(); i++) {
			StringBuffer resultoption = new StringBuffer();
			StringBuffer temp = new StringBuffer();
			String option = (String) sell.get(i).get("option");
			int count = 0;
			if (option.split("/").length > 0) {
				for (int j = 0; j < option.split("/").length; j++) {
					temp.append(option.split("/")[j]);
				}
				for (int k = 0; k < temp.length(); k++) {
					if (temp.charAt(k) == '1') {
						resultoption.append(alloption[k]);
						if (count == 4)
							break;
						resultoption.append("/");
						count++;
					}
				}
			}
			sell.get(i).put("resultoption", resultoption);
		}
		return sell;
	}

	/*
	 * 검색 했을 때 ajax
	 */
	@RequestMapping("all/search_select.do")
	@ResponseBody
	public List<HashMap<String, Object>> search_select(String id, String search, String page) {
		HeartVO vo = new HeartVO();
		int page_re = (Integer.parseInt(page) - 1) * 15;
		if (id != null) {
			vo.setM_id(id);
		}
		vo.setDate(search);
		vo.setSell_id(page_re);
		List<HashMap<String, Object>> sell = categoryService.searchselect(vo);

		for (int i = 0; i < sell.size(); i++) {
			StringBuffer resultoption = new StringBuffer();
			StringBuffer temp = new StringBuffer();
			String option = (String) sell.get(i).get("option");
			int count = 0;
			if (option.split("/").length > 0) {
				for (int j = 0; j < option.split("/").length; j++) {
					temp.append(option.split("/")[j]);
				}
				for (int k = 0; k < temp.length(); k++) {
					if (temp.charAt(k) == '1') {
						resultoption.append(alloption[k]);
						if (count == 4)
							break;
						resultoption.append("/");
						count++;
					}
				}
			}
			sell.get(i).put("resultoption", resultoption);
		}
		return sell;
	}

	/*
	 * 전체 나라 눌렀을 때 갯수 ajax
	 */
	@RequestMapping("all/country_all_count.do")
	@ResponseBody
	public int country_all_count() {
		int count_all = categoryService.sellcount();
		return count_all;
	}
	
	/*
	 * 나라 눌렀을 때 갯수 ajax
	 */
	@RequestMapping("all/country_one_count.do")
	@ResponseBody
	public int country_one_count(String country) {
		int count_one = categoryService.country_count(country);
		return count_one;
	}
	
	/*
	 * 검색 눌렀을 때 갯수 ajax
	 */
	@RequestMapping("all/search_count.do")
	@ResponseBody
	public int search_count(String search) {
		System.out.println(search);
		int count = categoryService.search_count(search);
		return count;
	}
	
	/*
	 * 찜했을때 ajax
	 */
	@RequestMapping("all/heart_on.do")
	@ResponseBody
	public void heart_on(String id, String sell_id) {
		HeartVO vo = new HeartVO();
		vo.setM_id(id);
		vo.setSell_id(Integer.parseInt(sell_id));
		heartService.insertHeart(vo);
	}
	
	/*
	 * 찜 취소 했을 때 ajax
	 */
	@RequestMapping("all/heart_off.do")
	@ResponseBody
	public void heart_off(String id, String sell_id) {
		HeartVO vo = new HeartVO();
		vo.setM_id(id);
		vo.setSell_id(Integer.parseInt(sell_id));
		heartService.deleteHeart(vo);
	}
	
	/*
	 * 찜 전체 삭제  ajax
	 */
	@RequestMapping("user/heart_all.do")
	@ResponseBody
	public void heart_all(String id) {
		HeartVO vo = new HeartVO();
		vo.setM_id(id);
		heartService.deleteHeart(vo);
	}

	/*
	 * 나의 찜 들어가기  ajax
	 */
	@RequestMapping("user/my_heart.do")
	public void my_heart(String page, Model model, HttpSession session) {
		HeartVO vo = new HeartVO();
		if (session.getAttribute("info") != null) {
			MemberVO info = (MemberVO) session.getAttribute("info");
			vo.setM_id(info.getM_id());
		}
		vo.setSell_id(0);
		List<HashMap<String, Object>> heartlist = categoryService.heartlistselect(vo);
		int heartcount = categoryService.heartlistcount(vo);
		for (int i = 0; i < heartlist.size(); i++) {
			StringBuffer resultoption = new StringBuffer();
			StringBuffer temp = new StringBuffer();
			String option = (String) heartlist.get(i).get("option");
			int count = 0;
			if (option.split("/").length > 0) {
				for (int j = 0; j < option.split("/").length; j++) {
					temp.append(option.split("/")[j]);
				}
				for (int k = 0; k < temp.length(); k++) {
					if (temp.charAt(k) == '1') {
						resultoption.append(alloption[k]);
						if (count == 4)
							break;
						resultoption.append("/");
						count++;
					}
				}
			}
			heartlist.get(i).put("resultoption", resultoption);
		}

		model.addAttribute("heartlist", heartlist);
		model.addAttribute("heartcount", heartcount);
	}

	/*
	 * 삭제시 찜 다시 가져오기  ajax
	 */
	@RequestMapping("user/heart_select.do")
	@ResponseBody
	public List<HashMap<String, Object>> heart_select(String id, String page) {
		HeartVO vo = new HeartVO();
		int page_re = (Integer.parseInt(page) - 1) * 15;
		vo.setM_id(id);
		vo.setSell_id(page_re);
		List<HashMap<String, Object>> sell = categoryService.heartlistselect(vo);

		for (int i = 0; i < sell.size(); i++) {
			StringBuffer resultoption = new StringBuffer();
			StringBuffer temp = new StringBuffer();
			String option = (String) sell.get(i).get("option");
			int count = 0;
			if (option.split("/").length > 0) {
				for (int j = 0; j < option.split("/").length; j++) {
					temp.append(option.split("/")[j]);
				}
				for (int k = 0; k < temp.length(); k++) {
					if (temp.charAt(k) == '1') {
						resultoption.append(alloption[k]);
						if (count == 4)
							break;
						resultoption.append("/");
						count++;
					}
				}
			}
			sell.get(i).put("resultoption", resultoption);
		}
		return sell;
	}
	
	/*
	 * 웹 소켓 충돌 숫자 ajax
	 */
	@RequestMapping("user/selectnow.do")
	@ResponseBody
	public String selectnow() {
		String crash = mycarService.selectnow();
		
		return crash;
	}
	
	/*
	 * 블랙박스 페이지
	 */
	@RequestMapping("user/blackbox.do")
	public void blackbox(String num,Model model) {
		List<MycarVO> list = mycarService.selectblackbox();
		String re_num="0";
		if(!(num.equals(""))) {
			re_num=num;
		}
		model.addAttribute("num", re_num);
		model.addAttribute("list", list);
		mycarService.updateblackbox();
	}
	
	/*
	 * 블박 이미지 ajax
	 */
	@ResponseBody
	@RequestMapping("user/select_day_img.do")
	public String select_day_img(String day) {
		String path = mycarService.selectpath(day);
		
		return path;
	}
	
	/*
	 * 쪽지 보내기 ajax
	 */
	@RequestMapping("user/insertsend.do")
	@ResponseBody
	public void insertsend(LetterVO vo) {
		letterService.insertsend(vo);
	}

	/*
	 * 쪽지 리스트
	 */
	@RequestMapping("user/notelist.do")
	public void notelist(String note, String page, Model model,HttpSession session) {
		MemberVO vo = (MemberVO)session.getAttribute("info");
		String re_page = Integer.toString((Integer.parseInt(page)-1)*15);
		vo.setGoogle(re_page);
		List<HashMap<String, Object>> list;
		String note_count;
		if(note.equals("get")) {
			list = letterService.getselect(vo);
			note_count=letterService.getcount(vo);
		}else {
			list = letterService.sendselect(vo);
			note_count=letterService.sendcount(vo);
		}
		
		model.addAttribute("note", note);
		model.addAttribute("note_count", note_count);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
	}
	
	/*
	 * 받은쪽지 가져오기
	 */
	@RequestMapping("user/note_get_select.do")
	public void note_get_select(String l_id, Model model) {
		HashMap<String, Object> letter = letterService.selectgetnote(l_id);
		model.addAttribute("letter", letter);
	}
	
	/*
	 * 보낸쪽지 가져오기
	 */
	@RequestMapping("user/note_send_select.do")
	public void note_send_select(String l_id, Model model) {
		HashMap<String, Object> letter = letterService.selectsendnote(l_id);
		model.addAttribute("letter", letter);
	}
	
	/*
	 * 쪽지 보내기
	 */
	@RequestMapping("user/noteinsert.do")
	public void noteinsert(String re, Model model) {		
		model.addAttribute("re", re);
	}
	
	/*
	 * 쪽지 봤을 때
	 */
	@RequestMapping("user/updatesend.do")
	@ResponseBody
	public void updatesend(String l_id) {
		letterService.updatesend(l_id);
	}
	
	/*
	 * 쪽지 봤을 때
	 */
	@RequestMapping("user/noshowget.do")
	@ResponseBody
	public void noshowget(String l_id) {
		letterService.noshowget(l_id);
	}
	/*
	 * 쪽지 봤을 때
	 */
	@RequestMapping("user/noshowsend.do")
	@ResponseBody
	public void noshowsend(String l_id) {
		letterService.noshowsend(l_id);
	}

}