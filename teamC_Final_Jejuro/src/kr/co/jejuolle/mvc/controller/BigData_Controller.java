package kr.co.jejuolle.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BigData_Controller {
	// ºòµ¥ÀÌÅÍ - Â÷Æ®
	@RequestMapping("/chart")
	public String chart() {
		return "bigdata/chart";
	}

	// ºòµ¥ÀÌÅÍ - ³¯¾¾
	@RequestMapping("/weather")
	public String weather() {
		return "bigdata/weather";
	}

	// ºòµ¥ÀÌÅÍ -
	@RequestMapping("/bigdata")
	public String bigdata() {
		return "bigdata/bigdata";
	}

}
