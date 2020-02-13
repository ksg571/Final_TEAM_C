package kr.co.jejuolle.mvc.dao;

import java.util.List;

import kr.co.jejuolle.mvc.vo.SearchVO;
import kr.co.jejuolle.mvc.vo.TourLikeVO;
import kr.co.jejuolle.mvc.vo.TourPickVO;
import kr.co.jejuolle.mvc.vo.TourReviewVO;
import kr.co.jejuolle.mvc.vo.TourSpotVO;
import kr.co.jejuolle.mvc.vo.TrReportVO;

public interface Tourspot_Inter {
	public List<TourSpotVO> tourspotlist();

	// 관광지 상세보기
	public TourSpotVO tourspotDetail(int tNo);

	// 관광지 좋아요
	public void tourspotLike(TourLikeVO tlikevo);

	// 관광지 좋아요 체크
	public int LikeCheck(TourLikeVO tlikevo);

	// 관광지 찜하기
	public void tourspotPick(TourPickVO tpickvo);

	// 관광지 찜하기 체크
	public int PickCheck(TourPickVO tpickvo);

	//관광지 조회수 증가
	public void tourspotHit(int tNo);
	//호텔 리뷰 등록
	public void TourReview(TourReviewVO treviewvo);
	
	//호텔 리뷰 리스트
	public List<TourReviewVO> trList(SearchVO svo);
	
	//호텔 리뷰 총 개수
	public int trListCnt(int tNo);
	
	//호텔리뷰신고
	public void trReport(TrReportVO trreportvo);
	//호텔리뷰신고 여부
	public int trReportCheck(TrReportVO trreportvo);

}
