package com.carproject.controller;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Member;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carproject.service.CategoryService;
import com.carproject.service.MemberService;
import com.carproject.service.SalesService;
import com.carproject.domain.HeartVO;
import com.carproject.domain.MemberVO;
import com.carproject.domain.SalesVO;

@Controller
public class AdminController {
	@Autowired
	private MemberService memberservice;
	@Autowired
	private SalesService salesservice;	
	@Autowired
	private CategoryService categoryservice;
	
	String[] alloption = { "선루프", "파노라마선루프", "알루미늄휠", "전동사이드미러", "HID램프", "LED헤드램프", "어댑티드헤드램프", "LED리어램프", "데이라이트",
			"하이빔어시스트", "압축도어", "자동슬라이딩도어", "전동사이드스탭", "루프랙", "가죽시트", "전동시트(운전석)", "전동시트(동승석)", "열선시트(앞좌석)", "열선시트(뒷좌석)",
			"통풍시트", "메모리시트", "폴딩시트", "마사지시트", "워크인시트", "요추받침", "하이패스룸미러", "ECM룸미러", "뒷자석에어벤트", "패들쉬프트", "전동햇빛가리개",
			"엠비언트라이트", "동승석에어백", "측면에어백", "커튼에어백", "무릎에어백", "승객감지에어백", "브레이크잠금방지(ABS)", "차체자세제어장치(ESC)", "후방센서", "전방센서",
			"후방카메라", "전방카메라", "어라운드뷰", "타이어공기압감지(TPMS)", "차선이탈경보(LDWS)", "자동긴급제동", "전자제어서스펜션(ECS)", "후측방경보",
			"미끄럼방지(TCS)", "스마트키", "열선핸들", "리모컨핸들", "자동에어컨", "좌우독립에어컨", "오토라이트", "크루즈컨트롤", "스마트크루즈컨트롤", "스탑앤고", "전동트렁크",
			"스마트트렁크", "전자주차브레이크(EPB)", "경사로밀림방지", "헤드업디스플레이(HUD)", "무선충전", "자동주차", "냉장고", "네비게이션(순정)", "네비게이션(비순정)",
			"USB", "AUX", "블루투스", "MP3", "DMB", "CD플레이어", "AV시스템", "뒷좌석TV", "텔레매틱스", "스마트폰미러링" };
	
	
	@RequestMapping("admin/admin.do")
	public void product_list(Model model) {
		System.out.println("hi");
		
	}
	
	// 회원 목록 페이지에 매핑 -> member테이블의 데이터를 모두 출력
	@RequestMapping("admin/userlist.do")
	public void userlist(Model model) {
		List<HashMap<String, Object>> list = memberservice.allMember();
		model.addAttribute("list",list);
	}
	
