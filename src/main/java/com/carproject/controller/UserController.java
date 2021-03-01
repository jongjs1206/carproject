package com.carproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carproject.domain.GradeVO;
import com.carproject.service.CategoryService;

@Controller
public class UserController {
	@Autowired
	private CategoryService categoryService;
	
	String[] alloption = {"선루프", "파노라마선루프", "알루미늄휠", "전동사이드미러", "HID램프", 
			"LED헤드램프", "어댑티드헤드램프", "LED리어램프", "데이라이트", "하이빔어시스트", 
			"압축도어", "자동슬라이딩도어", "전동사이드스탭", "루프랙", 
			"가죽시트", "전동시트(운전석)", "전동시트(동승석)", "열선시트(앞좌석)", "열선시트(뒷좌석)", 
			"통풍시트", "메모리시트", "폴딩시트", "마사지시트", "워크인시트", 
			"요추받침", "하이패스룸미러", "ECM룸미러", "뒷자석에어벤트", "패들쉬프트", 
			"전동햇빛가리개", "엠비언트라이트",
			"동승석에어백", "측면에어백", "커튼에어백", "무릎에어백", "승객감지에어백", 
			"브레이크잠금방지(ABS)", "차체자세제어장치(ESC)", "후방센서", "전방센서", "후방카메라", 
			"전방카메라", "어라운드뷰", "타이어공기압감지(TPMS)", "차선이탈경보(LDWS)", "자동긴급제동", 
			"전자제어서스펜션(ECS)", "후측방경보", "미끄럼방지(TCS)", 
			"스마트키", "열선핸들", "리모컨핸들", "자동에어컨", "좌우독립에어컨", 
			"오토라이트", "크루즈컨트롤", "스마트크루즈컨트롤", "스탑앤고", "전동트렁크", 
			"스마트트렁크", "전자주차브레이크(EPB)", "경사로밀림방지", "헤드업디스플레이(HUD)", "무선충전", 
			"자동주차", "냉장고", 
			"네비게이션(순정)", "네비게이션(비순정)", "USB", "AUX", "블루투스", 
			"MP3", "DMB", "CD플레이어", "AV시스템", "뒷좌석TV",
			"텔레매틱스", "스마트폰미러링"};
	
	@RequestMapping("all/homepage.do")
	public void homepage() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	      
	    System.out.println(principal);
	}
	
	/*
	 * 처음 판매리스트 들어 갈때
	 */
	@RequestMapping("all/product_list.do")
	public void product_list(Model model) {
		List<HashMap<String, Object>> category = categoryService.categoryselect();
		List<HashMap<String, Object>> sell = categoryService.sellselect();
		
		
		for(int i=0;i<sell.size();i++) {
			StringBuffer resultoption = new StringBuffer();
			StringBuffer temp = new StringBuffer();
			String option = (String)sell.get(i).get("option");
			int count=0;
			if(option.split("/").length>0) {
				for(int j=0;j<option.split("/").length;j++) {
					temp.append(option.split("/")[j]);
				}
				for(int k=0;k<temp.length();k++) {
					if(temp.charAt(k)=='1') {
						resultoption.append(alloption[k]);
						if(count==4)
							break;
						resultoption.append("/");
						count++;
					}
				}
			}
			sell.get(i).put("resultoption", resultoption);
		}
		
		model.addAttribute("category",category);
		model.addAttribute("sell",sell);
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
	public List<HashMap<String, Object>> grade2(String d_id ,String grade1) {
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
		List<HashMap<String, Object>> country  = categoryService.categoryselect();
		return country;
	}
	
	@RequestMapping("all/category_product.do")
	@ResponseBody
	public List<HashMap<String, Object>> category_product(String category) {
		List<HashMap<String, Object>> list = categoryService.category_productselect(category);
		for(int i=0;i<list.size();i++) {
			StringBuffer resultoption = new StringBuffer();
			StringBuffer temp = new StringBuffer();
			String option = (String)list.get(i).get("option");
			int count=0;
			if(option.split("/").length>0) {
				for(int j=0;j<option.split("/").length;j++) {
					temp.append(option.split("/")[j]);
				}
				for(int k=0;k<temp.length();k++) {
					if(temp.charAt(k)=='1') {
						resultoption.append(alloption[k]);
						if(count==4)
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
}