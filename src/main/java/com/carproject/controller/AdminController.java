package com.carproject.controller;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Member;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

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
import com.google.rpc.context.AttributeContext.Auth;

import ch.qos.logback.core.util.SystemInfo;

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
	
	
//	@RequestMapping("admin/admin.do")
//	public void product_list(Model model) {
//		System.out.println("hi");
//		
//	}
	
	
	//admin_회원 관리//////////////////////////////////////////////////////////////////////////////////
	
	
	// 회원 목록 페이지에 매핑 -> member테이블의 데이터를 모두 출력
	@RequestMapping("admin/member_user.do")
	public void userlist(Model model) {
		List<HashMap<String, Object>> list = memberservice.allMember();

		model.addAttribute("list",list);
	}
	
	// 회원목록에서 설정 누름 -> 새창
	@RequestMapping("admin/member_status.do")
	public void memberStatus(@RequestParam("id") String id, @RequestParam("stateChange") @Nullable String stateChange,
			Model model) {

		//파라미터에 따라서 블랙리스트, 관리자 지정
		if(stateChange!=null && stateChange.equals("black")) {
			memberservice.setBlacklist(id);
		}else if(stateChange!=null && stateChange.equals("normal")) {
			memberservice.setNormal(id);
		}else if(stateChange!=null && stateChange.equals("admin")) {
			memberservice.updateAuthAdmin(id);
		}else if(stateChange!=null && stateChange.equals("user")) {
			memberservice.updateAuthUser(id);
		}
		
		MemberVO user = memberservice.pickUserById(id);
		String auth = memberservice.checkAuth(user);
		model.addAttribute("user",user);
		model.addAttribute("auth",auth);
	}
	
	
	// 새창에서 확인 누름  (업데이트)
	@RequestMapping("admin/updateUserEtc.do")
	public String updateUserEtc(MemberVO vo, Model model) {
		memberservice.updateUserEtc(vo);
		model.addAttribute("user",vo);
		return "redirect: member_status.do?id="+vo.getM_id();
	}
	
   // 블랙리스트 페이지에 매핑 -> auth테이블에서 ROLE_ADMIN인 모든 데이터 출력
	@RequestMapping("admin/member_blacklist.do")
	public void memberBacklist(Model model) {
		List<HashMap<String, Object>> blacklist = memberservice.allBlacklist();
		model.addAttribute("blacklist",blacklist);
	}
	

   // 관리자목록 페이지에 매핑 -> auth테이블에서 ROLE_ADMIN인 모든 데이터 출력
	@RequestMapping("admin/member_admin.do")
	public void memberAdmin(Model model) {
		List<HashMap<String, Object>> adminlist = memberservice.allAdmin();
		
		model.addAttribute("adminlist",adminlist);
	}
	
	
	
	
	
	
	//admin_판매글 관리//////////////////////////////////////////////////////////////////////////////////
	
	//처음 세팅
	@RequestMapping(value = "/admin/salesList.do")
	public void product_list(MemberVO vo, Model model, HttpSession session,
			@RequestParam HashMap<String, Object> param)
//			@RequestParam("startDate") @Nullable String startDate,
//			@RequestParam("endDate") @Nullable String endDate,
//			@RequestParam("status") @Nullable String status,
//			@RequestParam("byTitle") @Nullable String byTitle) 
	{

		List<HashMap<String, Object>> salesList = memberservice.selectSale_admin(param);
		model.addAttribute("salesList", salesList);
		
		 	
	}
	
	
	
	//검색 ajax 데이터 전달 용
	@RequestMapping(value = "/admin/salesList_ajax.do", method= {RequestMethod.POST})
	@ResponseBody
	public void searchMySales(HttpSession session, Model model
			, @RequestParam HashMap<String, Object> param
			) {
		//검색
		List<HashMap<String, Object>> salesList = memberservice.selectSale_admin(param);
		model.addAttribute("salesList", salesList);

	
	}
	
	
	
	
	
	
	
	
	
	

	
}