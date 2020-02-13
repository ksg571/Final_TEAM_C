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
		int rowsPerPage = 4; // �� �������� ������ ���� ��
		int pagesPerBlock = 5; // �� �������� ������ ��� ��
		int currentPage = page; // ���� ������
		int currentBlock = 0; // ���� ��ϼ�
		if (currentPage % pagesPerBlock == 0) {// ���� ��Ͽ� ���� ����
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

		// ��ü ���ڵ� ��
		int totalRows = search_Dao.searchCount(svo.getSearch());
		System.out.println("totalRows:" + totalRows);

		int totalPages = 0;
		// ��ü �������� ���ϴ� ����
		if (totalRows % rowsPerPage == 0) {
			totalPages = totalRows / rowsPerPage;
		} else {
			totalPages = totalRows / rowsPerPage + 1;
		}
		// ��ü ����� ���ϴ� ����
		int totalBlocks = 0;
		if (totalPages % pagesPerBlock == 0) {
			totalBlocks = totalPages / pagesPerBlock;
		} else {
			totalBlocks = totalPages / pagesPerBlock + 1;
		}
		// pageVO�� setter�� ���� ����.
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
		// �������� ����Ʈ���� modelandview�� ����ؼ� �� ����.
		mav.addObject("search", svo.getSearch());
		mav.addObject("totalRows", totalRows);
		mav.addObject("pageInfo", pageinfo);
		mav.addObject("list", list);
		return mav;
	}
}
