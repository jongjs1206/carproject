package com.carproject.domain;

public class CoinVO {
	private String m_id;   /* 아이디 */
	private String day;    /* 충전 날짜 */
	private int price;     /* 결제 금액 */
	private int coin;      /* 코인 수량 */
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCoin() {
		return coin;
	}
	public void setCoin(int coin) {
		this.coin = coin;
	}
	
	
	
}
