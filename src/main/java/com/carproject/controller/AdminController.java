package com.carproject.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carproject.service.MemberService;
import com.carproject.domain.MemberVO;

@Controller
public class AdminController {
	@Autowired
	private MemberService memberservice;
	
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
	@RequestMapping(value="admin/modifyuser.do")
	public void updateUser(@RequestParam("id") String id, Model model) {
		MemberVO update = memberservice.pickUserById(id);
		model.addAttribute("update", update);
	}
	
	//회원정보 수정 페이지에 매핑 -> input form의 value로 해당 row의 데이터를 update(수정)
   @RequestMapping(value="admin/modifyuser.do", method=RequestMethod.POST)
   public String  updateUserPost(HttpServletRequest request) throws Exception {
        System.out.println("RequestMethod.POST");
        request.setCharacterEncoding("utf-8");
        
        MemberVO mv = new MemberVO();

        String m_id = new String(request.getParameter("inputId").getBytes("8859_1"), "UTF-8");
        String m_name = new String(request.getParameter("inputName").getBytes("8859_1"), "UTF-8");
        String email = new String(request.getParameter("inputEmail").getBytes("8859_1"), "UTF-8");
        String gender = new String(request.getParameter("inputGender").getBytes("8859_1"), "UTF-8");
        String tel = new String(request.getParameter("inputPhone").getBytes("8859_1"), "UTF-8");
        String birth = new String(request.getParameter("inputBirth").getBytes("8859_1"), "UTF-8");
        
        mv.setM_id(m_id);
        mv.setM_name(m_name);
        mv.setEmail(email);
        mv.setGender(gender);
        mv.setTel(tel);
        mv.setBirth(birth);
     
        memberservice.updateMember(mv);

        return "redirect:userlist.do";
   }
	
   // 관리자목록 페이지에 매핑 -> auth테이블에서 ROLE_ADMIN인 모든 데이터 출력
	@RequestMapping("admin/adminlist.do")
	public void adminlist(Model model) {
		List<HashMap<String, Object>> adminlist = memberservice.allAdmin();
		model.addAttribute("adminlist",adminlist);
	}
	
	// setAdmin 페이지는 단순히 값을 전달받는 용도
	// -> 인자로 전달 받은 id에 해당하는 row의 데이터에 관리자 권한 부여(ROLE_ADMIN)
	@RequestMapping(value="admin/setAdmin.do")
	public String updateAuthAdmin(@RequestParam("id") String id, Model model) {
		memberservice.updateAuthAdmin(id);
		return "redirect:userlist.do";
	}
	
	// setUser 페이지는 단순히 값을 전달받는 용도
	// -> 인자로 전달 받은 id에 해당하는 row의 데이터에 관리자 권한 해제(ROLE_USER)
	@RequestMapping(value="admin/setUser.do")
	public String updateAuthUser(@RequestParam("id") String id, Model model) {
		memberservice.updateAuthUser(id);
		return "redirect:adminlist.do";
	}
	
	// blacklist 페이지에 매핑 -> member테이블에서 state열의 값이 black인 데이터 모두 출력
	@RequestMapping("admin/blacklist.do")
	public void blacklist(Model model) {
		List<HashMap<String, Object>> blacklist = memberservice.allBlacklist();
		model.addAttribute("blacklist",blacklist);
	}
	
	// setBlacklist 페이지는 단순히 값을 전달받는 용도
	// -> 인자로 전달 받은 id에 해당하는 row의 데이터의 state 값을 black으로 update
	@RequestMapping(value="admin/setBlacklist.do")
	public String setBlacklist(@RequestParam("id") String id, Model model) {
		memberservice.setBlacklist(id);
		return "redirect:blacklist.do";
	}
	
	// setNormal 페이지는 단순히 값을 전달받는 용도
	// -> 인자로 전달 받은 id에 해당하는 row의 데이터의 state 값을 normal로 update
	@RequestMapping(value="admin/setNormal.do")
	public String setNormal(@RequestParam("id") String id, Model model) {
		memberservice.setNormal(id);
		return "redirect:blacklist.do";
	}
	
}