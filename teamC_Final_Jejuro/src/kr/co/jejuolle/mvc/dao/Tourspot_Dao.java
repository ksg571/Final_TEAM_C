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

	// ������ �󼼺���
	@Override
	public TourSpotVO tourspotDetail(int tNo) {
		return ss.selectOne("tourspot.tourspotDetail", tNo);
	}

	// ������ ���ƿ�
	@Override
	public void tourspotLike(TourLikeVO tlikevo) {
		ss.insert("tourspot.tourspotLike", tlikevo);
	}

	// ������ ���ƿ� üũ
	@Override
	public int LikeCheck(TourLikeVO tlikevo) {
		return ss.selectOne("tourspot.likecheck", tlikevo);
	}

	// ������ ���ϱ�
	@Override
	public void tourspotPick(TourPickVO tpickvo) {
		ss.insert("tourspot.tourspotpick", tpickvo);
	}

	// ������ ���ϱ� üũ
	@Override
	public int PickCheck(TourPickVO tpickvo) {
		return ss.selectOne("tourspot.pickcheck", tpickvo);
	}

	//������ ��ȸ�� ����
	@Override
	public void tourspotHit(int tNo) {
		ss.update("tourspot.tourHit", tNo);
	}

	//������ ���� ���
	@Override
	public void TourReview(TourReviewVO treviewvo) {
		ss.insert("tourspot.trreviewInsert", treviewvo);
	}

	//������ ���� ����Ʈ
	@Override
	public List<TourReviewVO> trList(SearchVO svo) {
		return ss.selectList("tourspot.treviewList", svo);
	}

	//������ ���� �� ����
	@Override
	public int trListCnt(int tNo) {
		return ss.selectOne("tourspot.trTotal", tNo);
	}

	//������ ���� �Ű�
	@Override
	public void trReport(TrReportVO trreportvo) {
		ss.insert("tourspot.trReport", trreportvo);
	}

	//������ ���� �Ű� ����
	@Override
	public int trReportCheck(TrReportVO trreportvo) {
		return ss.selectOne("tourspot.trReportCheck", trreportvo);
	}

}
