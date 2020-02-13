package kr.co.jejuolle.mvc.vo;

import java.util.List;

public class ReservationVO {
	
	private String startDate,endDate,rvDate;
	private int rvNo;
	private int rNo,uNo,rvPeople;
	private List<PaymentVO> paymentvo;
	
	public String getStartDate() {
		return startDate;
	}
	public int getRvNo() {
		return rvNo;
	}
	public String getRvDate() {
		return rvDate;
	}
	public void setRvDate(String rvDate) {
		this.rvDate = rvDate;
	}
	public void setRvNo(int rvNo) {
		this.rvNo = rvNo;
	}
	public List<PaymentVO> getPaymentvo() {
		return paymentvo;
	}
	public void setPaymentvo(List<PaymentVO> paymentvo) {
		this.paymentvo = paymentvo;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public int getRvPeople() {
		return rvPeople;
	}
	public void setRvPeople(int rvPeople) {
		this.rvPeople = rvPeople;
	}
	

}
