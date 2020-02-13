package kr.co.jejuolle.mvc.dao;

import kr.co.jejuolle.mvc.vo.HouseVO;
import kr.co.jejuolle.mvc.vo.PaymentVO;

public interface Reservation_Inter {
	public HouseVO list_res(int rvNo);
	public int del_res(int rvNo);
	public void add_pay(PaymentVO vo);
}
