package kr.co.jejuolle.mvc.dao;

import java.util.List;

import kr.co.jejuolle.mvc.vo.HouseLikeVO;
import kr.co.jejuolle.mvc.vo.HousePickVO;
import kr.co.jejuolle.mvc.vo.HouseReviewVO;
import kr.co.jejuolle.mvc.vo.HouseVO;
import kr.co.jejuolle.mvc.vo.HrReportVO;
import kr.co.jejuolle.mvc.vo.ReservationVO;
import kr.co.jejuolle.mvc.vo.RoomVO;
import kr.co.jejuolle.mvc.vo.SearchVO;

public interface House_Inter {
	public List<HouseVO> houselise();
	public List<RoomVO> room(int hNo);
	public RoomVO roomDetail(int rNo);
	public void res_room(ReservationVO vo);
	public HouseVO houseDetail(int hNo);
	public void houseLike(HouseLikeVO hlikevo);
	public int LikeCheck(HouseLikeVO hlikevo);
	public void housePick(HousePickVO hpickvo);
	public int PickCheck(HousePickVO hpickvo);
	public void houseHit(int hNo);
	public void houseReview(HouseReviewVO hreviewvo); //ȣ�� ���� ���
	public List<HouseReviewVO> hrList(SearchVO svo); //ȣ�� ���� ����Ʈ
	public int hrListCnt(int hNo); //ȣ�� ���� �� ����
	public void hrReport(HrReportVO hrreportvo);
	public int hrReportCheck(HrReportVO hrreportvo);

}
