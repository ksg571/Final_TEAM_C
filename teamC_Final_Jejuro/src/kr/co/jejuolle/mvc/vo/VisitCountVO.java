package kr.co.jejuolle.mvc.vo;

public class VisitCountVO {
	private String visit_id, visit_ip, visit_time, visit_agent;
	private int count;

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getVisit_id() {
		return visit_id;
	}

	public void setVisit_id(String visit_id) {
		this.visit_id = visit_id;
	}

	public String getVisit_ip() {
		return visit_ip;
	}

	public void setVisit_ip(String visit_ip) {
		this.visit_ip = visit_ip;
	}

	public String getVisit_time() {
		return visit_time;
	}

	public void setVisit_time(String visit_time) {
		this.visit_time = visit_time;
	}

	public String getVisit_agent() {
		return visit_agent;
	}

	public void setVisit_agent(String visit_agent) {
		this.visit_agent = visit_agent;
	}

	
}
