package kr.co.jejuolle.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jejuolle.mvc.vo.HouseVO;
import kr.co.jejuolle.mvc.vo.PaymentVO;
@Repository
public class Reservation_Dao implements Reservation_Inter {

	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public HouseVO list_res(int rvNo) {
		return ss.selectOne("res.list_res", rvNo);
	}

	@Override
	public int del_res(int rvNo) {
		return ss.delete("res.del_res", rvNo);
	}

	@Override
	public void add_pay(PaymentVO vo) {
		ss.insert("res.add_pay", vo);
	}

}
