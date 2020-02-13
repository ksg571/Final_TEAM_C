package kr.co.jejuolle.mvc.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jejuolle.mvc.vo.HouseLikeVO;
import kr.co.jejuolle.mvc.vo.HousePickVO;
import kr.co.jejuolle.mvc.vo.HouseReviewVO;
import kr.co.jejuolle.mvc.vo.HouseVO;
import kr.co.jejuolle.mvc.vo.HrReportVO;
import kr.co.jejuolle.mvc.vo.ReservationVO;
import kr.co.jejuolle.mvc.vo.RoomVO;
import kr.co.jejuolle.mvc.vo.SearchVO;

@Repository
public class House_Dao implements House_Inter {

	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public List<HouseVO> houselise() {
		return ss.selectList("house.houselist");
	}

	@Override
	public List<RoomVO> room(int hNo) {
		return ss.selectList("house.room", hNo);
	}

	@Override
	public RoomVO roomDetail(int rNo) {
		return ss.selectOne("house.roomDetail", rNo);
	}

	@Override
	public void res_room(ReservationVO vo) {
		ss.insert("house.res_room", vo);
	}

	// 호텔 상세보기
	@Override
	public HouseVO houseDetail(int hNo) {
		return ss.selectOne("house.houseDetail", hNo);
	}

	// 호텔 좋아요
	@Override
	public void houseLike(HouseLikeVO hlikevo) {
		ss.insert("house.houseLike", hlikevo);
	}

	// 호텔 좋아요 체크
	@Override
	public int LikeCheck(HouseLikeVO hlikevo) {
		return ss.selectOne("house.likecheck", hlikevo);
	}

	// 호텔 찜하기
	@Override
	public void housePick(HousePickVO hpickvo) {
		ss.insert("house.housepick", hpickvo);
	}

	// 호텔 찜하기 체크
	@Override
	public int PickCheck(HousePickVO hpickvo) {
		return ss.selectOne("house.pickcheck", hpickvo);
	}

	//조회수 증가
	@Override
	public void houseHit(int hNo) {
		ss.update("house.houseHit", hNo);
	}

	// 호텔 리뷰
	@Override
	public void houseReview(HouseReviewVO hreviewvo) {
		ss.insert("house.hreviewInsert", hreviewvo);
	}

	//호텔 리뷰 총 개수
	@Override
	public int hrListCnt(int hNo) {
		return ss.selectOne("house.hrTotal", hNo);
	}

	// 호텔 리뷰 리스트
	@Override
	public List<HouseReviewVO> hrList(SearchVO svo) {
		return ss.selectList("house.hreviewList", svo);
	}

	// 호텔 리뷰 신고
	@Override
	public void hrReport(HrReportVO hrreportvo) {
		ss.insert("house.hrReport", hrreportvo);
	}

	// 호텔 리뷰 신고 여부
	@Override
	public int hrReportCheck(HrReportVO hrreportvo) {
		return ss.selectOne("house.hrReportCheck", hrreportvo);
	}

}
