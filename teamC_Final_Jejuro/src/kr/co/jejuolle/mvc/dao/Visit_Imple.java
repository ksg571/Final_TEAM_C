package kr.co.jejuolle.mvc.dao;

import kr.co.jejuolle.mvc.vo.VisitCountVO;

public interface Visit_Imple {
	public void insertVisitor(VisitCountVO vo);
	public int visitecount();
}
