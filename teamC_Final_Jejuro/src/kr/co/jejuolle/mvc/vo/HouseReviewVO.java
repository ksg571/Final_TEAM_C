package kr.co.jejuolle.mvc.vo;

public class HouseReviewVO {
	private int hrNo,hNo,uNo;
	private String hrContent,hrDate,hrTitle,hrUser;
	private double hrPoint;
	
	public double getHrPoint() {
		return hrPoint;
	}
	public void setHrPoint(double hrPoint) {
		this.hrPoint = hrPoint;
	}
	public String getHrUser() {
		return hrUser;
	}
	public void setHrUser(String hrUser) {
		this.hrUser = hrUser;
	}
	public String getHrTitle() {
		return hrTitle;
	}
	public void setHrTitle(String hrTitle) {
		this.hrTitle = hrTitle;
	}
	public int getHrNo() {
		return hrNo;
	}
	public void setHrNo(int hrNo) {
		this.hrNo = hrNo;
	}
	public int gethNo() {
		return hNo;
	}
	public void sethNo(int hNo) {
		this.hNo = hNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	
	public String getHrContent() {
		return hrContent;
	}
	public void setHrContent(String hrContent) {
		this.hrContent = hrContent;
	}
	public String getHrDate() {
		return hrDate;
	}
	public void setHrDate(String hrDate) {
		this.hrDate = hrDate;
	}
}
