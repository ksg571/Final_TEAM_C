package kr.co.jejuolle.mvc.dao;

import java.util.List;

import kr.co.jejuolle.mvc.vo.SearchListVO;
import kr.co.jejuolle.mvc.vo.SearchVO;

public interface Search_Imple {
	public int searchCount(String search);
	public List<SearchListVO> totalAllSearchList(SearchVO svo);
	public void searchpageCount(String keyword);
}
