package kr.co.jejuolle.mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jejuolle.mvc.dao.RvTourlistlog_Dao;
import kr.co.jejuolle.mvc.dao.Tourspot_Dao;
import kr.co.jejuolle.mvc.vo.PageVO;
import kr.co.jejuolle.mvc.vo.RvTourlistlogVO;
import kr.co.jejuolle.mvc.vo.SearchVO;
import kr.co.jejuolle.mvc.vo.TourCountVO;
import kr.co.jejuolle.mvc.vo.TourLikeVO;
import kr.co.jejuolle.mvc.vo.TourPickVO;
import kr.co.jejuolle.mvc.vo.TourReviewVO;
import kr.co.jejuolle.mvc.vo.TourSpotVO;
import kr.co.jejuolle.mvc.vo.TrReportVO;

@Controller
public class Tour_Controller {

	@Autowired
	private Tourspot_Dao tourspot_Dao;
	@Autowired
	private RvTourlistlog_Dao rvtDao;

	// ������������
	@RequestMapping("/tourList")
	public ModelAndView tourList(TourCountVO count) {

		List<TourSpotVO> list = tourspot_Dao.tourspotlist();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tour/tourList");
		mav.addObject("list", list);

		int rvcnt = rvtDao.Count();
		int start = rvcnt - 3;

		count.setStart(start);
		count.setCount(rvcnt);

		List<RvTourlistlogVO> rvlist = rvtDao.Rvtlist(count);
		mav.addObject("rvlist", rvlist);
		return mav;
	}

	// ������ ������
	@RequestMapping("/tourdetail")
	public String tourdetail(HttpServletRequest request,HttpServletResponse response,
			Model m, int tNo, @RequestParam(defaultValue = "1") int page, String id,TourSpotVO tvo) {
		
		// �󼼺��� ������ �� ��ȸ�� ����
		tourspot_Dao.tourspotHit(tNo);

		PageVO pageInfo = new PageVO();
		int rowsPerPage = 5; // ���������� ������ ���� ��
		int pagesPerBlock = 5; // ���������� ������ ��� ��
		int currentPage = page; // ���� ������
		int currentBlock = 0; // ���� ��ϼ�

		if (currentPage % pagesPerBlock == 0) { // ���� ��Ͽ� ���� ����
			currentBlock = currentPage / pagesPerBlock;
		} else {
			currentBlock = currentPage / pagesPerBlock + 1;
		}

		int startRow = (currentPage - 1) * rowsPerPage + 1;
		int endRow = currentPage * rowsPerPage;

		SearchVO svo = new SearchVO();
		svo.setBegin(String.valueOf(startRow));
		svo.setEnd(String.valueOf(endRow));
		svo.setNo(tNo);

		// ��ü ���ڵ� ��
		int totalRows = tourspot_Dao.trListCnt(tNo);

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

		// PageVO�� setter�� ���� ����.
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setCurrentBlock(currentBlock);
		pageInfo.setRowsPerPage(rowsPerPage);
		pageInfo.setPagesPerBlock(pagesPerBlock);
		pageInfo.setStartRow(startRow);
		pageInfo.setEndRow(endRow);
		pageInfo.setTotalRows(totalRows);
		pageInfo.setTotalPages(totalPages);
		pageInfo.setTotalBlocks(totalBlocks);
		// ������
		m.addAttribute("pageInfo", pageInfo);

		// ������ �󼼺���
		tvo = tourspot_Dao.tourspotDetail(tNo);
		String info = tvo.gettInfo();
		String array[] = info.split("/");
		for (int i = 0; i < array.length; i++) {
			//System.out.println(array[i]);
		}
		m.addAttribute("tvo", tvo);

		// ������ ���� ����Ʈ
		List<TourReviewVO> trlist = tourspot_Dao.trList(svo);
		m.addAttribute("trlist", trlist);

		m.addAttribute("id", id);
		
		
		//------------------------------------------------------
		//Cookie ���°�
		tvo.settNo(tNo);
		Cookie lateCookie;
		String cookieValue;
		String addcookieValue = "";
		//��Ű �� �޾ƿ���
		Cookie[] getCookie = request.getCookies();
		//map �ʱ�ȭ
		Map<String, String> cookiemap = new HashMap<String, String>();
		//map�� ��Ű �� �ֱ�
		for (Cookie cookie : getCookie) {
			cookiemap.put(cookie.getName(), cookie.getValue());
			for (String mapkey : cookiemap.keySet()) {
				//��Ű�� key���� ���� �� �ֱ� �� ��ǰ key ��Ű �߰�
				if (!mapkey.equals("key")) {
					//��Ű�� ���� �� ����
					cookieValue = tvo.gettNo() + "/" + tvo.gettTopImg() + "#";
					//��Ű ���� �� �� ����
					lateCookie = new Cookie("key", cookieValue);
					//��Ű 7�� �� �ڵ� ����
					lateCookie.setMaxAge(60 * 60 * 24 * 7);
					//��Ű Ȱ��ȭ
					response.addCookie(lateCookie);
				//��Ű key�� ���� ��
				} else if (mapkey.equals("key")) {
					//��Ű���� ���� ���� '#'���� ����
					String[] cookieval = cookiemap.get(mapkey).split("#");
					cookieValue = tvo.gettNo() + "/" + tvo.gettTopImg() + "#";
					//�ߺ� ��ǰ üũ �� �ֱ� �� ��ǰ �տ� ���
					for (String e : cookieval) {
						if (!e.equals(cookieValue.split("#")[0])) {
							cookieValue += e + "#";
						}
					}
					//�ߺ���ǰ üũ �� ��Ű ���� 5���� �����ϱ� ���ؼ� '#'���� �ε����� ����
					cookieval = cookieValue.split("#");
					//���� Ȯ�� �� 5���� ���� �� �缳��
					if (cookieval.length >= 4) {
						addcookieValue = cookieval[0] + "#" + cookieval[1] + "#" + cookieval[2] + "#" + cookieval[3]
								+ "#";
						lateCookie = new Cookie("key", addcookieValue);
						lateCookie.setMaxAge(60 * 60 * 24 * 7);
						response.addCookie(lateCookie);
					} else {
						lateCookie = new Cookie("key", cookieValue);
						lateCookie.setMaxAge(60 * 60 * 24 * 7);
						response.addCookie(lateCookie);
					}
				}
			}
		}
		return "tour/tourdetail";
	}

