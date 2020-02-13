package kr.co.jejuolle.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jejuolle.mvc.dao.Default_Dao;
import kr.co.jejuolle.mvc.dao.VisitCountDAO;
import kr.co.jejuolle.mvc.vo.TourSpotVO;
import kr.co.jejuolle.mvc.vo.VisitCountVO;

@Controller
public class Default_Controller {

	@Autowired
	private Default_Dao dao;
	@Autowired
	private VisitCountDAO visitCountDAO;

	// ����
	@RequestMapping({ "/", "/home" })
	public String main(Model m, HttpSession session, VisitCountVO vo, HttpServletRequest req) {
		//�������οö� �湮�ڼ� +1
		vo.setVisit_ip(req.getRemoteAddr());
		vo.setVisit_agent(req.getHeader("User-Agent"));
		visitCountDAO.insertVisitor(vo);
		
		List<TourSpotVO> list = dao.tourHitList();
		m.addAttribute("tTop", list);
		session.setAttribute("img", list);
		return "main/main";
	}
	//�湮�ڼ� ȣ�� ajax
	@RequestMapping("/visitcount")
	@ResponseBody
	public int visitcount() {
		int count = visitCountDAO.visitecount();
		return count;
	}
}
