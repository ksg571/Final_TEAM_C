<%@include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="section4 text-center">
	<div class="general-title">
		<h3>TEAM.C FINAL PROJECT</h3>
		<hr>
	</div>

	<!-- section1 : 관광지나, 숙박의 대표적인 정보를 불러오는 곳 시작-->
	<div class="portfolio-wrapper">
		<div id="owl-demo" class="owl-carousel">

			<c:forEach var="e" items="${tTop}" end="7">
				<div class="item">
					<a data-rel="prettyPhoto" href="resources/img/tourspot/${e.tTopImg}">
					<img class="lazyOwl" src="resources/img/tourspot/${e.tTopImg }" data-src="resources/img/tourspot/${e.tTopImg }" style="height:300px;">
						<div>
							<small>${e.tType}</small>
							<span>${e.tName}</span> <i class="fa fa-search"></i>
						</div>
					</a>
				</div>
			</c:forEach>

		</div>
		<!-- end owl-demo -->
	</div>
	<!-- 관광지나, 숙박의 대표적인 정보를 불러오는 곳 끝 -->


	<a class="button large" href="home#">BIGDATA</a>
</section>
<!-- end section1 -->

<!-- section2 : 빅데이터 메뉴창 시작 -->
<section class="section1">
	<div class="container">
		<div class="col-lg-4 col-md-4 col-sm-4">
			<div class="servicebox text-center">
				<div class="service-icon">
					<div class="dm-icon-effect-1" data-effect="slide-left">
						<a href="chart" class=""> <i
							class="active dm-icon fa fa-bars fa-3x"></i>
						</a>
					</div>
					<div class="servicetitle">
						<h4>CHART</h4>
						<hr>
					</div>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry"s standard
						dummy text ever since..</p>
				</div>
				<!-- service-icon -->
			</div>
			<!-- servicebox -->
		</div>
		<!-- large-4 -->

		<div class="col-lg-4 col-md-4 col-sm-4">
			<div class="servicebox text-center">
				<div class="service-icon">
					<div class="dm-icon-effect-1" data-effect="slide-bottom">
						<a href="chart" class=""> <i
							class="active dm-icon fa fa-laptop fa-3x"></i>
						</a>
					</div>
					<div class="servicetitle">
						<h4>BIG DATA</h4>
						<hr>
					</div>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry"s standard
						dummy text ever since..</p>
				</div>
				<!-- service-icon -->
			</div>
			<!-- servicebox -->
		</div>
		<!-- large-4 -->

		<div class="col-lg-4 col-md-4 col-sm-4">
			<div class="servicebox text-center">
				<div class="service-icon">
					<div class="dm-icon-effect-1" data-effect="slide-right">
						<a href="weather" class=""> <i
							class="active dm-icon fa fa-book fa-3x"></i>
						</a>
					</div>
					<div class="servicetitle">
						<h4>WEATHER</h4>
						<hr>
					</div>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry"s standard
						dummy text ever since..</p>
				</div>
				<!-- service-icon -->
			</div>
			<!-- servicebox -->
		</div>
		<!-- large-4 -->
	</div>
	<!-- end container -->
</section>
<!-- section2 : 빅데이터 메뉴창 끝 -->
<%@include file="footer.jsp"%>