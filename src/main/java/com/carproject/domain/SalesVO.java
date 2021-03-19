package com.carproject.domain;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class SalesVO {         
   private int sell_id;         // 판매글 번호
   private int g_id;            // 등급 번호
   private String m_id;         // 회원 아이디
   private String title;        // 글 제목
   private String w_date;       // 글 등록 날짜
   private String old;          // 연식
   private String mile;         // 주행 거리
   private String color;        // 차 색깔
   private String accident;     // 사고 여부
   private int price;           // 판매 가격
   private String option;       // 차량 옵션
   private String status;       // 게시 상태
   private String url;          // url
   private String vehicle_num;  // 차량 번호
   private String baeki;        // 배기량
   private String guarantee;    // 보증
   private String fuel;         // 연료
   private String gear;         // 변속기
   private String seller;       // 판매자
   private String m_name;       // 회원 이름
   private String tel;          // 회원 전화번호
   private String content;      // 설명글
   
   private String jejosa;       // 제조사
   private String model;        // 모델
   private String detail;       // 세부 모델
   private String grade1;       // 등급
   private String grade2;       // 세부 등급
   
   private String image;        // 이미지
   private String rFname;       // 업로드 사진

   private long rFsize;			// 업로드 사진 크기
   
   private String strOption;    // 가공한 option 값
   private long num;            // 상세페이지에 불러올 sell_id 값
   
   private String[] re_option;  // 옵션값들
   
   private String analysis;		// vision 이미지분석 결과 (T/F)
   
   private String p_price;       // 현재 시세
   private String after2_price;  // 2년 후 시세
   private String after4_price;  // 4년 후 시세
   private String f_price;       // 6년 후 시세
   
   
   public int getSell_id() {
      return sell_id;
   }
   public void setSell_id(int sell_id) {
      this.sell_id = sell_id;
   }

   public int getG_id() {
      return g_id;
   }
   public void setG_id(int g_id) {
      this.g_id = g_id;
   }

   public String getM_id() {
      return m_id;
   }
   public void setM_id(String m_id) {
      this.m_id = m_id;
   }

   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }

   public String getW_date() {
      return w_date;
   }
   public void setW_date(String w_date) {
      this.w_date = w_date;
   }

   public String getOld() {
      return old;
   }
   public void setOld(String old) {
      this.old = old;
   }

   public String getMile() {
      return mile;
   }
   public void setMile(String mile) {
      this.mile = mile;
   }

   public String getColor() {
      return color;
   }
   public void setColor(String color) {
      this.color = color;
   }

   public String getAccident() {
      return accident;
   }
   public void setAccident(String accident) {
      this.accident = accident;
   }

   public int getPrice() {
      return price;
   }
   public void setPrice(int price) {
      this.price = price;
   }

   public String getOption() {
      return option;
   }
   public void setOption(String option) {
      this.option = option;
   }

   public String getStatus() {
      return status;
   }
   public void setStatus(String status) {
      this.status = status;
   }

   public String getUrl() {
      return url;
   }
   public void setUrl(String url) {
      this.url = url;
   }

   public String getVehicle_num() {
      return vehicle_num;
   }
   public void setVehicle_num(String vehicle_num) {
      this.vehicle_num = vehicle_num;
   }

   public String getBaeki() {
      return baeki;
   }
   public void setBaeki(String baeki) {
      this.baeki = baeki;
   }

   public String getGuarantee() {
      return guarantee;
   }
   public void setGuarantee(String guarantee) {
      this.guarantee = guarantee;
   }

   public String getFuel() {
      return fuel;
   }
   public void setFuel(String fuel) {
      this.fuel = fuel;
   }

   public String getGear() {
      return gear;
   }
   public void setGear(String gear) {
      this.gear = gear;
   }

   public String getSeller() {
      return seller;
   }
   public void setSeller(String seller) {
      this.seller = seller;
   }

   public String getModel() {
      return model;
   }
   public void setModel(String model) {
      this.model = model;
   }

   public String getDetail() {
      return detail;
   }
   public void setDetail(String detail) {
      this.detail = detail;
   }

   public String getGrade1() {
      return grade1;
   }
   public void setGrade1(String grade1) {
      this.grade1 = grade1;
   }

   public String getGrade2() {
      return grade2;
   }
   public void setGrade2(String grade2) {
      this.grade2 = grade2;
   }

   public String getM_name() {
      return m_name;
   }
   public void setM_name(String m_name) {
      this.m_name = m_name;
   }

   public String getTel() {
      return tel;
   }
   public void setTel(String tel) {
      this.tel = tel;
   }
   
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }

   public String getJejosa() {
      return jejosa;
   }
   public void setJejosa(String jejosa) {
      this.jejosa = jejosa;
   }
   
   public String getImage() {
      return image;
   }
   public void setImage(String image) {
      this.image = image;
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
   
   public String getStrOption() {
      return strOption;
   }
   public void setStrOption(String strOption) {
      this.strOption = strOption;
   }
   
   public String[] getRe_option() {
      return re_option;
   }
   public void setRe_option(String[] re_option) {
      this.re_option = re_option;
   }
   
   public long getNum() {
      return num;
   }
   public void setNum(long num) {
      this.num = num;
   }
   
   public String getAnalysis() {
	   return analysis;
   }
   public void setAnalysis(String analysis) {
	   this.analysis = analysis;
   }
   
   public String getP_price() {
      return p_price;
   }
   public void setP_price(String p_price) {
      this.p_price = p_price;
   }
   
   public String getF_price() {
      return f_price;
   }
   public void setF_price(String f_price) {
      this.f_price = f_price;
   }
   
   public String getAfter2_price() {
      return after2_price;
   }
   public void setAfter2_price(String after2_price) {
      this.after2_price = after2_price;
   }
   
   public String getAfter4_price() {
      return after4_price;
   }
   public void setAfter4_price(String after4_price) {
      this.after4_price = after4_price;
   }
}