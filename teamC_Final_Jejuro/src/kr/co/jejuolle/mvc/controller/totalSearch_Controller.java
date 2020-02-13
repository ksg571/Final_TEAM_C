package kr.co.jejuolle.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jejuolle.mvc.dao.Search_Dao;
import kr.co.jejuolle.mvc.vo.PageVO;
import kr.co.jejuolle.mvc.vo.SearchListVO;
import kr.co.jejuolle.mvc.vo.SearchVO;

@Controller
public class totalSearch_Controller {
	@Autowired
	private Search_Dao search_Dao;

	@RequestMapping(value = "/totalsearch")
	public ModelAndView Totalsearch(HttpServletRequest request,HttpSession session, int page, String input){
		System.out.println(input);
		request.setAttribute(input, input);
		System.out.println(request.getParameter("input"));
		search_Dao.searchpageCount(input);
		SearchVO svo = new SearchVO();
		svo.setSearch(input);
		PageVO pageinfo = new PageVO();
		int rowsPerPage = 4; // 한 페이지당 보여줄 라인 수
		int pagesPerBlock = 5; // 한 페이지당 보여줄 블록 수
		int currentPage = page; // 현재 페이지
		int currentBlock = 0; // 현재 블록수
		if (currentPage % pagesPerBlock == 0) {// 현재 블록에 대한 연산
			currentBlock = currentPage / pagesPerBlock;
		} else {
			currentBlock = currentPage / pagesPerBlock + 1;
		}
		int startRow = (currentPage - 1) * rowsPerPage + 1;
		int endRow = currentPage * rowsPerPage;

		svo.setBegin(String.valueOf(startRow));
		System.out.println(svo.getBegin());
		svo.setEnd(String.valueOf(endRow));
		System.out.println(svo.getEnd());

		// 전체 레코드 수
		int totalRows = search_Dao.searchCount(svo.getSearch());
		System.out.println("totalRows:" + totalRows);

		int totalPages = 0;
		// 전체 페이지를 구하는 공식
		if (totalRows % rowsPerPage == 0) {
			totalPages = totalRows / rowsPerPage;
		} else {
			totalPages = totalRows / rowsPerPage + 1;
		}
		// 전체 블록을 구하는 공식
		int totalBlocks = 0;
		if (totalPages % pagesPerBlock == 0) {
			totalBlocks = totalPages / pagesPerBlock;
		} else {
			totalBlocks = totalPages / pagesPerBlock + 1;
		}
		// pageVO에 setter로 값을 주입.
		pageinfo.setSearch(svo.getSearch());
		pageinfo.setCurrentPage(currentPage);
		pageinfo.setCurrentBlock(currentBlock);
		pageinfo.setRowsPerPage(rowsPerPage);
		pageinfo.setPagesPerBlock(pagesPerBlock);
		pageinfo.setStartRow(startRow);
		pageinfo.setEndRow(endRow);
		pageinfo.setTotalRows(totalRows);
		pageinfo.setTotalPages(totalPages);
		pageinfo.setTotalBlocks(totalBlocks);
		List<SearchListVO> list = search_Dao.totalAllSearchList(svo);
		// -----------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search/totalsearch");
		// 페이지와 리스트값을 modelandview를 사용해서 값 전달.
		mav.addObject("search", svo.getSearch());
		mav.addObject("totalRows", totalRows);
		mav.addObject("pageInfo", pageinfo);
		mav.addObject("list", list);
		return mav;
	}
}
