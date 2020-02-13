package kr.co.jejuolle.mvc.vo;

import java.util.List;

public class TourSpotVO {
	
	private String tName,tInfo,tTel,tAddr1,tAddr2,tTopImg,tImg1,tImg2,tImg3,tImg4,tType;
	private int tNo,tPostNum,tHit,tlikes,tpicks;
	private double tPoint;
	
	public double gettPoint() {
		return tPoint;
	}
	public void settPoint(double tPoint) {
		this.tPoint = tPoint;
	}
	private List<TourPickVO> tourPick;
	
	public int getTlikes() {
		return tlikes;
	}
	public void setTlikes(int tlikes) {
		this.tlikes = tlikes;
	}
	public int getTpicks() {
		return tpicks;
	}
	public void setTpicks(int tpicks) {
		this.tpicks = tpicks;
	}
	public List<TourPickVO> getTourPick() {
		return tourPick;
	}
	public void setTourPick(List<TourPickVO> tourPick) {
		this.tourPick = tourPick;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public String gettInfo() {
		return tInfo;
	}
	public void settInfo(String tInfo) {
		this.tInfo = tInfo;
	}
	public String gettTel() {
		return tTel;
	}
	public void settTel(String tTel) {
		this.tTel = tTel;
	}
	public String gettAddr1() {
		return tAddr1;
	}
	public void settAddr1(String tAddr1) {
		this.tAddr1 = tAddr1;
	}
	public String gettAddr2() {
		return tAddr2;
	}
	public void settAddr2(String tAddr2) {
		this.tAddr2 = tAddr2;
	}
	public String gettTopImg() {
		return tTopImg;
	}
	public void settTopImg(String tTopImg) {
		this.tTopImg = tTopImg;
	}
	public String gettImg1() {
		return tImg1;
	}
	public void settImg1(String tImg1) {
		this.tImg1 = tImg1;
	}
	public String gettImg2() {
		return tImg2;
	}
	public void settImg2(String tImg2) {
		this.tImg2 = tImg2;
	}
	public String gettImg3() {
		return tImg3;
	}
	public void settImg3(String tImg3) {
		this.tImg3 = tImg3;
	}
	public String gettImg4() {
		return tImg4;
	}
	public void settImg4(String tImg4) {
		this.tImg4 = tImg4;
	}
	public int gettNo() {
		return tNo;
	}
	public void settNo(int tNo) {
		this.tNo = tNo;
	}
	public int gettPostNum() {
		return tPostNum;
	}
	public void settPostNum(int tPostNum) {
		this.tPostNum = tPostNum;
	}
	public String gettType() {
		return tType;
	}
	public void settType(String tType) {
		this.tType = tType;
	}
	public int gettHit() {
		return tHit;
	}
	public void settHit(int tHit) {
		this.tHit = tHit;
	}

	
}
