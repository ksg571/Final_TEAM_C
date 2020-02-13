package kr.co.jejuolle.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class Etc_Controller {
	// 팀원소개
	@RequestMapping("/testimonials")
	public String testimonials() {
		return "etc/teamc";
	}

	// 404페이지
	@RequestMapping("/404")
	public String error() {
		return "etc/404";
	}
}
