package kr.co.jejuolle.mvc.vo;

public class LoginLogVO {
	private int lNo,uNo;
	private String lStatus,lDate;
	public int getlNo() {
		return lNo;
	}
	public void setlNo(int lNo) {
		this.lNo = lNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public String getlStatus() {
		return lStatus;
	}
	public void setlStatus(String lStatus) {
		this.lStatus = lStatus;
	}
	public String getlDate() {
		return lDate;
	}
	public void setlDate(String lDate) {
		this.lDate = lDate;
	}
}
