package com.carproject.domain;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class SalesVO {
	private String carNumber;		/* 차량 번호 */
	private String carBrand;		/* 제조사 */
	private String carModel;		/* 모델명 */
	private String carDetailModel;	/* 세부모델 */
	private String carGrade;		/* 등급 */
	private String carDetailGrade;	/* 세부등급 */
	private String carYear;			/* 연식 */
	private String carColor;		/* 색상 */
	private String km;				/* 주행거리 */
	private String cc;				/* 배기량 */
	private String accident;		/* 사고여부 */
	private String salesPrice;		/* 판매가격 */
	private String carGear;			/* 변속기 */
	private String carFuel;			/* 연료 */
	private String carOption;		/* 옵션선택 */
	private int salesNumber;		/* 글 번호 */
	private String title;			/* 글 제목 */
	private String status;			/* 상태 */
	private String guarantee;		/* 보증(보험) */
	private String seller;			/* 판매자 */
	private String wDate;			/* 글 등록 날짜 */ 
	private String m_id;				/* 아이디 */
	
	private String carImg;			/* 이미지 */
	private String rFname = null;
	private long rFsize;
	
	private String salesContext;	/* 설명글 */
	
	/* 이미지 업로드 */
	MultipartFile file;
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
		if(! file.isEmpty()){
			this.rFname = file.getOriginalFilename();
			this.rFsize = file.getSize();
			
			//***********************************************
			// 경로 자기꺼로
			File f = new File("C:\\Users\\kosmo_28\\git\\final\\src\\main\\webapp\\resources\\upload\\"+rFname);		
			
			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {				
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public String getCarNumber() {
		return carNumber;
	}
	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}
	public String getCarBrand() {
		return carBrand;
	}
	public void setCarBrand(String carBrand) {
		this.carBrand = carBrand;
	}
	public String getCarModel() {
		return carModel;
	}
	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}
	public String getCarDetailModel() {
		return carDetailModel;
	}
	public void setCarDetailModel(String carDetailModel) {
		this.carDetailModel = carDetailModel;
	}
	public String getCarGrade() {
		return carGrade;
	}
	public void setCarGrade(String carGrade) {
		this.carGrade = carGrade;
	}
	public String getCarDetailGrade() {
		return carDetailGrade;
	}
	public void setCarDetailGrade(String carDetailGrade) {
		this.carDetailGrade = carDetailGrade;
	}
	public String getCarYear() {
		return carYear;
	}
	public void setCarYear(String carYear) {
		this.carYear = carYear;
	}
	public String getCarColor() {
		return carColor;
	}
	public void setCarColor(String carColor) {
		this.carColor = carColor;
	}
	public String getKm() {
		return km;
	}
	public void setKm(String km) {
		this.km = km;
	}
	public String getCc() {
		return cc;
	}
	public void setCc(String cc) {
		this.cc = cc;
	}
	public String getAccident() {
		return accident;
	}
	public void setAccident(String accident) {
		this.accident = accident;
	}
	public String getSalesPrice() {
		return salesPrice;
	}
	public void setSalesPrice(String salesPrice) {
		this.salesPrice = salesPrice;
	}
	public String getCarGear() {
		return carGear;
	}
	public void setCarGear(String carGear) {
		this.carGear = carGear;
	}
	public String getCarFuel() {
		return carFuel;
	}
	public void setCarFuel(String carFuel) {
		this.carFuel = carFuel;
	}
	public String getCarOption() {
		return carOption;
	}
	public void setCarOption(String carOption) {
		this.carOption = carOption;
	}
	public String getCarImg() {
		return carImg;
	}
	public void setCarImg(String carImg) {
		this.carImg = carImg;
	}
	public String getrFname() {
		return rFname;
	}

	public void setrFname(String rFname) {
		this.rFname = rFname;
	}

	public long getrFsize() {
		return rFsize;
	}

	public void setrFsize(long rFsize) {
		this.rFsize = rFsize;
	}
	public String getSalesContext() {
		return salesContext;
	}
	public void setSalesContext(String salesContext) {
		this.salesContext = salesContext;
	}
	public int getSalesNumber() {
		return salesNumber;
	}
	public void setSalesNumber(int salesNumber) {
		this.salesNumber = salesNumber;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public String getGuarantee() {
		return guarantee;
	}
	public void setGuarantee(String guarantee) {
		this.guarantee = guarantee;
	}

	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	
	public String getm_id() {
		return m_id;
	}
	public void setm_id(String m_id) {
		this.m_id = m_id;
	}
}
