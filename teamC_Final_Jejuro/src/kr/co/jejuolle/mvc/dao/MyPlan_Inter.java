package kr.co.jejuolle.mvc.dao;


import java.util.List;

import kr.co.jejuolle.mvc.vo.HouseVO;
import kr.co.jejuolle.mvc.vo.MyplanVO;
import kr.co.jejuolle.mvc.vo.PlanMoneyVO;
import kr.co.jejuolle.mvc.vo.TourSpotVO;

public interface MyPlan_Inter {
	public void add_myPlan(MyplanVO vo);
	public MyplanVO view_myPlan(int uNo);
	public List<HouseVO> house_pick(int uNo);
	public List<TourSpotVO> tour_pick(int uNo);
	public List<HouseVO> house_res(int uNo);
	public void add_planMoney(PlanMoneyVO vo);
}
