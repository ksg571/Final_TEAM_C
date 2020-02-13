<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<title>제주로 올레</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- 프로젝트 로고 -->
<link href="resources/img/logo.png" rel="icon">

<link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Ruda:400,900,700"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="resources/lib/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="resources/lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="resources/lib/prettyphoto/css/prettyphoto.css"
	rel="stylesheet">
<link href="resources/lib/hover/hoverex-all.css" rel="stylesheet">
<link href="resources/lib/jetmenu/jetmenu.css" rel="stylesheet">
<link href="resources/lib/owl-carousel/owl-carousel.css"
	rel="stylesheet">
<!-- Main Stylesheet File -->
<link href="resources/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/colors/blue.css">
<link href="resources/css/bbpress.css" rel="stylesheet">

<!-- 추가 CSS 시작 -->

<!-- 리뷰 관련 css -->
<link href="resources/css/reviews.css" rel="stylesheet">
<!-- 달력 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<!-- 추가 CSS 끝 -->
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.js"></script>

<script>
	//페이지가 불러 졌을때
	$(document).ready(function() {
		//비동기 통신
		$.ajax({
			type : "GET",
			dataType : 'json',
			url : "visitcount",
			success : function(data) { //성공시 매개변수로 DATA를 받음
				//12번 눌러서 콘솔로 이동하면 json형태의 데이터 확인
				console.log(data);
				let tag;
				tag = "";
				tag += "방문자 수 : " + data;
				//데이터의 크기만큼 돌려줌
				$('.visitcount').html(tag);
			},
			error : function(error) {
				alert("오류 발생" + error);
			}
		});
	});
