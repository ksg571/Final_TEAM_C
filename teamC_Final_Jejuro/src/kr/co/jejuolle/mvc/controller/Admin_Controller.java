package kr.co.jejuolle.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Admin_Controller {

	// 관리자메인/초기화면
	@RequestMapping("/adminMain")
	public String adminMain() {
		return "admin/adminMain";
	}
	// 관리자 공지사항 리스트
	@RequestMapping("/adminNoticeList")
	public String adminNoticeList() {
		return "admin/adminNoticeList";
	}
	// 관리자 관광지 리스트
	@RequestMapping("/adminTouristSpot")
	public String adminTouristSpot() {
		return "admin/adminTouristSpot";
	}
	// 관리자 리뷰신고 리스트 확인
	@RequestMapping("/adminReviewReport")
	public String adminReviewReport() {
		return "admin/adminReviewReport";
	}
	// 관리자 유저 정보 확인 리스트
	@RequestMapping("/adminUserInfo")
	public String adminUserInfo() {
		return "admin/adminUserInfo";
	}

	// 관리자 유저문의사항 리스트 확인
	@RequestMapping("/adminUserQuestion")
	public String adminUserQuestion() {
		return "admin/adminUserQuestion";
	}
	// 관리자 유저문의사항 리스트에서 상세보기
	@RequestMapping("/adminUserQuestionChk")
	public String adminUserQuestionChk() {
		return "admin/adminUserQuestionChk";
	}
	// 관리자 관광지등록
	@RequestMapping("/adminTouristSpotWrite")
	public String adminTouristSpotWrite() {
		return "admin/adminTouristSpotWrite";
	}
    // 관리자 공지사항 등록
	@RequestMapping("/adminNoticeWrite")
	public String adminNoticeWrite() {
		return "admin/adminNoticeWrite";
	}
	// 관리자 공지사항 상세보기
	@RequestMapping("/adminNoticeInfo")
	public String adminNoticeInfo() {
		return "admin/adminNoticeInfo";
	}
	// 관리자 공지사항 수정
	@RequestMapping("/adminNoticeModify")
	public String adminNoticeModify() {
		return "admin/adminNoticeModify";
	}
	// 관리자 숙박관리자가 담당하고있는 숙박업소들의 리스트확인
	@RequestMapping("/adminManagerHotelList")
	public String adminManagerHotelList() {
		return "admin/adminManagerHotelList";
	}
	// 관리자 숙박업소 리스트보기
	@RequestMapping("/adminHotelList")
	public String adminHotelList() {
		return "admin/adminHotelList";
	}
	// 관리자 숙박업소 관리자 리스트
	@RequestMapping("/adminManagerList")
	public String adminManagerList() {
		return "admin/adminManagerList";
	}
	// 관리자 리뷰신고한 유저들의 리스트
	@RequestMapping("/adminReportUserList")
	public String adminReportUserList() {
		return "admin/adminReportUserList";
	}
}
