package kr.co.jejuolle.mvc.vo;

import java.util.List;

public class HouseVO {

	private String hName,hInfo,hTel,hAddr1,hAddr2,hTopImg,hImg1,hImg2,hImg3,hImg4,hEvidence,hType;
	private int hNo,hmNo,hPostNum,hHit,hStatus,rvNo;
	private List<HousePickVO> housePick;
	private List<RoomVO> roomVO;
	private String rName,rImg,startDate,endDate,rvPeople;
	private int rPeople,rPrice,hpicks,hlikes;
	private double hPoint;

	public double gethPoint() {
		return hPoint;
	}
	public void sethPoint(double hPoint) {
		this.hPoint = hPoint;
	}

	public int getHpicks() {
		return hpicks;
	}
	public void setHpicks(int hpicks) {
		this.hpicks = hpicks;
	}
	public int getHlikes() {
		return hlikes;
	}
	public void setHlikes(int hlikes) {
		this.hlikes = hlikes;
	}
	public String gethName() {
		return hName;
	}
	public int getRvNo() {
		return rvNo;
	}
	public void setRvNo(int rvNo) {
		this.rvNo = rvNo;
	}
	public void sethName(String hName) {
		this.hName = hName;
	}
	public String gethInfo() {
		return hInfo;
	}
	public void sethInfo(String hInfo) {
		this.hInfo = hInfo;
	}
	public String gethTel() {
		return hTel;
	}
	public void sethTel(String hTel) {
		this.hTel = hTel;
	}
	public String gethAddr1() {
		return hAddr1;
	}
	public void sethAddr1(String hAddr1) {
		this.hAddr1 = hAddr1;
	}
	public String gethAddr2() {
		return hAddr2;
	}
	public void sethAddr2(String hAddr2) {
		this.hAddr2 = hAddr2;
	}
	public String gethTopImg() {
		return hTopImg;
	}
	public void sethTopImg(String hTopImg) {
		this.hTopImg = hTopImg;
	}
	public String gethImg1() {
		return hImg1;
	}
	public void sethImg1(String hImg1) {
		this.hImg1 = hImg1;
	}
	public String gethImg2() {
		return hImg2;
	}
	public void sethImg2(String hImg2) {
		this.hImg2 = hImg2;
	}
	public String gethImg3() {
		return hImg3;
	}
	public void sethImg3(String hImg3) {
		this.hImg3 = hImg3;
	}
	public String gethImg4() {
		return hImg4;
	}
	public void sethImg4(String hImg4) {
		this.hImg4 = hImg4;
	}
	public String gethEvidence() {
		return hEvidence;
	}
	public void sethEvidence(String hEvidence) {
		this.hEvidence = hEvidence;
	}
	public String gethType() {
		return hType;
	}
	public void sethType(String hType) {
		this.hType = hType;
	}
	public int gethNo() {
		return hNo;
	}
	public void sethNo(int hNo) {
		this.hNo = hNo;
	}
	public int getHmNo() {
		return hmNo;
	}
	public void setHmNo(int hmNo) {
		this.hmNo = hmNo;
	}
	public int gethPostNum() {
		return hPostNum;
	}
	public void sethPostNum(int hPostNum) {
		this.hPostNum = hPostNum;
	}
	public int gethHit() {
		return hHit;
	}
	public void sethHit(int hHit) {
		this.hHit = hHit;
	}
	public int gethStatus() {
		return hStatus;
	}
	public void sethStatus(int hStatus) {
		this.hStatus = hStatus;
	}
	public List<HousePickVO> getHousePick() {
		return housePick;
	}
	public void setHousePick(List<HousePickVO> housePick) {
		this.housePick = housePick;
	}
	public List<RoomVO> getRoomVO() {
		return roomVO;
	}
	public void setRoomVO(List<RoomVO> roomVO) {
		this.roomVO = roomVO;
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
	public String getRvPeople() {
		return rvPeople;
	}
	public void setRvPeople(String rvPeople) {
		this.rvPeople = rvPeople;
	}
	public int getrPeople() {
		return rPeople;
	}
	public void setrPeople(int rPeople) {
		this.rPeople = rPeople;
	}
	public int getrPrice() {
		return rPrice;
	}
	public void setrPrice(int rPrice) {
		this.rPrice = rPrice;
	}
	


}
