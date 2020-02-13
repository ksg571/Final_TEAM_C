package kr.co.jejuolle.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jejuolle.mvc.vo.SearchLoggerDTO;
@Repository
public class SearchFilterdao implements SearchFilterinterdao {
	
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public List<SearchLoggerDTO> searchrank() {
		System.out.println("searchrank¿« dao");
		return ss.selectList("search.searchrank");
	}

}
