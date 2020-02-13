package kr.co.jejuolle.mvc.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jejuolle.mvc.dao.House_Dao;
import kr.co.jejuolle.mvc.dao.Reservation_Dao;
import kr.co.jejuolle.mvc.vo.HouseLikeVO;
import kr.co.jejuolle.mvc.vo.HousePickVO;
import kr.co.jejuolle.mvc.vo.HouseReviewVO;
import kr.co.jejuolle.mvc.vo.HouseVO;
import kr.co.jejuolle.mvc.vo.HrReportVO;
import kr.co.jejuolle.mvc.vo.PageVO;
import kr.co.jejuolle.mvc.vo.PaymentVO;
import kr.co.jejuolle.mvc.vo.ReservationVO;
import kr.co.jejuolle.mvc.vo.RoomVO;
import kr.co.jejuolle.mvc.vo.SearchVO;

@Controller
public class House_Controller {
	@Autowired
	private House_Dao house_Dao;

	@Autowired
	private Reservation_Dao reservation_Imple;

	// 숙박
	@RequestMapping("/house")
	public ModelAndView house() {
		List<HouseVO> list = house_Dao.houselise();
		System.out.println(list);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("house/house");
		mav.addObject("list", list);
		return mav;
	}

	// 숙박 디테일
	@RequestMapping("/housedetail")
	public String housedetail(Model m, int hNo, @RequestParam(defaultValue = "1") int page, String id) {
		//상세보기를 누르면 조회수 증가
		house_Dao.houseHit(hNo);

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
		svo.setNo(hNo);

		// 전체 레코드 수
		int totalRows = house_Dao.hrListCnt(hNo);

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
		//페이지
		m.addAttribute("pageInfo", pageInfo);

		// 호텔 정보
		HouseVO hvo = house_Dao.houseDetail(hNo);
		m.addAttribute("hvo", hvo);

		List<RoomVO> rlist = house_Dao.room(hNo);
		m.addAttribute("rlist", rlist);

		//호텔 리뷰 리스트
		List<HouseReviewVO> hrlist = house_Dao.hrList(svo);
		m.addAttribute("hrlist", hrlist);

		m.addAttribute("id", id);
		System.out.println(id);
		return "house/housedetail";
	}

	//AJAX_숙소정보
	@RequestMapping("/roomdetail")
	@ResponseBody
	public RoomVO roomdetail(int rNo) {
		System.out.println("----------");
		System.out.println("숙소정보");
		System.out.println("rNo:" + rNo);
		RoomVO list = house_Dao.roomDetail(rNo);
		System.out.println("list :" + list);
		return list;
	}

	//숙소예약하기
	@RequestMapping("/res_room")
	public String res_room(ReservationVO vo, HttpSession session, Model m) throws ParseException {
		System.out.println("----------");
		System.out.println("예약하기");
		System.out.println("rno:" + vo.getrNo());
		int uNo = (int) session.getAttribute("uNo");
		vo.setuNo(uNo);
		house_Dao.res_room(vo);

		String date1 = vo.getStartDate();
		String date2 = vo.getEndDate();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		Date StartDate = format.parse(date1);
		Date EndDate = format.parse(date2);
		long calDate = StartDate.getTime() - EndDate.getTime();
		long day = calDate / (24 * 60 * 60 * 1000);
		day = Math.abs(day) + 1;
		System.out.println("day" + day);

		int rvNo = vo.getRvNo();
		System.out.println("rvNo??" + rvNo);
		HouseVO list = reservation_Imple.list_res(rvNo);

		int price = list.getrPrice(); //null
		int want = (int) (day * price);

		session.setAttribute("day", day);
		session.setAttribute("want", want);

		m.addAttribute("rlist", list);
		return "house/checkout";
	}

	//예약취소
	@RequestMapping("/del_res")
	public String del_res(int rvNo) {
		System.out.println("----------");
		System.out.println("예약취소");
		reservation_Imple.del_res(rvNo);
		return "redirect:/home";
	}

	//결제
	@RequestMapping("/add_pay")
	public String add_pay(PaymentVO vo) {
		System.out.println("----------");
		System.out.println("결제완료");
		reservation_Imple.add_pay(vo);
		return "main/main";
	}

	// 좋아요 및 찜하기
	@GetMapping("/houselikepick")
	public ModelAndView likePick(HttpServletRequest req, int hNo, int val) {
		ModelAndView mav = new ModelAndView();
		//좋아요일때
		if (val == 1) {
			System.out.println("좋아요 들어갑니다~");

			//고객번호 가져오기
			HttpSession session = req.getSession();
			int uno = (int) session.getAttribute("uNo");
			// 고객번호와 호텔 번호
			HouseLikeVO hlikevo = new HouseLikeVO();
			hlikevo.sethNo(hNo);
			hlikevo.setuNo(uno);

			//좋아요 여부
			int cnt = house_Dao.LikeCheck(hlikevo);

			//좋아요가 이미 되있을경우
			if (cnt == 1) {
				System.out.println("이미 되어있습니다.");

				//이미 되있다면 ajax로 cnt값을 보냄
				mav.setViewName("house/check");
				mav.addObject("cnt", cnt);

				//좋아요가 되있지 않은경우
			} else {
				System.out.println("좋아요등록!");

				//좋아요 등록
				house_Dao.houseLike(hlikevo);

				//cnt를 보내어 찜하기 등록을 알림
				mav.setViewName("house/check");
				mav.addObject("cnt", cnt);
			}

			//찜하기일때
		} else if (val == 2) {
			System.out.println("찜하기 들어갑니다~");

			// 고객 번호 가져오기
			HttpSession session = req.getSession();
			int uno = (int) session.getAttribute("uNo");

			// 고객번호와 호텔 번호
			HousePickVO hpickvo = new HousePickVO();
			hpickvo.sethNo(hNo);
			hpickvo.setuNo(uno);

			// 이미 찜하기를 눌렀는지 체크
			int cnt = house_Dao.PickCheck(hpickvo);

			if (cnt == 1) {
				//이미 되있다면 ajax로 cnt값을 보냄
				mav.setViewName("house/check");
				mav.addObject("cnt", cnt);
			} else {

				//찜이 안되있다면 찜을 시키고 
				house_Dao.housePick(hpickvo);

				//cnt를 보내어 찜하기 등록을 알림
				mav.setViewName("house/check");
				mav.addObject("cnt", cnt);
			}
		}
		return mav;
	}

	//호텔 리뷰 등록
	@RequestMapping("/reviewInsert")
	public ModelAndView reviewInsert(HouseReviewVO hreviewvo) {
		ModelAndView mav = new ModelAndView("redirect:housedetail?hNo=" + hreviewvo.gethNo());
		house_Dao.houseReview(hreviewvo);
		return mav;
	}

	//호텔 리뷰 신고
	@RequestMapping("/reviewshingo")
	public ModelAndView reviewShingo(Model m, int hrNo, int uNo) {
		ModelAndView mav = new ModelAndView();

		HrReportVO hrreportvo = new HrReportVO();
		hrreportvo.setHrNo(hrNo);
		hrreportvo.setuNo(uNo);

		int cnt = house_Dao.hrReportCheck(hrreportvo);

		//신고하지 않았다면
		if (cnt == 0) {
			//신고시킴
			house_Dao.hrReport(hrreportvo);
		}
		mav.setViewName("house/check");
		mav.addObject("cnt", cnt);

		return mav;
	}

}
