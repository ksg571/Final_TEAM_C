package kr.co.jejuolle.mvc.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jejuolle.mvc.dao.MyPlan_Inter;
import kr.co.jejuolle.mvc.vo.HouseVO;
import kr.co.jejuolle.mvc.vo.MyplanVO;
import kr.co.jejuolle.mvc.vo.PlanMoneyVO;
import kr.co.jejuolle.mvc.vo.TourSpotVO;

@Controller
public class MyPlan_Controller {

	@Autowired
	private MyPlan_Inter myPlan_Inter;

	@RequestMapping("/add_plan")
	public String addPlan(MyplanVO vo, HttpSession session) throws ParseException {
		int uno = (int) session.getAttribute("uNo");
		vo.setuNo(uno);

		myPlan_Inter.add_myPlan(vo);
		
		String date1 = vo.getStartDate();
		String date2 = vo.getEndDate();

		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		// date1, date2 두 날짜를 parse()를 통해 Date형으로 변환.
		Date StartDate = format.parse(date1);
		Date EndDate = format.parse(date2);

		// Date로 변환된 두 날짜를 계산한 뒤 그 리턴값으로 long type 변수를 초기화 하고 있다.
		// 연산결과 -950400000. long type 으로 return 된다.
		long calDate = StartDate.getTime() - EndDate.getTime();

		// Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환해준다.
		// 이제 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나온다.
		long day = calDate / (24 * 60 * 60 * 1000);

		day = Math.abs(day) + 1;

		return "redirect:list_plan?num=" + day;
	}

	@RequestMapping("/list_plan")
	public String listPlan(Model m, HttpSession session) {
		
		int uNo = (int) session.getAttribute("uNo");
		System.out.println(uNo);

		MyplanVO vo = myPlan_Inter.view_myPlan(uNo);
		session.setAttribute("mNo", vo.getmNo());
		System.out.println("what : "+session.getAttribute("mNo"));
		m.addAttribute("plist", vo);

		List<HouseVO> list = myPlan_Inter.house_pick(uNo);
		m.addAttribute("hplist", list);

		List<TourSpotVO> list2 = myPlan_Inter.tour_pick(uNo);
		m.addAttribute("tplist", list2);
		
		List<HouseVO> list3 = myPlan_Inter.house_res(uNo);
		m.addAttribute("rlist", list3);

		return "mypage/plan";
	}
	@RequestMapping("/add_money")
	public String add_money(PlanMoneyVO vo, HttpSession session) {
		int mNo = (int) session.getAttribute("mNo");
		System.out.println("mNo :"+mNo);
		vo.setmNo(mNo);
		myPlan_Inter.add_planMoney(vo);
		return "mypage/plan";
	}
}
