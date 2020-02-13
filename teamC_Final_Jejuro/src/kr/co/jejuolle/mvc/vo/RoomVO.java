package kr.co.jejuolle.mvc.vo;

import java.util.List;

public class RoomVO {
	private String rName,rImg,rInfo;
	private int rNo,hNo,rCount,rPrice,rPeople;
	private List<ReservationVO> reservationVO;
	private String startDate,endDate;
	private int rvPeople;
	
	
	public String getStartDate() {
		return startDate;
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
	public int getRvPeople() {
		return rvPeople;
	}
	public void setRvPeople(int rvPeople) {
		this.rvPeople = rvPeople;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getrImg() {
		return rImg;
	}
	public void setrImg(String rImg) {
		this.rImg = rImg;
	}
	public String getrInfo() {
		return rInfo;
	}
	public void setrInfo(String rInfo) {
		this.rInfo = rInfo;
	}
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public int gethNo() {
		return hNo;
	}
	public void sethNo(int hNo) {
		this.hNo = hNo;
	}
	public int getrCount() {
		return rCount;
	}
	public void setrCount(int rCount) {
		this.rCount = rCount;
	}
	public int getrPrice() {
		return rPrice;
	}
	public void setrPrice(int rPrice) {
		this.rPrice = rPrice;
	}
	public int getrPeople() {
		return rPeople;
	}
	public void setrPeople(int rPeople) {
		this.rPeople = rPeople;
	}
	public List<ReservationVO> getReservationVO() {
		return reservationVO;
	}
	public void setReservationVO(List<ReservationVO> reservationVO) {
		this.reservationVO = reservationVO;
	}
	
	

}
