<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<footer class="footer">
	<div class="container">
		<div class="widget col-lg-3 col-md-3 col-sm-12">
			<h4 class="title">About TeamC</h4>
			<p>국가기간전략산업직종훈련의 일종으로 한국소프트웨어인재개발원에서 데이터사이언스를 위한 빅데이터플랫폼 구축 및
				분석전문가 양성과정..</p>
			<a class="button small" href="testimonials">read more</a>
		</div>
		<!-- end widget -->
		<div class="widget col-lg-3 col-md-3 col-sm-12">
			<h4 class="title">Recent Posts</h4>
			<ul class="recent_posts">
				<li><a href="home#"> <img
						src="resources/img/recent_post_01.png" alt="" />Our New Dashboard
						Is Here
				</a> <a class="readmore" href="#">read more</a></li>
				<li><a href="home#"> <img
						src="resources/img/recent_post_02.png" alt="" />Design Is In The
						Air
				</a> <a class="readmore" href="#">read more</a></li>
			</ul>
			<!-- recent posts -->
		</div>
		<!-- end widget -->
		<div class="widget col-lg-3 col-md-3 col-sm-12">
			<h4 class="title">Infomation</h4>
			<ul class="contact_details">
				<li><i class="fa fa-envelope-o"></i> ikosmo@naver.com</li>
				<li><i class="fa fa-phone-square"></i> +02-2025-8523</li>
				<li><i class="fa fa-home"></i> 서울시 금천구 가산동 426-5 월드메르디앙 2차
					413호.4강의실</li>
			</ul>
			<!-- contact_details -->
		</div>
		<!-- end widget -->
		<div class="widget col-lg-3 col-md-3 col-sm-12">
			<h4 class="title">Images</h4>
			<ul class="flickr">
				<c:forEach var="e" items="${sessionScope.img}" end="7">
				<li><a href="#"><img src="resources/img/tourspot/${e.tTopImg}"></a></li>
				</c:forEach>
			</ul>
		</div>
		<!-- end widget -->
	</div>
	<!-- end container -->

	<div class="copyrights">
		<div class="container">
			<div class="col-lg-6 col-md-6 col-sm-12 columns footer-left">
				<p>Copyright 2014 - All rights reserved.</p>
				<div class="credits">
					<!--
              You are NOT allowed to delete the credit link to TemplateMag with free version.
              You can delete the credit link only if you bought the pro version.
              Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/maxibiz-bootstrap-business-template/
              Licensing information: https://templatemag.com/license/
            -->
					Created with MaxiBiz template by <a href="https://templatemag.com/">TemplateMag</a>
				</div>
			</div>
			<!-- end widget -->
			<div class="col-lg-6 col-md-6 col-sm-12 columns text-right">
				<div class="footer-menu right">
					<ul class="menu">
						<li><a href="home">Home</a></li>
						<li><a href="testimonials">About</a></li>
						<li><a href="#">Sitemap</a></li>
						<li><a href="contact">Contact</a></li>
					</ul>
				</div>
			</div>
			<!-- end large-6 -->
		</div>
		<!-- end container -->
	</div>
	<!-- end copyrights -->
</footer>
<!-- end footer -->
<div class="dmtop">Scroll to Top</div>

<!-- JavaScript Libraries -->
<script src="resources/lib/jquery/jquery.min.js"></script>
<script src="resources/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="resources/lib/php-mail-form/validate.js"></script>
<script src="resources/lib/prettyphoto/js/prettyphoto.js"></script>
<script src="resources/lib/isotope/isotope.min.js"></script>
<script src="resources/lib/hover/hoverdir.js"></script>
<script src="resources/lib/hover/hoverex.min.js"></script>
<script src="resources/lib/unveil-effects/unveil-effects.js"></script>
<script src="resources/lib/owl-carousel/owl-carousel.js"></script>
<script src="resources/lib/jetmenu/jetmenu.js"></script>
<script src="resources/lib/animate-enhanced/animate-enhanced.min.js"></script>
<script src="resources/lib/jigowatt/jigowatt.js"></script>
<script src="resources/lib/easypiechart/easypiechart.min.js"></script>
<!-- Template Main Javascript File -->
<script src="resources/js/main.js"></script>
<!-- 달력 -->
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- datepicker 한국어로 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
	
<!-- 결제 -->

</body>
</html>