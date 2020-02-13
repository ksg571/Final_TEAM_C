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

	// 관광지페이지
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

	// 관광지 디테일
	@RequestMapping("/tourdetail")
	public String tourdetail(HttpServletRequest request,HttpServletResponse response,
			Model m, int tNo, @RequestParam(defaultValue = "1") int page, String id,TourSpotVO tvo) {
		
		// 상세보기 눌렀을 때 조회수 증가
		tourspot_Dao.tourspotHit(tNo);

		PageVO pageInfo = new PageVO();
		int rowsPerPage = 5; // 한페이지당 보여줄 라인 수
		int pagesPerBlock = 5; // 한페이지당 보여줄 블록 수
		int currentPage = page; // 현재 페이지
		int currentBlock = 0; // 현재 블록수

		if (currentPage % pagesPerBlock == 0) { // 현재 블록에 대한 연산
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

		// 전체 레코드 수
		int totalRows = tourspot_Dao.trListCnt(tNo);

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

		// PageVO에 setter로 값을 주입.
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setCurrentBlock(currentBlock);
		pageInfo.setRowsPerPage(rowsPerPage);
		pageInfo.setPagesPerBlock(pagesPerBlock);
		pageInfo.setStartRow(startRow);
		pageInfo.setEndRow(endRow);
		pageInfo.setTotalRows(totalRows);
		pageInfo.setTotalPages(totalPages);
		pageInfo.setTotalBlocks(totalBlocks);
		// 페이지
		m.addAttribute("pageInfo", pageInfo);

		// 관광지 상세보기
		tvo = tourspot_Dao.tourspotDetail(tNo);
		String info = tvo.gettInfo();
		String array[] = info.split("/");
		for (int i = 0; i < array.length; i++) {
			//System.out.println(array[i]);
		}
		m.addAttribute("tvo", tvo);

		// 관광지 리뷰 리스트
		List<TourReviewVO> trlist = tourspot_Dao.trList(svo);
		m.addAttribute("trlist", trlist);

		m.addAttribute("id", id);
		
		
		//------------------------------------------------------
		//Cookie 굽는곳
		tvo.settNo(tNo);
		Cookie lateCookie;
		String cookieValue;
		String addcookieValue = "";
		//쿠키 값 받아오기
		Cookie[] getCookie = request.getCookies();
		//map 초기화
		Map<String, String> cookiemap = new HashMap<String, String>();
		//map에 쿠키 값 넣기
		for (Cookie cookie : getCookie) {
			cookiemap.put(cookie.getName(), cookie.getValue());
			for (String mapkey : cookiemap.keySet()) {
				//쿠키에 key값이 없을 시 최근 본 상품 key 쿠키 추가
				if (!mapkey.equals("key")) {
					//쿠키에 넣을 값 설정
					cookieValue = tvo.gettNo() + "/" + tvo.gettTopImg() + "#";
					//쿠키 생성 및 값 저장
					lateCookie = new Cookie("key", cookieValue);
					//쿠키 7일 후 자동 삭제
					lateCookie.setMaxAge(60 * 60 * 24 * 7);
					//쿠키 활성화
					response.addCookie(lateCookie);
				//쿠키 key가 있을 시
				} else if (mapkey.equals("key")) {
					//쿠키에서 받은 값을 '#'으로 나눔
					String[] cookieval = cookiemap.get(mapkey).split("#");
					cookieValue = tvo.gettNo() + "/" + tvo.gettTopImg() + "#";
					//중복 상품 체크 및 최근 본 상품 앞에 등록
					for (String e : cookieval) {
						if (!e.equals(cookieValue.split("#")[0])) {
							cookieValue += e + "#";
						}
					}
					//중복상품 체크 후 쿠키 갯수 5개로 제한하기 위해서 '#'으로 인덱스를 나눔
					cookieval = cookieValue.split("#");
					//갯수 확인 후 5개가 넘을 시 재설정
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

	// 좋아요 및 찜하기
	@GetMapping("/tourlikepick")
	public ModelAndView likePick(HttpServletRequest req, int tNo, int val) {
		ModelAndView mav = new ModelAndView();
		// 좋아요일때
		if (val == 1) {
			System.out.println("좋아요 들어갑니다~");

			// 고객번호 가져오기
			HttpSession session = req.getSession();
			int uno = (int) session.getAttribute("uNo");
			// 고객번호와 호텔 번호
			TourLikeVO tlikevo = new TourLikeVO();
			tlikevo.settNo(tNo);
			tlikevo.setuNo(uno);

			// 좋아요 여부
			int cnt = tourspot_Dao.LikeCheck(tlikevo);

			// 좋아요가 이미 되있을경우
			if (cnt == 1) {
				System.out.println("이미 되어있습니다.");

				// 이미 되있다면 ajax로 cnt값을 보냄
				mav.setViewName("house/check");
				mav.addObject("cnt", cnt);

				// 좋아요가 되있지 않은경우
			} else {
				System.out.println("좋아요등록!");

				// 좋아요 등록
				tourspot_Dao.tourspotLike(tlikevo);

				// cnt를 보내어 찜하기 등록을 알림
				mav.setViewName("tour/check");
				mav.addObject("cnt", cnt);
			}

			// 찜하기일때
		} else if (val == 2) {
			System.out.println("찜하기 들어갑니다~");

			// 고객 번호 가져오기
			HttpSession session = req.getSession();
			int uno = (int) session.getAttribute("uNo");

			// 고객번호와 호텔 번호
			TourPickVO tpickvo = new TourPickVO();
			tpickvo.settNo(tNo);
			tpickvo.setuNo(uno);

			// 이미 찜하기를 눌렀는지 체크
			int cnt = tourspot_Dao.PickCheck(tpickvo);

			if (cnt == 1) {
				// 이미 되있다면 ajax로 cnt값을 보냄
				mav.setViewName("tour/check");
				mav.addObject("cnt", cnt);
			} else {

				// 찜이 안되있다면 찜을 시키고
				tourspot_Dao.tourspotPick(tpickvo);

				// cnt를 보내어 찜하기 등록을 알림
				mav.setViewName("tour/check");
				mav.addObject("cnt", cnt);
			}
		}
		return mav;
	}

	// 관광지 리뷰 등록
	@RequestMapping("/treviewInsert")
	public ModelAndView reviewInsert(TourReviewVO trreviewvo) {
		ModelAndView mav = new ModelAndView("redirect:tourdetail?tNo=" + trreviewvo.gettNo());
		tourspot_Dao.TourReview(trreviewvo);
		return mav;
	}

	//관광지 리뷰 신고
	@RequestMapping("/treviewshingo")
	public ModelAndView reviewShingo(Model m, int trNo, int uNo) {
		ModelAndView mav = new ModelAndView();

		TrReportVO trreportvo = new TrReportVO();
		trreportvo.setTrNo(trNo);
		trreportvo.setuNo(uNo);

		int cnt = tourspot_Dao.trReportCheck(trreportvo);

		// 신고하지 않았다면
		if (cnt == 0) {
			// 신고시킴
			tourspot_Dao.trReport(trreportvo);
		}
		mav.setViewName("tour/check");
		mav.addObject("cnt", cnt);

		return mav;
	}

}