</script>
<body>
	<!-- 최상단 bar 시작 -->
	<div class="topbar clearfix">
		<div class="container">
			<div class="col-lg-12 text-right">
				<div class="social_buttons">
					<!-- 로그인 회원가입 -->
					<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
					<c:choose>
						<c:when test="${sessionScope.uuId == null }">
							<a href="loginForm" style="float: left; width: 60px">로그인 |</a>&nbsp;&nbsp;
							<a href="registerForm" style="float: left; width: 60px">회원가입</a>
						</c:when>
						<c:otherwise>
							<a href="logout" style="float: left; width: 60px">로그아웃 </a>
							<a href="" style="float: left; width: 150px">|${sessionScope.uName}
								님 환영합니다.</a>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${sessionScope.uuId == null }">

						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>

					<!-- 검색 -->
					<a href="search" data-toggle="tooltip" data-placement="bottom"
						title="검색"><i class="fa fa-rss"></i></a> <a
						href="https://ko-kr.facebook.com/" data-toggle="tooltip"
						data-placement="bottom" title="Facebook"><i
						class="fa fa-facebook"></i></a> <a href="https://twitter.com/?lang=ko"
						data-toggle="tooltip" data-placement="bottom" title="Twitter"><i
						class="fa fa-twitter"></i></a> <a href="https://www.google.com/"
						data-toggle="tooltip" data-placement="bottom" title="Google+"><i
						class="fa fa-google-plus"></i></a>
				</div>
			</div>
		</div>
		<div id="visitcount" class="visitcount" name="visitcount"
			style="float: right; margin-top: -24px; margin-right: 60px;"></div>
		<!-- end container -->
	</div>
	<!-- 최상단 bar 끝 -->
	<!-- 메뉴창 시작 -->
	<header class="header">
		<div class="container">
			<div class="site-header clearfix">
				<div class="col-lg-3 col-md-3 col-sm-12 title-area">
					<div class="site-title" id="title">
						<a href="home" title="">
							<h4>
								<img alt=""
									src="resources/img/plan_icon/icons8-south-korea-map-50.png">제주로<span>올레</span>
							</h4>
						</a>
					</div>
				</div>
				<!-- title area -->
				<div class="col-lg-9 col-md-12 col-sm-12">
					<div id="nav" class="right">
						<div class="container clearfix">
							<ul id="jetmenu" class="jetmenu blue">
								<li class="active"><a href="home">홈</a></li>
								<li><a href="tourList">관광지</a> <!-- 대분류 -->
									<ul class="dropdown">
										<li><a href="tourList">종합</a></li>
										<!-- 소분류  -->
										<li><a href="tourList">자연</a></li>
										<li><a href="tourList">문화</a></li>
										<li><a href="tourList">테마</a></li>
										<li><a href="tourList">올레</a></li>
									</ul></li>
								<li><a href="house">숙박</a>
									<ul class="dropdown">
										<li><a href="house">종합</a></li>
										<li><a href="house">호텔</a></li>
										<li><a href="house">호스텔</a></li>
										<li><a href="house">콘도</a></li>
									</ul></li>
								<li><a href="notice">공지사항</a>
									<ul class="dropdown">
										<li><a href="notice">공지사항</a></li>
										<li><a href="faq">자주묻는질문</a></li>
										<li><a href="contact">문의사항</a></li>
									</ul></li>
								<li><a href="404">제주이야기</a>
									<ul class="dropdown">
										<li><a href="jejustory">제주이야기</a></li>
										<li><a href="blog">블로그</a></li>
										<li><a href="etc">기타등등</a></li>
									</ul></li>
								<li><a href="404">빅데이터</a>
									<ul class="dropdown">
										<li><a href="chart">차트</a></li>
										<li><a href="bigdata">추천</a></li>
										<li><a href="weather">날씨</a></li>
									</ul></li>
								<c:choose>
									<c:when test="${sessionScope.uuId != null }">
										<li><a href="mypage">마이페이지</a>
											<ul class="dropdown">
												<li><a href="mypage">나의여행</a></li>
												<li><a href="pickTourspot">pick 관광지</a></li>
												<li><a href="pickhouse">pick 숙소</a></li>
												<li><a href="pickhouse">예약 숙소</a></li>
												<li><a href="myreview">나의리뷰</a></li>
												<li><a href="infoModify">수정하기</a></li>
											</ul></li>
									</c:when>
									<c:otherwise>
										<li><a href="loginForm">마이페이지</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
					<!-- nav -->
				</div>
				<!-- title area -->
			</div>
			<!-- site header -->
		</div>
		<!-- end container -->
	</header>
	<!-- 메뉴 창 끝 -->
	<!-- 최근본 상품 내역-->
	<div class="latelyview"
		style="position: fixed; right: 20px; bottom: 20px;z-index: 100"></div>
	<script>
		//최근 본 상품
		$(document).ready(function() {
							let tag = "";
							tag += "<table class='table info'><thead><tr><th>최근 본 리스트</th></tr></thead>";
							tag += "<tbody class ='sangdong_a'>";
							//쿠키값 받아오기
							var str = document.cookie;
							//쿠키가 문자열이라서 뒤에 ';'을 자름
							cookiearray = str.split(";");
							for (var i = 0; i < cookiearray.length; i++) {
								//키값 이름
								var name = cookiearray[i].split('=')[0];
								//키값 value값
								var value = cookiearray[i].split('=')[1];
								console.log(value);
								console.log(name);
								//쿠키 이름이 key가 있을 경우
								if (name == 'key') {
									//value의 값으로 '#'으로 자름
									var tmp1 = value.split('#');
									//인덱스에 있는 향상된 for문 
									for ( var i in tmp1) {
										//'/'으로 값을 나눔
										var tmp2 = tmp1[i].split('/');
										if (tmp2 != "") {
											tag += "<tr><td><a href='tourdetail?tNo="+ tmp2[0]+ "'><img src='resources/img/tourspot/"+tmp2[1]+"' style='width: 150px; height: 150px;'";
											tag += "/></a></td></tr>";
										}
									}
									tag += "</tbody></table>";
									$('.latelyview').html(tag);
								}
							}
						});
	</script>