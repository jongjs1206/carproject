package com.carproject.service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.exec.CommandLine;
import org.apache.commons.exec.DefaultExecutor;
import org.apache.commons.exec.PumpStreamHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.dao.SalesDAOImpl;
import com.carproject.domain.MemberVO;
import com.carproject.domain.SalesVO;

@Repository("SalesService") 
public class SalesServiceImpl implements SalesService {

	@Autowired 
	private SalesDAOImpl salesDAO;

	//////////////////////////////////////////////////////////////////////////////////////
	@Override 
	public void salesInsert(SalesVO vo) {		// 글 등록
		salesDAO.salesInsert(vo);
	}
	
	@Override 
	public void salesModify(SalesVO vo) {		// 글 수정
		salesDAO.salesModify(vo);
	}
	
	@Override 
	public void salesDelete(SalesVO vo) {		// 글 수정
		salesDAO.salesDelete(vo);
	}
	
	@Override 
	public void salesCheck(SalesVO vo) {		// 글 확인
		salesDAO.salesCheck(vo);
	}
	
	
	//////////////////////////////////////////////////////////////////////////////////////
	@Override
	public List<HashMap<String, Object>> brandList(){					// 제조사
		return salesDAO.brandList();
	}
	
	@Override
	public List<HashMap<String, Object>> model(SalesVO vo){				// 모델
		return salesDAO.model(vo);
	}
	
	@Override
	public List<HashMap<String, Object>> detailmodel(SalesVO vo){		// 세부모델
		return salesDAO.detailmodel(vo);
	}
	
	@Override
	public List<HashMap<String, Object>> grade(SalesVO vo){				// 등급
		return salesDAO.grade(vo);
	}
	
	@Override
	public List<HashMap<String, Object>> detailgrade(SalesVO vo){		// 세부등급
		return salesDAO.detailgrade(vo);
	}
		
	//////////////////////////////////////////////////////////////////////////////////////
	@Override
	public void uploadBtn(SalesVO vo){			// 등록하기 버튼
		salesDAO.uploadBtn(vo);
	}
	
	@Override
	public int modifyBtn(SalesVO vo){			// 수정하기 버튼(상세페이지)
		return salesDAO.modifyBtn(vo);
	}
	
	@Override
	public void saveModify(SalesVO vo){			// 수정하기 버튼(글 수정 페이지)
		salesDAO.saveModify(vo);
	}
	
	@Override
	public void deleteBtn(SalesVO vo){			// 삭제하기 버튼
		salesDAO.deleteBtn(vo);
	}
	
	 @Override
	 public int find_sell_id() {            // 신규부여 될 sell_id 
		 return salesDAO.find_sell_id();
	 }

	
	//////////////////////////////////////////////////////////////////////////////////////
	@Override
	public SalesVO salesDetail(Long num) {		// 상세페이지
		return salesDAO.salesDetail(num);
	}
	
	
	// 이미지 분석 (1)
	public String pystart(String sell_id) {
		System.out.println("Python Call");
		String v_result = "";

		String[] command = new String[3];
		command[0] = "python";
		command[1] = "C:\\Python\\sachawon/main.py";
		command[2] = "gs://car_image_for_analysis/" + sell_id + "/img1.png";
		try {
			v_result = execPython(command, sell_id);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {			
			return v_result;
		}
	} // 이미지 분석 (1)

	// 이미지 분석 (2) 
	public String execPython(String[] command, String sell_id) throws IOException, InterruptedException {
		CommandLine commandLine = CommandLine.parse(command[0]);
		for (int i=1; i<command.length; i++) {
			commandLine.addArgument(command[i]);
		}
		String confirm_result = "";

		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		PumpStreamHandler pumpStreamHandler = new PumpStreamHandler(outputStream);
		DefaultExecutor executor = new DefaultExecutor();
		executor.setStreamHandler(pumpStreamHandler);
		int result = executor.execute(commandLine);
		System.out.println("result: " + result);
		System.out.printf("게시글번호 %s의 이미지 분석결과입니다.", sell_id);
		System.out.println("output: " + outputStream.toString());
		String v_result = outputStream.toString();

		if (v_result.contains("Description: Car")) {
			String[] v_result_split = v_result.split("Description: Car");
			String[] v_result_split2 = v_result_split[0].split(" ");
			ArrayList<String> list = new ArrayList<>(Arrays.asList(v_result_split2));
			String final_result = list.get(list.size()-1);
			if (Double.parseDouble(final_result) > 0.5) {
				confirm_result = "True";						// 자동차 사진일 경우 True 를 리턴
			}
		} else {
			confirm_result = "False";							// 자동차 사진이 아닐 경우 False 를 리턴
		}
		return confirm_result;
	}

	// 이미지분석 결과를 해당 판매글의 DB에 입력
	public void insertAnalysis(HashMap<String, String> analysis) {
		salesDAO.insertAnalysis(analysis);
	}
	
	// 글 등록시 코인 -1 반영 (코인테이블, 멤버테이블)
	public void useCoinC(MemberVO vo) {
		salesDAO.useCoinC(vo);
	}
	public void useCoinM(MemberVO vo) {
		salesDAO.useCoinM(vo);
	}
		
	
}


