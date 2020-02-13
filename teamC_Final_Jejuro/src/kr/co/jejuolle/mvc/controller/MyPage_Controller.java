package kr.co.jejuolle.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPage_Controller {
	// ¸¶ÀÌÆäÀÌÁö
	@RequestMapping("/mypage")
	public String mypage() {
		return "mypage/mypage";
	}

	// pick °ü±¤Áö
	@RequestMapping("/pickTourspot")
	public String pickTourspot() {
		return "mypage/pickTourspot";
	}

	// pick ¼÷¼Ò
	@RequestMapping("/pickhouse")
	public String pickhouse() {
		return "mypage/pickHouse";
	}

	// ³ªÀÇ¸®ºä
	@RequestMapping("/myreview")
	public String myreview() {
		return "mypage/myReview";
	}

	// ¼öÁ¤ÇÏ±â
	@RequestMapping("/infoModify")
	public String infoModify() {
		return "mypage/infoModify";
	}
	// È¸¿øÅ»Åð
	@RequestMapping("/user_delete")
	public String userDelete() {
		return "mypage/userDelete";
	}

}
