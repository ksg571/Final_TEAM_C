package kr.co.jejuolle.mvc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jejuolle.mvc.vo.TourSpotVO;

@Repository
public class Default_Dao {
	@Autowired
	private SqlSessionTemplate ss;
	
	public List<TourSpotVO> tourHitList(){
		return ss.selectList("tourspot.tourHitList");
	}
}
