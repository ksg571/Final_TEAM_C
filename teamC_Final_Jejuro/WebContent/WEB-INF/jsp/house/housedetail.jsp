<%@include file="../main/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 달력함수 -->
<script>
	$(function() {

		//오늘 날짜를 출력
		$("#today").text(new Date().toLocaleDateString());

		//datepicker 한국어로 사용하기 위한 언어설정
		$.datepicker.setDefaults($.datepicker.regional['ko']);

		// 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
		// 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

		//시작일.
		$('#fromDate').datepicker({
			showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)
			buttonImage : "resources/img/calendar.gif", // 버튼 이미지
			buttonImageOnly : true, // 버튼 이미지만 표시할지 여부
			buttonText : "날짜선택", // 버튼의 대체 텍스트
			dateFormat : "yy-mm-dd", // 날짜의 형식
			minDate : 0,
			changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
			onClose : function(selectedDate) {
				// 시작일(fromDate) datepicker가 닫힐때
				// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
				$("#toDate").datepicker("option", "minDate", selectedDate);
			}
		});

		//종료일
		$('#toDate').datepicker({
			showOn : "both",
			buttonImage : "resources/img/calendar.gif",
			buttonImageOnly : true,
			buttonText : "날짜선택",
			dateFormat : "yy-mm-dd",
			changeMonth : true,
			//minDate: 0, // 오늘 이전 날짜 선택 불가
			onClose : function(selectedDate) {
				// 종료일(toDate) datepicker가 닫힐때
				// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
				$("#fromDate").datepicker("option", "maxDate", selectedDate);
			}
		});

		$('#login').click(function() {
			if (confirm("로그인이 필요합니다. 로그인페이지로 이동하시겠습니까?") == true) {
				location.href = "loginForm"
			} else {
				return;
			}

		})
	});
</script>
<!-- 상세보기 버튼 클릭시 문구 사라지는 함수 -->
<script>
	$(function() {
		$("#res").click(function() {
			var cc = $("#td3").val();//남은방개수
			var bb = $("#td4").val();//최대이용가능인원
			console.log("bb" + bb);

			if (cc == 0) {
				alert("예약가능한 방이 없습니다.");
				return false;
			} else {
				$('#people').attr("max", bb);
			}
		})

		$(".detail").each(function() {
			$(this).click(function detail() {
				
				$("#displaydiv").show();
				$("#test1").hide();
				
				var aa = $(this).val();
				$('#rNo2').attr("value", aa);
				console.log("rNo : " + aa);

				$.ajax({
					url : "roomdetail?rNo=" + aa,
					dataType : 'json',
					success : function(data) {
						console.log(data);
						test1 = data.rName;
						test2 = data.rPrice;
						test3 = data.rPeople;
						test4 = data.rImg;
						test4 = "resources/img/room/" + test4
						test5 = data.rInfo;
						test6 = data.rCount;
						console.log(test1, test2, test3, test4, test5, test6);
						if (data !== "") {
							$('#td1').attr("value", test1);
							$('#td2').attr("value", test2);
							$('#td3').attr("value", test6);
							$('#td4').attr("value", test3);
							$('#td5').attr("value", test5);
							$('#td0').attr("src", test4);
							if (test6 == 0) {
								$("#td3").show().css("color", "red");
							}
						}
					}
				});
			});

		});
	});
</script>
<!-- 별점 함수  -->
<!-- <script>
	$(function() {
		$('.starRev span').click(function() {
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			return false;
		});
	});
</script> -->
<!-- 로그인 체크 -->
<script>
	function loginCheck(uuid) {
		/* 로그인이 되있지 않은경우 */
		if (uuid == '') {
			//로그인을 한다고 할경우
			if (confirm("로그인이 필요합니다. 로그인페이지로 이동하시겠습니까?") == true) {
				location.href = "loginForm"
				//로그인을 하지 않겠다=취소버튼
			} else {
				return false;
			}
			/* 로그인이 되있는 경우 */
		} else {
			return true;
		}
	}
