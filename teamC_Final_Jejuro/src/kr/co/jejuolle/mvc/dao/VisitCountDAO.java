package kr.co.jejuolle.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jejuolle.mvc.vo.VisitCountVO;

@Repository
public class VisitCountDAO implements Visit_Imple {
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public void insertVisitor(VisitCountVO vo) {
		ss.insert("visite.int",vo);

	}

	@Override
	public int visitecount() {
		int count =ss.selectOne("visite.count");
		return count;
	}

}
