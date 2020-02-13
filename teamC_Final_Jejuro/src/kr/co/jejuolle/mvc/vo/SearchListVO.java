package kr.co.jejuolle.mvc.vo;

public class SearchListVO {
	private String hname,htype,htopimg,atype;
	private int hno,tno;
	public String getAtype() {
		return atype;
	}
	public void setAtype(String atype) {
		this.atype = atype;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public String getHtype() {
		return htype;
	}
	public void setHtype(String htype) {
		this.htype = htype;
	}
	public String getHtopimg() {
		return htopimg;
	}
	public void setHtopimg(String htopimg) {
		this.htopimg = htopimg;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
}