	// ���ƿ� �� ���ϱ�
	@GetMapping("/tourlikepick")
	public ModelAndView likePick(HttpServletRequest req, int tNo, int val) {
		ModelAndView mav = new ModelAndView();
		// ���ƿ��϶�
		if (val == 1) {
			System.out.println("���ƿ� ���ϴ�~");

			// ����ȣ ��������
			HttpSession session = req.getSession();
			int uno = (int) session.getAttribute("uNo");
			// ����ȣ�� ȣ�� ��ȣ
			TourLikeVO tlikevo = new TourLikeVO();
			tlikevo.settNo(tNo);
			tlikevo.setuNo(uno);

			// ���ƿ� ����
			int cnt = tourspot_Dao.LikeCheck(tlikevo);

			// ���ƿ䰡 �̹� ���������
			if (cnt == 1) {
				System.out.println("�̹� �Ǿ��ֽ��ϴ�.");

				// �̹� ���ִٸ� ajax�� cnt���� ����
				mav.setViewName("house/check");
				mav.addObject("cnt", cnt);

				// ���ƿ䰡 ������ �������
			} else {
				System.out.println("���ƿ���!");

				// ���ƿ� ���
				tourspot_Dao.tourspotLike(tlikevo);

				// cnt�� ������ ���ϱ� ����� �˸�
				mav.setViewName("tour/check");
				mav.addObject("cnt", cnt);
			}

			// ���ϱ��϶�
		} else if (val == 2) {
			System.out.println("���ϱ� ���ϴ�~");

			// �� ��ȣ ��������
			HttpSession session = req.getSession();
			int uno = (int) session.getAttribute("uNo");

			// ����ȣ�� ȣ�� ��ȣ
			TourPickVO tpickvo = new TourPickVO();
			tpickvo.settNo(tNo);
			tpickvo.setuNo(uno);

			// �̹� ���ϱ⸦ �������� üũ
			int cnt = tourspot_Dao.PickCheck(tpickvo);

			if (cnt == 1) {
				// �̹� ���ִٸ� ajax�� cnt���� ����
				mav.setViewName("tour/check");
				mav.addObject("cnt", cnt);
			} else {

				// ���� �ȵ��ִٸ� ���� ��Ű��
				tourspot_Dao.tourspotPick(tpickvo);

				// cnt�� ������ ���ϱ� ����� �˸�
				mav.setViewName("tour/check");
				mav.addObject("cnt", cnt);
			}
		}
		return mav;
	}

	// ������ ���� ���
	@RequestMapping("/treviewInsert")
	public ModelAndView reviewInsert(TourReviewVO trreviewvo) {
		ModelAndView mav = new ModelAndView("redirect:tourdetail?tNo=" + trreviewvo.gettNo());
		tourspot_Dao.TourReview(trreviewvo);
		return mav;
	}

	//������ ���� �Ű�
	@RequestMapping("/treviewshingo")
	public ModelAndView reviewShingo(Model m, int trNo, int uNo) {
		ModelAndView mav = new ModelAndView();

		TrReportVO trreportvo = new TrReportVO();
		trreportvo.setTrNo(trNo);
		trreportvo.setuNo(uNo);

		int cnt = tourspot_Dao.trReportCheck(trreportvo);

		// �Ű����� �ʾҴٸ�
		if (cnt == 0) {
			// �Ű��Ŵ
			tourspot_Dao.trReport(trreportvo);
		}
		mav.setViewName("tour/check");
		mav.addObject("cnt", cnt);

		return mav;
	}

}
