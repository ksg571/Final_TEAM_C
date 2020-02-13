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

	// ������ �󼼺���
	public TourSpotVO tourspotDetail(int tNo);

	// ������ ���ƿ�
	public void tourspotLike(TourLikeVO tlikevo);

	// ������ ���ƿ� üũ
	public int LikeCheck(TourLikeVO tlikevo);

	// ������ ���ϱ�
	public void tourspotPick(TourPickVO tpickvo);

	// ������ ���ϱ� üũ
	public int PickCheck(TourPickVO tpickvo);

	//������ ��ȸ�� ����
	public void tourspotHit(int tNo);
	//ȣ�� ���� ���
	public void TourReview(TourReviewVO treviewvo);
	
	//ȣ�� ���� ����Ʈ
	public List<TourReviewVO> trList(SearchVO svo);
	
	//ȣ�� ���� �� ����
	public int trListCnt(int tNo);
	
	//ȣ�ڸ���Ű�
	public void trReport(TrReportVO trreportvo);
	//ȣ�ڸ���Ű� ����
	public int trReportCheck(TrReportVO trreportvo);

}
