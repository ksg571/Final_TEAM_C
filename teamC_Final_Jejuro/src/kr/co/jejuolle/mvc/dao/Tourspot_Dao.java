package kr.co.jejuolle.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jejuolle.mvc.vo.SearchVO;
import kr.co.jejuolle.mvc.vo.TourLikeVO;
import kr.co.jejuolle.mvc.vo.TourPickVO;
import kr.co.jejuolle.mvc.vo.TourReviewVO;
import kr.co.jejuolle.mvc.vo.TourSpotVO;
import kr.co.jejuolle.mvc.vo.TrReportVO;

@Repository
public class Tourspot_Dao implements Tourspot_Inter {

	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public List<TourSpotVO> tourspotlist() {
		return ss.selectList("tourspot.tourspotlist");
	}

	// °ü±¤Áö »ó¼¼º¸±â
	@Override
	public TourSpotVO tourspotDetail(int tNo) {
		return ss.selectOne("tourspot.tourspotDetail", tNo);
	}

	// °ü±¤Áö ÁÁ¾Æ¿ä
	@Override
	public void tourspotLike(TourLikeVO tlikevo) {
		ss.insert("tourspot.tourspotLike", tlikevo);
	}

	// °ü±¤Áö ÁÁ¾Æ¿ä Ã¼Å©
	@Override
	public int LikeCheck(TourLikeVO tlikevo) {
		return ss.selectOne("tourspot.likecheck", tlikevo);
	}

	// °ü±¤Áö ÂòÇÏ±â
	@Override
	public void tourspotPick(TourPickVO tpickvo) {
		ss.insert("tourspot.tourspotpick", tpickvo);
	}

	// °ü±¤Áö ÂòÇÏ±â Ã¼Å©
	@Override
	public int PickCheck(TourPickVO tpickvo) {
		return ss.selectOne("tourspot.pickcheck", tpickvo);
	}

	//°ü±¤Áö Á¶È¸¼ö Áõ°¡
	@Override
	public void tourspotHit(int tNo) {
		ss.update("tourspot.tourHit", tNo);
	}

	//°ü±¤Áö ¸®ºä µî·Ï
	@Override
	public void TourReview(TourReviewVO treviewvo) {
		ss.insert("tourspot.trreviewInsert", treviewvo);
	}

	//°ü±¤Áö ¸®ºä ¸®½ºÆ®
	@Override
	public List<TourReviewVO> trList(SearchVO svo) {
		return ss.selectList("tourspot.treviewList", svo);
	}

	//°ü±¤Áö ¸®ºä ÃÑ °³¼ö
	@Override
	public int trListCnt(int tNo) {
		return ss.selectOne("tourspot.trTotal", tNo);
	}

	//°ü±¤Áö ¸®ºä ½Å°í
	@Override
	public void trReport(TrReportVO trreportvo) {
		ss.insert("tourspot.trReport", trreportvo);
	}

	//°ü±¤Áö ¸®ºä ½Å°í ¿©ºÎ
	@Override
	public int trReportCheck(TrReportVO trreportvo) {
		return ss.selectOne("tourspot.trReportCheck", trreportvo);
	}

}