	// 회원 정보 수정 페이지에 매핑 -> 인자로 전달된 id에 해당하는 row의 데이터 출력
	@RequestMapping("admin/modifyuser.do")
	public void updateUser(String id, Model model) {
		System.out.println(id);
		MemberVO update = memberservice.pickUserById(id);
		System.out.println(update.getM_name());
		model.addAttribute("update", update);
	}
//	
//	//회원정보 수정 페이지에 매핑 -> input form의 value로 해당 row의 데이터를 update(수정)
//   @RequestMapping(value="admin/modifyuser.do", method=RequestMethod.POST)
//   public String  updateUserPost(HttpServletRequest request) throws Exception {
//        System.out.println("RequestMethod.POST");
//        request.setCharacterEncoding("utf-8");
//        
//        MemberVO mv = new MemberVO();
//
//        String m_id = new String(request.getParameter("inputId").getBytes("8859_1"), "UTF-8");
//        String m_name = new String(request.getParameter("inputName").getBytes("8859_1"), "UTF-8");
//        String email = new String(request.getParameter("inputEmail").getBytes("8859_1"), "UTF-8");
//        String gender = new String(request.getParameter("inputGender").getBytes("8859_1"), "UTF-8");
//        String tel = new String(request.getParameter("inputPhone").getBytes("8859_1"), "UTF-8");
//        String birth = new String(request.getParameter("inputBirth").getBytes("8859_1"), "UTF-8");
//        
//        mv.setM_id(m_id);
//        mv.setM_name(m_name);
//        mv.setEmail(email);
//        mv.setGender(gender);
//        mv.setTel(tel);
//        mv.setBirth(birth);
//     
//        memberservice.updateMember(mv);
//
//        return "redirect:userlist.do";
//   }
//	
//   // 관리자목록 페이지에 매핑 -> auth테이블에서 ROLE_ADMIN인 모든 데이터 출력
//	@RequestMapping("admin/adminlist.do")
//	public void adminlist(Model model) {
//		List<HashMap<String, Object>> adminlist = memberservice.allAdmin();
//		model.addAttribute("adminlist",adminlist);
//	}
//	
//	// setAdmin 페이지는 단순히 값을 전달받는 용도
//	// -> 인자로 전달 받은 id에 해당하는 row의 데이터에 관리자 권한 부여(ROLE_ADMIN)
//	@RequestMapping(value="admin/setAdmin.do")
//	public String updateAuthAdmin(@RequestParam("id") String id, Model model) {
//		memberservice.updateAuthAdmin(id);
//		return "redirect:userlist.do";
//	}
//	
//	// setUser 페이지는 단순히 값을 전달받는 용도
//	// -> 인자로 전달 받은 id에 해당하는 row의 데이터에 관리자 권한 해제(ROLE_USER)
//	@RequestMapping(value="admin/setUser.do")
//	public String updateAuthUser(@RequestParam("id") String id, Model model) {
//		memberservice.updateAuthUser(id);
//		return "redirect:adminlist.do";
//	}
//	
//	// blacklist 페이지에 매핑 -> member테이블에서 state열의 값이 black인 데이터 모두 출력
//	@RequestMapping("admin/blacklist.do")
//	public void blacklist(Model model) {
//		List<HashMap<String, Object>> blacklist = memberservice.allBlacklist();
//		model.addAttribute("blacklist",blacklist);
//	}
//	
//	// setBlacklist 페이지는 단순히 값을 전달받는 용도
//	// -> 인자로 전달 받은 id에 해당하는 row의 데이터의 state 값을 black으로 update
//	@RequestMapping(value="admin/setBlacklist.do")
//	public String setBlacklist(@RequestParam("id") String id, Model model) {
//		memberservice.setBlacklist(id);
//		return "redirect:blacklist.do";
//	}
//	
//	// setNormal 페이지는 단순히 값을 전달받는 용도
//	// -> 인자로 전달 받은 id에 해당하는 row의 데이터의 state 값을 normal로 update
//	@RequestMapping(value="admin/setNormal.do")
//	public String setNormal(@RequestParam("id") String id, Model model) {
//		memberservice.setNormal(id);
//		return "redirect:blacklist.do";
//	}
	
	
	
	/*
	 * 작성자 문희주
	 * admin 페이지
	 * 
	*/
	
	
	

	
	
	
	//admin_판매글 관리
	
	//처음 세팅
	@RequestMapping(value = "/admin/salesList.do")
	public void product_list(Model model, HttpSession session,
			@RequestParam("startDate") @Nullable String startDate,
			@RequestParam("endDate") @Nullable String endDate) {
		
		System.out.println("+++++"+startDate);
		List<SalesVO> salesList = salesservice.selectSalesAll();
		model.addAttribute("salesList", salesList);

		
	}
	
	//검색 
	@RequestMapping(value = "admin/salesList_search.do")
	public String  searchMySales(HttpSession session, Model model,
			@RequestParam HashMap<String, String> param
			) {

		System.out.println("+++++startDate"+param.get("startDate"));
		
		/*
		//검색
		List<HashMap<String, Object>> sale_list = memberservice.selectSale_admin(param);
		
		//날짜에서 시간 자르기
		for(HashMap<String, Object> s : sale_list) {	
		String date = s.get("w_date").toString();
		s.put("w_date", date.split(" ")[0]);
		}
		
		model.addAttribute("salesList", sale_list);
		*/
		return "redirect:/admin/salesList.do";

	
	}
	
	
	
	
	
	
	
	

	
}