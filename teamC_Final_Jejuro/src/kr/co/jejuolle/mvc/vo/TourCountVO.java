package kr.co.jejuolle.mvc.vo;

public class TourCountVO {
//해당 VO는 DTO입니다. 서버와관련없는 DTO
	private int count,start,rvtno;

	public int getRvtno() {
		return rvtno;
	}

	public void setRvtno(int rvtno) {
		this.rvtno = rvtno;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}
	
}
