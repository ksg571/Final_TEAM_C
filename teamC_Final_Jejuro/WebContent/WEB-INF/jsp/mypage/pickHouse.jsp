<%@include file="../main/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<style>
#div1, #div2 {
	float: left;
	width: 100px;
	height: 80px;
	margin: 10px;
	padding: 10px;
	border: 1px solid black;
}
</style>
<link href="resources/css/pickHouse.css" rel="stylesheet">


<section class="section1">
<br><br>
	<div class="container clearfix">
		<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">

			<div class="clearfix"></div>

			<div class="col-lg-4 col-md-4 col-sm-4">
				<div class="item_image">
					<div id="myCarousel" class="carousel slide">
						<div class="carousel-inner">
							<div class="item active">
								<img src="resources/img/slides_01.jpg" alt="">
							</div>
							<!-- end item -->
							<div class="item">
								<img src="resources/img/slides_02.jpg" alt="">
							</div>
							<!-- end item -->
							<div class="item">
								<img src="resources/img/slides_03.jpg" alt="">
							</div>
							<!-- end item -->
						</div>
						<!-- carousel inner -->
						<a class="left carousel-control" href="#myCarousel"
							data-slide="prev"> <span class="icon-prev"></span>
						</a> <a class="right carousel-control" href="#myCarousel"
							data-slide="next"> <span class="icon-next"></span>
						</a>
					</div>
					<!-- end carousel -->
				</div>
				<!-- end item_image -->
			</div>
			<!-- end col-lg 8 -->

			<div class="col-lg-8 col-md-8 col-sm-12">
				<div class="portfolio_details">
					<div class="details_section">
						<div class="row">
							<div class="col-lg-10 col-md-10">
								<h2>
									TeamC<small>님의 제주여행</small>
								</h2>
							</div>
							<div class="col-lg-2 col-md-2">
								<a href="infoModify" style="color: orange; font-weight: bold;">정보수정</a>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<hr>
								<table>
									<tr>
										<td
											style="text-align: center; border-right: 1px solid #F5F5F5; width: 350px;">
											<ul>
										<li class="mypage">나의 여행일정: <span><a href="#">3</a></span></li>
										<li class="pickTourspot">찜한 관광지: <span><a href="#">5</a></span></li>
										<li class="pickhouse">찜한 숙소: <span><a href="#">2</a></span></li>

									</ul>
								</td>
								<td style="text-align: center; width: 350px;">
									<ul>
										<li class="">예약 숙소: <span><a href="#">1</a></span></li>
										<li class="myreview">나의 리뷰: <span><a href="#">3</a></span></li>
										<li class="">나의 문의: <span><a href="#">3</a></span></li>

									</ul>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<!-- details section -->
				</div>
				<!-- theme details -->
			</div>
			<!-- end col-lg 8 -->
			<div class="row">
				<div class="content col-lg-12 col-md-12 col-sm-12 clearfix"
					style="padding-bottom: 0px;">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<a href="mypage"><button style="font-size: medium;">나의
								여행</button></a> <a href="pickTourspot"><button style="font-size: medium;">찜한
								관광지</button></a> <a href="pickhouse"><button style="font-size: medium;">찜한
								숙소</button></a> <a href=""><button style="font-size: medium;">예약
								숙소</button></a> <a href="myreview"><button style="font-size: medium;">나의
								리뷰</button></a> <a href=""><button style="font-size: medium;">나의
								문의</button></a>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<div class="row">
				<div class="content col-lg-6 col-md-6 col-sm-6 clearfix">
					<h3 class="title">찜한 숙소</h3>
					<div class="spots-contents">
						<span class="spot-img"> <a href="/spot/6a26031e694caa6c"
							target="_blank"><img
								src="https://thumb-wishbeen.akamaized.net/LSqaWVW1x-a_l10IL6dqBTI6Ogc=/150x149/smart/filters:no_upscale()/pix3.agoda.net/hotelimages/856/85650/85650_14121816030024046789.jpg"
								alt="img"></a>
						</span>
						<div class="spot-info-box spot-type02">
							<h4 class="spot-name">
								<a href="/spot/6a26031e694caa6c" target="_blank">베네시안 리조트 호텔
									(The Venetian Resort Hotel)</a>
							</h4>
							<span class="spot-state">베네시안 마카오 내부에 있는 유명한 5성급 호텔</span>
							<div class="desc">
								<span class="town">마카오 Taipa</span> <span class="popular">인기도
									3650</span>
							</div>
							<div class="count-box">
								<span class="btn-post" href="/spot/6a26031e694caa6c"><span>186</span>
									개의 포스트</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end content -->
	</div>
	<!-- end container -->
</section>
<!-- end section -->
<script>
	
</script>
<%@include file="../main/footer.jsp"%>