</script>
<script>
	function pick(hNo, val) {
		var data = {
			"hNo" : hNo,
			"val" : val
		}
		$.ajax({
			type : "GET",
			data : data,
			url : "houselikepick",
			success : function(data) {
				if (data == 1) {
					alert("이미 찜했습니다.", data);
				} else {
					alert("찜하기 성공", data)
				}
			}
		})
	}
	function like(hNo, val) {
		var data = {
			"hNo" : hNo,
			"val" : val
		}
		$.ajax({
			type : "GET",
			data : data,
			url : "houselikepick",
			success : function(data) {
				if (data == 1) {
					alert("좋아요가 이미 되있습니다.", data);
					location = 'housedetail?hNo=' + hNo
				} else {
					alert("좋아요 성공", data)
					location = 'housedetail?hNo=' + hNo
				}
			}
		})
	}
</script>
<!-- 리뷰 전송 및 신고 -->
<script>
	$(function() {
		//리뷰 등록
		$('#sendBtn').click(function() {
			//폼 전송
			$('#comments_form1').submit();
		});
		
		//신고
		$('.shingo').on('click',function(){
			//로그인 체크
			var check = loginCheck('${sessionScope.uuId}');
			var val = $(this).val().split('/');
			
			//console.log('val0:'+val[0]);
			//console.log('val1:'+val[1]);
			
			//로그인이 되어있을때
			if(check == true){
				$.ajax({
					type : "GET",
					data : {"hrNo":val[0],"uNo":val[1]},
					url : "reviewshingo",
					success : function(data) {
						if (data == 1) {
							alert("이미 신고되있습니다.", data);
						} else {
							alert("신고했습니다.", data)
						}
					}
				});
			}
			
		});
	});
</script>
<!-- 리뷰 아이디가 나올때 리뷰 탭 고정 -->
<script>
	$(document).ready(function(){
		var id = "<c:out value="${id}"/>"
		
		if(id=='webdevelopment'){
			$('.nav-tabs > li').removeClass("active");
			$(".tab-pane").removeClass("active");
			
			$("#webdevelopment").addClass("active");
			$("#review-tab").addClass("active");
		}
	});
</script>

<script>
$(function(){
	$("#detail-tab").on('click', function() {
		$(".tab").eq(0).addClass("active");
		$(".tab").eq(0).attr("aria-expanded", "true");
		$(".tab").eq(1).removeClass("active");
		$(".tab").eq(1).attr("aria-expanded", "false");
		$(".tab").eq(2).removeClass("active");
		$(".tab").eq(2).attr("aria-expanded", "false");
		
		$("#webdesign").addClass("active in");
		$("#webdevelopment").removeClass("active");
		$("#seoservices").removeClass("active");
	});
	
	$("#review").on('click', function() {
		$(".tab").eq(0).removeClass("active");
		$(".tab").eq(0).attr("aria-expanded", "false");
		$(".tab").eq(1).addClass("active");
		$(".tab").eq(1).attr("aria-expanded", "true");
		$(".tab").eq(2).removeClass("active");
		$(".tab").eq(2).attr("aria-expanded", "false");
		
		$("#webdesign").removeClass("active");
		$("#webdevelopment").addClass("active");
		$("#seoservices").removeClass("active");
	});
	
	$("#service").on('click', function() {
		$(".tab").eq(0).removeClass("active");
		$(".tab").eq(0).attr("aria-expanded", "false");
		$(".tab").eq(1).addClass("active");
		$(".tab").eq(1).attr("aria-expanded", "true");
		$(".tab").eq(2).removeClass("active");
		$(".tab").eq(2).attr("aria-expanded", "false");
		
		$("#webdesign").removeClass("active");
		$("#webdevelopment").removeClass("active");
		$("#seoservices").addClass("active");
	});
	
});
</script>
<style>
/*모달위치*/
.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 80%;
	}
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

