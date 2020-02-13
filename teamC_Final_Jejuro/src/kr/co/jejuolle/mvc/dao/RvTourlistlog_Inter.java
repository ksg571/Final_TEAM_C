package kr.co.jejuolle.mvc.dao;

import java.util.List;

import kr.co.jejuolle.mvc.vo.RvTourlistlogVO;
import kr.co.jejuolle.mvc.vo.TourCountVO;

public interface RvTourlistlog_Inter {
	public List<RvTourlistlogVO> Rvtlist(TourCountVO vo);
	public int Count();
}
