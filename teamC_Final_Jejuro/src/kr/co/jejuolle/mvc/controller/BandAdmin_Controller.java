package kr.co.jejuolle.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BandAdmin_Controller {

	// 숙소 관리자 - 메인
	@RequestMapping("/bandbAdminMain")
	public String bandbAdminMain() {
		return "bandbadmin/bandbAdminMain";
	}

	// 숙소 관리자 - 숙소 등록
	@RequestMapping("/bandbregisterform")
	public String bandbregisterform() {
		return "bandbadmin/bandbregisterform";
	}

	// 숙소 관리자 - 방(룸) 등록
	@RequestMapping("/bandbroomregisterform")
	public String bandbroomregisterform() {
		return "bandbadmin/bandbroomregisterform";
	}

	// 숙소 관리자 - 숙소 관리하기(리스트로 보기)
	@RequestMapping("/bandbreservationList")
	public String bandbreservationList() {
		return "bandbadmin/bandbreservationList";
	}

	// 숙소 관리자 - 등록한 숙소 상세보기
		@RequestMapping("/bandbdetail")
		public String bandbdetail() {
			return "bandbadmin/bandbdetail";
	}

	// 숙소 관리자 - 등록 숙소 현황 보기
	@RequestMapping("/bandbAllList")
	public String test() {
		return "bandbadmin/bandbAllList";
	}

	// 숙소 관리자 - 문의사항
	@RequestMapping("/bandbadminUserQuestion")
	public String bandbadminUserQuestion() {
		return "bandbadmin/bandbadminUserQuestion";
	}
	// 숙소 관리자 - 문의사항 상세 보기
	@RequestMapping("/bandbadminUserQuestionChk")
	public String bandbadminUserQuestionChk() {
		return "bandbadmin/bandbadminUserQuestionChk";
	}
}
