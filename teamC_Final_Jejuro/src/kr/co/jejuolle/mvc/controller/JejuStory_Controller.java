package kr.co.jejuolle.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JejuStory_Controller {
	// 제주이야기
	@RequestMapping("/jejustory")
	public String jejustory() {
		return "jejustory/jejustory";
	}

	// 블로그
	@RequestMapping("/blog")
	public String blog() {
		return "jejustory/blog";
	}

	// 기타등등
	@RequestMapping("/etc")
	public String etc() {
		return "jejustory/etc";
	}
}
