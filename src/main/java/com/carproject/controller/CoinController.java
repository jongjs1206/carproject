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

import com.carproject.domain.CoinVO;
import com.carproject.domain.MemberVO;
import com.carproject.service.CoinService;
import com.carproject.service.LetterService;
import com.carproject.service.MemberService;
import com.carproject.service.MycarService;

@Controller
public class CoinController {

	@Autowired
	private CoinService coinService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MycarService mycarService;
	@Autowired
	private LetterService letterService;
	
	// 내 코인 충전 내역 확인 - 쿼리스트링으로 m_id 가져와서 DB 정보 출력 (첫 로딩)
	@RequestMapping(value = "user/coin.do")
	public void coin(@RequestParam("m_id") String m_id, Model model,HttpSession session) {
		List<HashMap<String, Object>> list = coinService.coinView(m_id);
		String onlyCoin = "";
		if (list.size() > 0) {
			onlyCoin = coinService.onlyCoin(m_id).toString();			
		}else {
			onlyCoin = "0";
		}
		String crash = mycarService.selectnow();
		session.setAttribute("crash", crash);
		
		String user_id="";
		if(session.getAttribute("info")!=null) {
			user_id=((MemberVO)session.getAttribute("info")).getM_id();
		}
		
		String note = letterService.selectnotecount(user_id);
		session.setAttribute("note", note);
		
		// 코인 테이블의 코인 합산결과값으로 member 테이블의 coin값을 업데이트하기
		MemberVO vo = new MemberVO();
		vo.setM_id(m_id);
		vo.setCoin(onlyCoin);
		coinService.updateCoin(vo);
		
		model.addAttribute("coinlist", list);
		model.addAttribute("onlyCoin", onlyCoin);
		
		System.out.println("===> " + m_id + "의 코인리스트 출력 : " + onlyCoin + "개");
	}
	
	// 결제 결과를 DB에 반영 후 페이지 리다이렉트
	@RequestMapping("user/payUpdate.do")
	@ResponseBody
	public String payUpdate(@RequestParam("num") String num, Model model) {

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id ="";
		if (principal instanceof UserDetails) {
		   id = ((UserDetails)principal).getUsername();
		} else {
		   id = principal.toString();
		}
		
		// coin 테이블의 합산결과가 coin.do 호출시 member 테이블의 coin 값을 업데이트하므로 
		// coin 테이블만 DB반영함
		CoinVO cvo = new CoinVO();
		cvo.setM_id(id);
		cvo.setCoin(Integer.parseInt(num));
		cvo.setPrice(Integer.parseInt(num) * 10000);
		coinService.coinTblUpdate(cvo);
		
		return "redirect:/user/coin.do";
		
	}
	
	// 기간별 내 코인 충전 내역 - ajax.jsp 만들기 (필터 걸어서 검색)
	@RequestMapping(value="user/my_coin_ajax.do", method= {RequestMethod.POST})
	public void my_coin_ajax(@RequestParam HashMap<String, Object> map, Model model) {
		System.out.println(map.get("period"));
		if (map.get("period").equals("전체")) {
			List<HashMap<String, Object>> coinlist = coinService.coinViewPeriod1(map);
			model.addAttribute("coinlist", coinlist);
		}else if (map.get("period").equals("1주일")){
			List<HashMap<String, Object>> coinlist = coinService.coinViewPeriod2(map);
			model.addAttribute("coinlist", coinlist);
		}else if (map.get("period").equals("1개월")){
			List<HashMap<String, Object>> coinlist = coinService.coinViewPeriod3(map);
			model.addAttribute("coinlist", coinlist);
		}
	}
		
	
	
	// 관리자
	// 일일 코인 페이지에 매핑 -> coin테이블의 데이터를 모두 출력
	@RequestMapping("admin/dailycoin.do")
	public void coinlist(Model model, CoinVO vo) {
		List<HashMap<String, Object>> list = coinService.allCoinList();
		model.addAttribute("coinList", list);
	}
	
	// 관리자
	// 월별 코인량을 불러오기 위한 함수
	@RequestMapping("admin/monthlycoin.do")
	public void monthlyCoinList(Model model) {
		List<HashMap<String, Object>> list = coinService.monthlyCoinList();
		model.addAttribute("coinList", list);
	}
}
