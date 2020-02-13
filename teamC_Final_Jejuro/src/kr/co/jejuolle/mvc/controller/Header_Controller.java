package kr.co.jejuolle.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class Header_Controller {





	// 검색창
	@RequestMapping("/search")
	public String search() {
		return "header/search";
	}
	//검색
	@RequestMapping("/lang")
	public String lang() {
		return "header/lang";
	}
}
