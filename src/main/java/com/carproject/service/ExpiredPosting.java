package com.carproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.carproject.domain.SalesVO;

@Controller
public class ExpiredPosting {
	
	@Autowired
	MemberService memberService;    

	@Scheduled(cron="00 00 01 * * *")
    public void scheduleTest() {

		SalesVO vo = new SalesVO();	
		
		//게시중인 sell_id & w_date 2주전 뽑기
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("status", "게시중");
		param.put("endDate", memberService.beforeTwoWeeks());
		List<HashMap<String, Object>> salesList = memberService.selectSale_admin(param);		
		
		//sell_id status='게시종료' 업데이트
		for(HashMap<String, Object> sales : salesList) {
			vo.setSell_id(Integer.parseInt(sales.get("sell_id").toString()));
			memberService.expiredPosting(vo);		
			
		}
		
    }

}