package kr.co.jejuolle.mvc.dao;

import kr.co.jejuolle.mvc.vo.LoginLogVO;
import kr.co.jejuolle.mvc.vo.UsersVO;

public interface Users_Inter {
	public void addUser(UsersVO vo);

	public int idCheck(String uuId);

	public UsersVO login(UsersVO vo);

	public void addLoginLogging(LoginLogVO vo);
}
