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

	// ����
	@RequestMapping("/house")
	public ModelAndView house() {
		List<HouseVO> list = house_Dao.houselise();
		System.out.println(list);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("house/house");
		mav.addObject("list", list);
		return mav;
	}

	// ���� ������
	@RequestMapping("/housedetail")
	public String housedetail(Model m, int hNo, @RequestParam(defaultValue = "1") int page, String id) {
		//�󼼺��⸦ ������ ��ȸ�� ����
		house_Dao.houseHit(hNo);

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
		svo.setNo(hNo);

		// ��ü ���ڵ� ��
		int totalRows = house_Dao.hrListCnt(hNo);

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
		//������
		m.addAttribute("pageInfo", pageInfo);

		// ȣ�� ����
		HouseVO hvo = house_Dao.houseDetail(hNo);
		m.addAttribute("hvo", hvo);

		List<RoomVO> rlist = house_Dao.room(hNo);
		m.addAttribute("rlist", rlist);

		//ȣ�� ���� ����Ʈ
		List<HouseReviewVO> hrlist = house_Dao.hrList(svo);
		m.addAttribute("hrlist", hrlist);

		m.addAttribute("id", id);
		System.out.println(id);
		return "house/housedetail";
	}

	//AJAX_��������
	@RequestMapping("/roomdetail")
	@ResponseBody
	public RoomVO roomdetail(int rNo) {
		System.out.println("----------");
		System.out.println("��������");
		System.out.println("rNo:" + rNo);
		RoomVO list = house_Dao.roomDetail(rNo);
		System.out.println("list :" + list);
		return list;
	}

	//���ҿ����ϱ�
	@RequestMapping("/res_room")
	public String res_room(ReservationVO vo, HttpSession session, Model m) throws ParseException {
		System.out.println("----------");
		System.out.println("�����ϱ�");
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

	//�������
	@RequestMapping("/del_res")
	public String del_res(int rvNo) {
		System.out.println("----------");
		System.out.println("�������");
		reservation_Imple.del_res(rvNo);
		return "redirect:/home";
	}

	//����
	@RequestMapping("/add_pay")
	public String add_pay(PaymentVO vo) {
		System.out.println("----------");
		System.out.println("�����Ϸ�");
		reservation_Imple.add_pay(vo);
		return "main/main";
	}

	// ���ƿ� �� ���ϱ�
	@GetMapping("/houselikepick")
	public ModelAndView likePick(HttpServletRequest req, int hNo, int val) {
		ModelAndView mav = new ModelAndView();
		//���ƿ��϶�
		if (val == 1) {
			System.out.println("���ƿ� ���ϴ�~");

			//����ȣ ��������
			HttpSession session = req.getSession();
			int uno = (int) session.getAttribute("uNo");
			// ����ȣ�� ȣ�� ��ȣ
			HouseLikeVO hlikevo = new HouseLikeVO();
			hlikevo.sethNo(hNo);
			hlikevo.setuNo(uno);

			//���ƿ� ����
			int cnt = house_Dao.LikeCheck(hlikevo);

			//���ƿ䰡 �̹� ���������
			if (cnt == 1) {
				System.out.println("�̹� �Ǿ��ֽ��ϴ�.");

				//�̹� ���ִٸ� ajax�� cnt���� ����
				mav.setViewName("house/check");
				mav.addObject("cnt", cnt);

				//���ƿ䰡 ������ �������
			} else {
				System.out.println("���ƿ���!");

				//���ƿ� ���
				house_Dao.houseLike(hlikevo);

				//cnt�� ������ ���ϱ� ����� �˸�
				mav.setViewName("house/check");
				mav.addObject("cnt", cnt);
			}

			//���ϱ��϶�
		} else if (val == 2) {
			System.out.println("���ϱ� ���ϴ�~");

			// �� ��ȣ ��������
			HttpSession session = req.getSession();
			int uno = (int) session.getAttribute("uNo");

			// ����ȣ�� ȣ�� ��ȣ
			HousePickVO hpickvo = new HousePickVO();
			hpickvo.sethNo(hNo);
			hpickvo.setuNo(uno);

			// �̹� ���ϱ⸦ �������� üũ
			int cnt = house_Dao.PickCheck(hpickvo);

			if (cnt == 1) {
				//�̹� ���ִٸ� ajax�� cnt���� ����
				mav.setViewName("house/check");
				mav.addObject("cnt", cnt);
			} else {

				//���� �ȵ��ִٸ� ���� ��Ű�� 
				house_Dao.housePick(hpickvo);

				//cnt�� ������ ���ϱ� ����� �˸�
				mav.setViewName("house/check");
				mav.addObject("cnt", cnt);
			}
		}
		return mav;
	}

	//ȣ�� ���� ���
	@RequestMapping("/reviewInsert")
	public ModelAndView reviewInsert(HouseReviewVO hreviewvo) {
		ModelAndView mav = new ModelAndView("redirect:housedetail?hNo=" + hreviewvo.gethNo());
		house_Dao.houseReview(hreviewvo);
		return mav;
	}

	//ȣ�� ���� �Ű�
	@RequestMapping("/reviewshingo")
	public ModelAndView reviewShingo(Model m, int hrNo, int uNo) {
		ModelAndView mav = new ModelAndView();

		HrReportVO hrreportvo = new HrReportVO();
		hrreportvo.setHrNo(hrNo);
		hrreportvo.setuNo(uNo);

		int cnt = house_Dao.hrReportCheck(hrreportvo);

		//�Ű����� �ʾҴٸ�
		if (cnt == 0) {
			//�Ű��Ŵ
			house_Dao.hrReport(hrreportvo);
		}
		mav.setViewName("house/check");
		mav.addObject("cnt", cnt);

		return mav;
	}

}
