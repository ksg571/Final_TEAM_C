package kr.co.jejuolle.mvc.vo;

public class AnswerVO {
	private int anum,qnum;
	private String Qanswer;
	public int getAnum() {
		return anum;
	}
	public void setAnum(int anum) {
		this.anum = anum;
	}
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public String getQanswer() {
		return Qanswer;
	}
	public void setQanswer(String qanswer) {
		Qanswer = qanswer;
	}
}
