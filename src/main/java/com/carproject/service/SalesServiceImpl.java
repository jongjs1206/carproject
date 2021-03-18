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
	@Autowired
	private tensorSocket ts;

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
	public SalesVO salesDetail(long num) {		// 상세페이지
		return salesDAO.salesDetail(num);
	}
	
	//////////////////////////////////////////////////////////////////////////////////////
	// 이미지 분석 (1)
	public String pystart(String sell_id) {
		System.out.println("Python Call");
		String v_result = "";

		// 원본 코드
//		String[] command = new String[3];
//		command[0] = "python ";
//		command[1] = "C:\\Python\\local_to_google/vision.py";
//		command[2] = "gs://car_image_for_analysis/" + sell_id + "/img1.png";
		
		// 클라우드 서버로 SSH 접속 후 vision.py 실행
		// (1) CMD에 입력할 명령어 만들기
		// ssh root@35.222.239.26 ------- 클라우드의 35.222.239.26 IP인 서버의 root 계정으로 SSH 접속
		// python3 /opt/server/vision.py gs://car_image_for_analysis/sell_id/img1.png
		String[] command = new String[4];
		command[0] = "ssh root@35.222.239.26\n";
		command[1] = "python3 ";
		command[2] = "/opt/server/vision.py ";
		command[3] = "gs://car_image_for_analysis/" + sell_id + "/img1.png";
		
		try {
			// (2) CMD로 명령어 전송을 담당하는 execPython 함수 호출 
			v_result = execPython(command, sell_id);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {			
			return v_result;
		}
	} // 이미지 분석 (1)

	//////////////////////////////////////////////////////////////////////////////////////
	// 이미지 분석 (2) 
	public String execPython(String[] command, String sell_id) throws IOException, InterruptedException {
		// CMD에 입력을 담당하는 객체 CommandLine 에 인자로 받아온 String 타입의 배열을 파싱하여 넣음
		CommandLine commandLine = CommandLine.parse(command[0]);
		for (int i=1; i<command.length; i++) {
			commandLine.addArgument(command[i]);
		}
		String confirm_result = "";

		// Byte 배열을 전송하는 통로 열기
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		PumpStreamHandler pumpStreamHandler = new PumpStreamHandler(outputStream);
		// 디폴트 명령자 executor 생성
		DefaultExecutor executor = new DefaultExecutor();
		// 디폴트 명령자에 통로 스트림 할당
		executor.setStreamHandler(pumpStreamHandler);
		
		// 만들어온 CMD명령어를 디폴트 명령자로 전송
		int result = executor.execute(commandLine);
		
		// python 실행 결과를 콘솔로 찍어보기
		System.out.println("result: " + result);
		System.out.printf("게시글번호 %s의 이미지 분석결과입니다.", sell_id);
		System.out.println("output: " + outputStream.toString());
		
		// python 실행 결과를 String 형변환 후 v_result에 담음
		String v_result = outputStream.toString();

		// 분석결과인 v_result에 Description: Car 라는 구문이 있는지 확인 
		if (v_result.contains("Description: Car")) {
			String[] v_result_split = v_result.split("Description: Car");
			String[] v_result_split2 = v_result_split[0].split(" ");
			ArrayList<String> list = new ArrayList<>(Arrays.asList(v_result_split2));
			String final_result = list.get(list.size()-1);
			// Description: Car의 값이 0.5보다 큰 지 확인
			if (Double.parseDouble(final_result) > 0.5) {
				// 자동차 사진이 맞다고 판단하며 True 를 리턴
				confirm_result = "True";						
			}
		} else {
			// 자동차 사진으로 판단할 수 없을 경우 False 를 리턴
			confirm_result = "False";							
		}
		return confirm_result;
	}

	//////////////////////////////////////////////////////////////////////////////////////
	// 이미지분석 결과(T/F)를 해당 판매글의 DB에 입력
	public void insertAnalysis(HashMap<String, String> analysis) {
		salesDAO.insertAnalysis(analysis);
	}
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////
	// 글 등록시 코인 -1 반영 (코인테이블, 멤버테이블)
	public void useCoinC(MemberVO vo) {
		salesDAO.useCoinC(vo);
	}
	public void useCoinM(MemberVO vo) {
		salesDAO.useCoinM(vo);
	}
	
	
	/////////////////////////////////////////////////////////////////////////////////////
	// 옵션 정보를 바탕으로 시세 예측
	public SalesVO predict(SalesVO vo) {

		// 결과값을 받을 VO 객체 생성
		SalesVO result = new SalesVO();
		tensorSocket ts =new tensorSocket();
		
		try {			
			String echo_msg = ts.tensor(vo);				
			// echo_msg 는 4개 시세가 모두 담겨있어 salesVO의 각 변수에 나눠담음
			result.setP_price(echo_msg.split("/")[0]);
			result.setAfter2_price(echo_msg.split("/")[1]);
			result.setAfter4_price(echo_msg.split("/")[2]);
			result.setF_price(echo_msg.split("/")[3]);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{			
			return result;
		}
	}
	
	/////////////////////////////////////////////////////////////////////////////////////
	// 시세 예측 업데이트
	public void insertPredict(SalesVO predict) {
		salesDAO.insertPredict(predict);
	}

		
	
}


