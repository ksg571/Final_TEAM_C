package kr.co.jejuolle.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jejuolle.mvc.dao.Users_Inter;
import kr.co.jejuolle.mvc.vo.UsersVO;
@Controller
public class Login_Controller {

	@Autowired
	private Users_Inter user_inter;

	// 로그인 페이지
	@GetMapping("/loginForm")
	public String loginForm() {
		System.out.println("----------");
		System.out.println("로그인페이지이동");
		return "header/login";
	}
	//로그인
	@PostMapping("/login")
	public ModelAndView loginf(HttpSession session, HttpServletRequest req, UsersVO vo, @RequestHeader("User-Agent") String userAgent) {
		System.out.println("----------");
		System.out.println("로그인");
		UsersVO map = user_inter.login(vo);
		ModelAndView mav = new ModelAndView();
		if(map == null) {
			mav.setViewName("etc/404");
		}else {
			session.setAttribute("uuId", vo.getUuId());
			session.setAttribute("uName", map.getuName());
			session.setAttribute("uNo", map.getuNo());
			session.setAttribute("uEmail", map.getuEmail());

			System.out.println(session.getAttribute("uuId"));
			System.out.println(session.getAttribute("uName"));
			System.out.println(session.getAttribute("uNo"));
			System.out.println(session.getAttribute("uEmail"));
			System.out.println("------");
			String uid = (String) session.getAttribute("uuId");
			if(uid.equals("admin")) {
				mav.setViewName("admin/adminMain");
			}else {
				mav.setViewName("redirect:/home");
			}
		}
		return mav;
	}
	//로그아웃
	@GetMapping("/logout")
	public ModelAndView loginfout(HttpSession session, HttpServletRequest req) {
		System.out.println("----------");
		System.out.println("로그아웃");
		session.removeAttribute("uuId");
		session.removeAttribute("uName");//로그인한 사용자의 세션 삭제
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/home");
		return mav;
	}
}
