<%@include file="../main/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<style>
input.img-button {
	background: url( "resources/img/kakaopay.jpg" ) no-repeat;
	border: none;
	margin-left: 25%;
	width: 344px;
	height: 144px;
	cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	$(function () {
		$("#inlineCheckbox1").click(function () {
			console.log("111");
			var IMP = window.IMP; // 생략가능
			IMP.init('imp69352987');
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				/*
				'kakao':카카오페이,
				html5_inicis':이니시스(웹표준결제)
				'nice':나이스페이
				'jtnet':제이티넷
				'uplus':LG유플러스
				'danal':다날
				'payco':페이코
				'syrup':시럽페이
				'paypal':페이팔
				 */
				pay_method : 'card',
				/*
				'samsung':삼성페이,
				'card':신용카드,
				'trans':실시간계좌이체,
				'vbank':가상계좌,
				'phone':휴대폰소액결제
				 */
				merchant_uid : 'merchant_' + new Date().getTime(),
				/*
				merchant_uid에 경우
				https://docs.iamport.kr/implementation/payment
				위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
				참고하세요.
				나중에 포스팅 해볼게요.
				 */
				name : $('#hName').text() + '_' + $('#rName').text(),
				//결제창에서 보여질 이름
				amount : $('#pPrice').val(),
				//가격

				buyer_email : $('#email').val(),
				buyer_name : $('#lname').val(),
				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			/*
			모바일 결제시,
			결제가 끝나고 랜딩되는 URL을 지정
			(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
			 */
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '완료버튼을 눌러주세요\n';
					msg += '고유ID : ' + rsp.imp_uid+'\n';
					msg += '상점 거래ID : ' + rsp.merchant_uid+'\n';
					msg += '결제 금액 : ' + rsp.paid_amount+'\n';
					msg += '카드 승인번호 : ' + rsp.apply_num+'\n';
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
			location.href="add_pay";
			
		});

	
	
		$('#cancle').click(function() {
			var rvNo = $('#rvNo').val();
			console.log(rvNo);

			if (confirm("삭제하시겠습니까?") == true) {
				console.log(rvNo);
				alert("취소되었습니다.");
				location.href = "del_res?rvNo=" + rvNo;
			} else {
				return;
			}
		});

	});
</script>
<section class="post-wrapper-top">
	<div class="container">
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
			<ul class="breadcrumb">
				<li><a href="home">Home</a></li>
				<li>Checkout</li>
			</ul>
			<h2>결제하기</h2>
		</div>
	</div>
</section>
<!-- end post-wrapper-top -->

<section class="section1">
	<div class="container clearfix" style="margin-left: 30%">
		<div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix">

			<h5 class="title">예약자 정보</h5>

			<form id="personalinfo" action="add_pay" name="personalinfo" method="post" ">
				<label for="lname">예약자 성함<span class="required">*</span>
				</label> <input type="text" name="lname" id="lname" class="form-control" value="${sessionScope.uName}" disabled="disabled"> <label
					for="email">예약자 이메일 주소 </label> <input type="text" name="name"
					id="email" class="form-control" value="${sessionScope.uEmail}">
				<label for="lname">시작일자<span class="required">*</span>
				</label> <input type="text" name="lname" id="lname" class="form-control"
					value="${rlist.startDate }" disabled="disabled"> <label
					for="lname">종료일자 <span class="required">*</span>
				</label> <input type="text" name="lname" id="lname" class="form-control"
					value="${rlist.endDate }" disabled="disabled">

				<div class="clearfix"></div>
				<div class="divider"></div>
				<table class="table table-striped checkout" data-effect="fade">
					<thead>
						<tr>
							<th>숙박 장소</th>
							<th>룸 정보</th>
							<th>룸 가격</th>
							<th>인원수</th>
							<th>숙박일수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="hName"><img src="resources/img/room/${rlist.rImg }"
								alt="" style="width: 100px">${rlist.hName }</td>
							<td id="rName">${rlist.rName }</td>
							<td id="">${rlist.rPrice }</td>
							<td id="">${rlist.rvPeople }</td>
							<td id="">${sessionScope.day}(일)</td>
						</tr>
					</tbody>
				</table>
				<div class="clearfix"></div>

				<div class="clearfix"></div>

				<div class="well text-right">
					TOTAL:<input type="text" id="pPrice" name="pPrice"
						disabled="disabled" value="${sessionScope.want}">(원) <input
						type="hidden" id="rvNo" name="rvNo" value="${rlist.rvNo }">
					<input type="hidden" name="uNo" value="${sessionScope.uNo }">
				</div>

				<div class="clearfix"></div>
				<div class="divider"></div>



				<h5 class="title">결제방법선택</h5>
				<div id="type" style="text-align: center;">
					<label class="checkbox-inline"> <input id="inlineCheckbox1"
						type="radio" name="pType" value="a"> <strong>신용카드</strong>
					</label> <label class="checkbox-inline"> <input
						id="inlineCheckbox2" type="radio" name="pType" value="b">
						<strong>현장결제</strong>
					</label>
				</div>
				<div id="card" style="display: none;">
					<button id="check_module" type="button">아임 서포트 결제 모듈 테스트해보기22</button>
				</div>
				<div class="clearfix"></div>
				<div class="divider"></div>



				<div style="text-align: center;">
					<h5 class="title"></h5>
					<input type="button" id="cancle" class="button" value="취소">
					<input type="submit"  class="button" value="완료">
				</div>
			</form>
		</div>
		<!-- end content -->
	</div>
	<!-- end container -->
</section>
<!-- end section -->
<%@include file="../main/footer.jsp"%>