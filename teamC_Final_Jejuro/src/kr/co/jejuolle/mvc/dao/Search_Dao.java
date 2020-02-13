package kr.co.jejuolle.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jejuolle.mvc.vo.SearchListVO;
import kr.co.jejuolle.mvc.vo.SearchVO;

@Repository
public class Search_Dao implements Search_Imple {
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public int searchCount(String search) {
		return ss.selectOne("search.count", search);
	}

	@Override
	public List<SearchListVO> totalAllSearchList(SearchVO svo) {
		return ss.selectList("search.list",svo);
	}

	@Override
	public void searchpageCount(String search) {
		ss.update("search.searchupdate", search);
	}

}
