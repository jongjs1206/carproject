package com.carproject.domain;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	
	
	private String m_id ; /* 아이디 */
	private String m_pw; /* 비밀번호 */
	private String m_name; /* 이름 */
	private String gender; /* 성별 */
	private String email; /* 이메일 */
	private String birth; /* 생일 */
	private String tel; /* 전화번호 */
	private String photo; /* 프로필사진 */
	private String coin; /* 프로필사진 */
	private String w_date; /* 가입일 */
	private String ex_date; /* 탈퇴일 */
	private String state; /* 상태 */
	private String enabled; /*  */
	private String etc; /*  */
	
	private String auth; /* 권한 */	
	private long picSize; /* 프로필사진용량 */
	
	
	//*************************************************
	MultipartFile file;	// write.jsp에 파일첨부시 name="file"과 동일한 변수명
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
		
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyMMddhhmmss");
		
		// 업로드 파일 접근
		if(! file.isEmpty()){
			this.photo = format.format(now)+ file.getOriginalFilename();
			this.picSize = file.getSize();
			
			//***********************************************
			// 해당 경로로 변경
			File f = new File("C:\\Users\\moonm\\git\\mycar\\"+photo);
			try {
				file.transferTo(f);
				
			} catch (IllegalStateException e) {				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getCoin() {
		return coin;
	}
	public void setCoin(String coin) {
		this.coin = coin;
	}
	public String getW_date() {
		return w_date;
	}
	public void setW_date(String w_date) {
		this.w_date = w_date;
	}
	public String getEx_date() {
		return ex_date;
	}
	public void setEx_date(String ex_date) {
		this.ex_date = ex_date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public long getPicSize() {
		return picSize;
	}
	public void setPicSize(long picSize) {
		this.picSize = picSize;
	}
}
