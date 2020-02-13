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

	// ȣ�� �󼼺���
	@Override
	public HouseVO houseDetail(int hNo) {
		return ss.selectOne("house.houseDetail", hNo);
	}

	// ȣ�� ���ƿ�
	@Override
	public void houseLike(HouseLikeVO hlikevo) {
		ss.insert("house.houseLike", hlikevo);
	}

	// ȣ�� ���ƿ� üũ
	@Override
	public int LikeCheck(HouseLikeVO hlikevo) {
		return ss.selectOne("house.likecheck", hlikevo);
	}

	// ȣ�� ���ϱ�
	@Override
	public void housePick(HousePickVO hpickvo) {
		ss.insert("house.housepick", hpickvo);
	}

	// ȣ�� ���ϱ� üũ
	@Override
	public int PickCheck(HousePickVO hpickvo) {
		return ss.selectOne("house.pickcheck", hpickvo);
	}

	//��ȸ�� ����
	@Override
	public void houseHit(int hNo) {
		ss.update("house.houseHit", hNo);
	}

	// ȣ�� ����
	@Override
	public void houseReview(HouseReviewVO hreviewvo) {
		ss.insert("house.hreviewInsert", hreviewvo);
	}

	//ȣ�� ���� �� ����
	@Override
	public int hrListCnt(int hNo) {
		return ss.selectOne("house.hrTotal", hNo);
	}

	// ȣ�� ���� ����Ʈ
	@Override
	public List<HouseReviewVO> hrList(SearchVO svo) {
		return ss.selectList("house.hreviewList", svo);
	}

	// ȣ�� ���� �Ű�
	@Override
	public void hrReport(HrReportVO hrreportvo) {
		ss.insert("house.hrReport", hrreportvo);
	}

	// ȣ�� ���� �Ű� ����
	@Override
	public int hrReportCheck(HrReportVO hrreportvo) {
		return ss.selectOne("house.hrReportCheck", hrreportvo);
	}

}
