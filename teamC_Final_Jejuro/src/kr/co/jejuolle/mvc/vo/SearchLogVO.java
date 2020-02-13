package kr.co.jejuolle.mvc.vo;

public class SearchLogVO {
	private int sNo,sCount;
	private String sWord,sDate;
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public int getsCount() {
		return sCount;
	}
	public void setsCount(int sCount) {
		this.sCount = sCount;
	}
	public String getsWord() {
		return sWord;
	}
	public void setsWord(String sWord) {
		this.sWord = sWord;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
}
