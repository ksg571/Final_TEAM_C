package kr.co.jejuolle.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jejuolle.mvc.vo.RvTourlistlogVO;
import kr.co.jejuolle.mvc.vo.TourCountVO;

@Repository
public class RvTourlistlog_Dao implements RvTourlistlog_Inter{
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public List<RvTourlistlogVO> Rvtlist(TourCountVO vo){
		return ss.selectList("rvtourlist.list",vo);
	}

	@Override
	public int Count() {
		return ss.selectOne("rvtourlist.count");
	}
	
}
