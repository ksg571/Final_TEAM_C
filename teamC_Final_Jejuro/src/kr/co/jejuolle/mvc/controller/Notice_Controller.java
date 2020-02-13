package kr.co.jejuolle.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Notice_Controller {
	// 공지사항페이지
	@RequestMapping("/notice")
	public String notice() {
		return "notice/notice";
	}

	// 문의사항
	@RequestMapping("/contact")
	public String contact() {
		return "notice/contact";
	}

	// 자주묻는질문
	@RequestMapping("/faq")
	public String faq() {
		return "notice/faq";
	}

}
