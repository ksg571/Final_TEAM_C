package kr.co.jejuolle.mvc.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jejuolle.mvc.vo.HouseVO;
import kr.co.jejuolle.mvc.vo.MyplanVO;
import kr.co.jejuolle.mvc.vo.PlanMoneyVO;
import kr.co.jejuolle.mvc.vo.TourSpotVO;
@Repository
public class MyPlan_Imple implements MyPlan_Inter{

	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public void add_myPlan(MyplanVO vo) {
		ss.insert("myplan.add_myplan", vo);
	}

	@Override
	public MyplanVO view_myPlan(int uNo) {
		return ss.selectOne("myplan.see_myplan", uNo);
	}

	@Override
	public List<HouseVO> house_pick(int uNo) {
		return ss.selectList("myplan.house_pick", uNo);
	}

	@Override
	public List<TourSpotVO> tour_pick(int uNo) {
		return ss.selectList("myplan.tour_pick", uNo);
	}

	@Override
	public List<HouseVO> house_res(int uNo) {
		return ss.selectList("myplan.house_res", uNo);
	}

	@Override
	public void add_planMoney(PlanMoneyVO vo) {
		ss.insert("myplan.add_money", vo);
		
	}

}