ul {
	list-style: none;
}
/* 별점 스타일 시작 */
.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}
/* 별점 스타일 끝 */

/* 버튼 스타일 시작 */
.myButton {
	box-shadow: 3px 4px 0px 0px #899599;
	background: linear-gradient(to bottom, #ededed 5%, #bab1ba 100%);
	background-color: #ededed;
	border-radius: 15px;
	border: 1px solid #d6bcd6;
	display: inline-block;
	cursor: pointer;
	color: #3a8a9e;
	font-family: Arial;
	font-size: 17px;
	padding: 7px 25px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #e1e2ed;
}

.myButton:hover {
	background: linear-gradient(to bottom, #bab1ba 5%, #ededed 100%);
	background-color: #bab1ba;
}

.myButton:active {
	position: relative;
	top: 1px;
}

/* 버튼 스타일 끝 */
</style>
<!--  스크롤 -->
<style>
#scroll {
	width: 100px;
	height: 150px;
}
</style>


<!-- end post-wrapper-top -->

<section class="section1">
	<div class="container clearfix">
		<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">
			<div class="col-lg-4 col-md-4 col-sm-4">
				<div class="portfolio_details">
					<div class="details_section">
						<h2>
							<a>${hvo.hName}</a>
						</h2>
						<br>
						<h3>
							&nbsp;&nbsp;숙소유형 :<span>&nbsp;${hvo.hType}</span>
						</h3>
						<div>
							<p></p>
						</div>
						<hr>
						<ul>
							<li class="version">
								<span>
									<div id="star-box${hvo.hNo}">
										<span class="starR1 on">별1_왼쪽</span> <span class="starR2">별1_오른쪽</span>
										<span class="starR1">별2_왼쪽</span> <span class="starR2">별2_오른쪽</span>
										<span class="starR1">별3_왼쪽</span> <span class="starR2">별3_오른쪽</span>
										<span class="starR1">별4_왼쪽</span> <span class="starR2">별4_오른쪽</span>
										<span class="starR1">별5_왼쪽</span> <span class="starR2">별5_오른쪽</span>
									</div>
									<br>
								</span>
							</li>
							<script>
								var rgrade = "<c:out value="${hvo.hPoint}"/>";
								var gnum = "<c:out value="${hvo.hNo}"/>";
								var j = 0;
								for (var i = 0.5; i <= rgrade; i += 0.5) {
									$('#star-box'+gnum + ' span').eq(j).addClass("on");
									j++;
								}
							</script>
							<br>
							<li class="update">주소 : <span>${hvo.hAddr1}</span></li>

							<li class="release">전화번호 : <span>${hvo.hTel}</span></li>
						</ul>
					</div>
				</div>
				<div class="" style="text-align: center;">
					<div class="">
						<br>
						<div style="margin-left: 10px; font-size: 0.5em;">
							<i class="fa fa-text1 fa-3x"> 조회수 <a>${hvo.hHit}</a></i>
							&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-text2 fa-3x">좋아요 <a
								href="javascript:like(${hvo.hNo},1);"
								onclick="return loginCheck('${sessionScope.uuId}')">${hvo.hlikes}</a></i>
							<hr>
							<a class="fa fa-text3 fa-3x"
								href="javascript:pick(${hvo.hNo},2);"
								onclick="return loginCheck('${sessionScope.uuId}')">찜하기</a>
						</div>
						<hr>
						<ul>

						</ul>

					</div>
				</div>
				<div></div>


				<!-- theme details -->
			</div>


			<div id="map" style="width: 60%; height: 400px;"></div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8b2b3fa7a88682f73a72b57b119c70c3&libraries=services"></script>
			<script>
				// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
				var infowindow = new kakao.maps.InfoWindow({
					zIndex : 1
				});

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);

				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places();

				// 키워드로 장소를 검색합니다
				ps.keywordSearch('${hvo.hAddr1}', placesSearchCB);

				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB(data, status, pagination) {
					if (status === kakao.maps.services.Status.OK) {

						// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
						// LatLngBounds 객체에 좌표를 추가합니다
						var bounds = new kakao.maps.LatLngBounds();

						for (var i = 0; i < data.length; i++) {
							displayMarker(data[i]);
							bounds.extend(new kakao.maps.LatLng(data[i].y,
									data[i].x));
						}

						// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
						map.setBounds(bounds);
					}
				}

				// 지도에 마커를 표시하는 함수입니다
				function displayMarker(place) {

					// 마커를 생성하고 지도에 표시합니다
					var marker = new kakao.maps.Marker({
						map : map,
						position : new kakao.maps.LatLng(place.y, place.x)
					});

					// 마커에 클릭이벤트를 등록합니다
					kakao.maps.event
							.addListener(
									marker,
									'click',
									function() {
										// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
										infowindow
												.setContent('<div style="padding:5px;font-size:12px;">'
														+ place.place_name
														+ '</div>');
										infowindow.open(map, marker);
									});
				}
			</script>

			<br> <br>
			<div class="tabbable servicetab tabs-left">
				<ul class="nav nav-tabs"
					style="margin-left: 10px; border-bottom: 2px solid #ddd; width: 1020px;">
					
					<li class="tab active"><a id="detail-tab" href="#detail-tab"
						data-toggle="tab" aria-expanded="true"><i class="fa fa-laptop"></i>숙소예약</a></li>
						
					<li class="tab" id="review-tab"><a id="review" href="#review" data-toggle="tab"><i
							class="fa fa-cogs"aria-expanded="true"></i>숙소 리뷰</a></li>
							
					<li class="tab"><a id="service" href="#service" data-toggle="tab"><i
							class="fa fa-print" aria-expanded="true"></i>숙소 정보</a></li>
				</ul>
				<div class="tab-content">
					<!-- 숙소정보 -->
					<div class="tab-pane" id="seoservices">
						<br> <br>
						<div class="row" style="width: 950px; height: 400px;">
							<div style="width: 950px; height: 350px;">
								<div class="item_image"
									style="width: 45%; height: 350px; float: left;">
									<img class="img-responsive"
										src="resources/img/house/${hvo.hTopImg }"
										style="width: 100%; height: 80%;">
								</div>
								<div style="width: 10%; height: 350px; float: left;"></div>
								<div style="width: 45%; height: 350px; float: right;"
									class="item_image">
									<c:forTokens var="e" items="${hvo.hInfo}" delims="/">
										<h5>${e}</h5>
										<br>
									</c:forTokens>
								</div>
							</div>
						</div>
					</div>


					<!-- 리뷰 -->
					<div class="tab-pane" id="webdevelopment" style="width: 950px">
						<br>
						<div>
						<c:choose>
								<c:when test="${sessionScope.uuId != null } ">
							<input data-toggle="modal" data-target="#myModal" type="button"
								id="" value="리뷰작성" style="float: right;" class="myButton">
								</c:when>
							</c:choose>
						</div>
						<div class="row">
							<div id="comments_wrapper">
								<ul class="comment-list">
								<c:forEach var="hr" items="${hrlist}">
									<li>
										<div class="comment-content" style="height: 135px">
												<h4 class="comment-author">
													${hr.hrTitle}
													<small class="comment-meta"> <a>${hr.hrUser} / ${hr.hrDate}</a>
													<span class="comment-reply">
													<!-- <input type="button" id="shingo" class="btn btn-danger" value="신고" > -->
													<button type="button" class="btn btn-danger shingo" value="${hr.hrNo}/${sessionScope.uNo}">
														신고
													</button>
													</span>
														<li class="version">
																<div id="starRev${hr.hrNo}" style="float: right;">
																	<span class="starR1 on">별1_왼쪽</span><span class="starR2">별1_오른쪽</span>
																	<span class="starR1">별2_왼쪽</span><span class="starR2">별2_오른쪽</span>
																	<span class="starR1">별3_왼쪽</span><span class="starR2">별3_오른쪽</span>
																	<span class="starR1">별4_왼쪽</span><span class="starR2">별4_오른쪽</span>
																	<span class="starR1">별5_왼쪽</span><span class="starR2">별5_오른쪽</span>
																</div>
																
														</li>
													</small>
												</h4>
												<p>${hr.hrContent}</p>
												
												<script>
														var rgrade = "<c:out value="${hr.hrPoint}"/>";
														var rnum = "<c:out value="${hr.hrNo}"/>";
														var j = 0;
														for (var i = 0.5; i <= rgrade; i += 0.5) {
															$('#starRev'+rnum+' span').eq(j).addClass("on");
															j++;
														}
												</script>													
											</div>
									</li>
								</c:forEach>
								</ul>
								<!-- End .comment-list -->
								<%@include file="houseReview_page.jsp" %>
								<div class="clearfix"></div>


							</div>
							<!-- div comments -->

						</div>
					</div>


					<div class="tab-pane active" id="webdesign">
						<br>
						<div style="width: 95%; height: 600px;">
							<div
								style="width: 65%; height: 600px; float: left; box-sizing: border-box">
								<!-- 상세보기 버튼클릭시 없어져야하는 부분 -->
								<h1 id="test1" style="margin-left: 15%;">상세보기버튼을 눌러주세요</h1>

								<div
									style="display: none; width: 100%; height: 300px; text-align: center; margin-top: 40px;"
									id="displaydiv">
									<img id="td0" src="" style="width: 300px; height: 200px">
									<table style="width: 100%; height: 100%;">
										<br>
										<tr>
											<td>룸이름</td>
											<td><input type="text" id="td1" disabled="disabled"></td>
										</tr>
										<tr>
											<td>룸가격</td>
											<td><input type="text" id="td2" disabled="disabled"></td>
										<tr>
											<td>남은방개수</td>
											<td><input type="text" id="td3" disabled="disabled"></td>
										</tr>
										<tr>
											<td>최대이용가능인원</td>
											<td><input type="text" id="td4" disabled="disabled"></td>
										</tr>
										<tr>
											<td>방정보</td>
											<td><input type="text" id="td5" disabled="disabled"></td>

										</tr>
										<tr>
											<c:choose>
												<c:when test="${sessionScope.uuId != null }">
													<td><input data-toggle="modal" data-target="#myModal2"
														type="button" id="res" value="예약하기"
														class="btn btn-warning"
														style="width: 100px; margin-left: 80%"></td>
												</c:when>
												<c:otherwise>
													<td><input type="button" id="login" value="로그인"
														class="btn btn-warning"
														style="width: 100px; margin-left: 80%"></td>
												</c:otherwise>
											</c:choose>
										</tr>
									</table>
									</form>
								</div>
							</div>
							<div style="width: 35%; float: right; box-sizing: border-box">
								<div style="overflow-y: auto; width: 100%; height: 600px;">
									<ul>
										<c:forEach var="e" items="${rlist}">
											<li id="showbtn"><p>
													
													${e.rName} <img src="resources/img/room/${e.rImg }">
													<button data-toggle="modal" type="button" id="detail" value="${e.rNo}"  class="btn btn-warning detail"
														style="width: 100%; height: 20pt;">방 상세보기 </button>
													<input type="hidden" id="rNo" value="${e.rNo}">
												</p></li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- owl-related -->
		</div>
		<!-- end content -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel"
							style="text-align: center;">리뷰작성</h4>
					</div>
					<div class="comments_form1">
						<br>
						<form id="comments_form1" action="reviewInsert" name="comments_form1"
							class="row" method="post">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								제목: <input type="text"  name="hrTitle" id="hrTitle"
									class="form-control" placeholder="제목을 입력하세요."
									required="required">

								<ul>
									<li class="version">별점: <span>
												<div class="starRev" id="starRev">
													<span class="star starR1 on" href="#1">별1_왼쪽</span>
													<span class="star starR2" href="#2">별1_오른쪽</span>
													<span class="star starR1" href="#3">별2_왼쪽</span>
													<span class="star starR2" href="#4">별2_오른쪽</span>
													<span class="star starR1" href="#5">별3_왼쪽</span>
													<span class="star starR2" href="#6">별3_오른쪽</span>
													<span class="star starR1" href="#7">별4_왼쪽</span>
													<span class="star starR2" href="#8">별4_오른쪽</span>
													<span class="star starR1" href="#9">별5_왼쪽</span>
													<span class="star starR2" href="#0">별5_오른쪽</span>
													<input type="hidden" value="0.5" id="rg" name="hrPoint">
												</div>
									</span></li>
								</ul>
								<textarea class="form-control" name="hrContent" id="hrContent"
									rows="6" placeholder="내용을 입력하세요."></textarea>
								<input type="hidden" value="${hvo.hNo}" id="hNo" name="hNo">
								<input type="hidden" value="${sessionScope.uNo}" id="uNo"
									name="uNo"> <input type="hidden"
									value="${sessionScope.uName}" id="hrUser" name="hrUser">
							</div>
						</form>
						<script>
						$("#starRev span").on('click', function() {
							var idx = $(this).index();

							$(".star").removeClass("on");

							for (var i = 0; i <= idx; i++) {
								$(".star").eq(i).addClass("on");
							}

							if ($(this).attr("href") === "#1") {
								rgrade = 0.5 * 1;
							} else if ($(this).attr("href") === "#2") {
								rgrade = 1 * 1;
							} else if ($(this).attr("href") === "#3") {
								rgrade = 1.5 * 1;
							} else if ($(this).attr("href") === "#4") {
								rgrade = 2 * 1;
							} else if ($(this).attr("href") === "#5") {
								rgrade = 2.5 * 1;
							} else if ($(this).attr("href") === "#6") {
								rgrade = 3 * 1;
							} else if ($(this).attr("href") === "#7") {
								rgrade = 3.5 * 1;
							} else if ($(this).attr("href") === "#8") {
								rgrade = 4 * 1;
							} else if ($(this).attr("href") === "#9") {
								rgrade = 4.5 * 1;
							} else if ($(this).attr("href") === "#0") {
								rgrade = 5 * 1;
							} else {
							}
							$("#rg").attr("value", rgrade)
						});
						</script>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="button" id="sendBtn" class="btn btn-primary">등록</button>
					</div>
				</div>
			</div>
		</div>





		<!-- 모달2 -->
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">

			<div class="modal-dialog" >
				<div class="modal-content" autocomplete=off>
					<form action="res_room" method="post" >
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel"
								style="text-align: center;">예약하기</h4>
						</div>
						<div class="comments_form">
							<br>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
								style="position: relative; text-align: center;">
								<input type="hidden" id="rNo2" name="rNo">
								<table>
									<tr>

										<td>오늘 날짜 : <span id="today"></span> <br> <label
											for="fromDate">시작일&nbsp;</label> <input type="text"
											id="fromDate" name="startDate">~ <label for="toDate">종료일&nbsp;</label>
											<input type="text" id="toDate" name="endDate"> <br>
										</td>
									</tr>
								</table>
								<input type="number" id="people" min="1" max="10" step="1"
									name="rvPeople" id="number" class="form-control"
									placeholder="인원 수를 입력하세요." required="required"
									style="width: 200px; left: 0; right: 0; margin-left: auto; margin-right: auto;">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
							<input type="submit" class="btn btn-primary">
						</div>
					</form>
				</div>
			</div>
		</div>


		<!-- end content -->
	</div>
	<!-- end container -->
</section>
<!-- end section -->
<%@include file="../main/footer.jsp"%>