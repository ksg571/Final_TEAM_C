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
<link href="resources/css/my_review.css" rel="stylesheet">

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

			<div class="col-lg-8 col-md-8 col-sm-12 clearfix">
				<div class="portfolio_details">
					<div class="details_section">
						<div class="row">
							<div class="col-lg-10 col-md-10">
								<h2>
									TeamC<small>님의 제주여행</small>
								</h2>
							</div>
							<div class="col-lg-2 col-md-2">
								<a href="infoModify" style="color:orange; font-weight: bold;">정보수정</a>
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

			<div class="content col-lg-12 col-md-12 col-sm-12 clearfix"
				style="padding-bottom: 0px;">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<a href="mypage"><button style="font-size: medium;">나의
							여행</button></a> <a href="pickTourspot"><button style="font-size: medium;">찜한
							관광지</button></a>
					<button style="font-size: medium;">찜한 숙소</button>
					<a href=""><button style="font-size: medium;">예약 숙소</button></a> <a
						href="myreview"><button style="font-size: medium;">나의
							리뷰</button></a>
							<a href=""><button style="font-size: medium;">나의 문의</button></a>
				</div>
			</div>
			<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">
				<h3 class="title">내가 남긴 리뷰</h3>
					<div class="box">
						<img src="http://img.earthtory.com/img/place_img/58/3549_0_et.jpg"
							alt="" class="spot_img">
						<div class="review_i_right">
							<div class="spot_name">
								도톤보리
								<div class="date">2020.01.22</div>
								<div class="clear"></div>
							</div>
							<div class="rate_val" style="background: url(./resources/img/mypage_icon/1.0.PNG) no-repeat; height: 36px;"></div>
							<div class="review_txt">좋았습니다</div>
							<div class="review_bottom">
								<div class="review_like"
									onclick="reviewDelete()"
									data-srl="5857">
									신고 (<span>0</span>)
								</div>
								<div class="edit_btn" onclick="reviewDel()" >삭제</div>
								
							</div>
						</div>
						<div class="clear"></div>
					</div>
			</div>
		</div>
		<!-- end content -->
	</div>
	<!-- end container -->
	
	
</section>
<!-- end section -->
<script>
$(documnet).ready(function(){
	
});

function reviewDel(){
	if(confirm('삭제하시겠습니까? \n리뷰 삭제시 복구할 수 없습니다.')){
		console.log('ddd')
	}
}

function reviewDelete(){
	if(confirm('신고하시겠습니까?')){
		console.log('zz')
	}
}
</script>
<%@include file="../main/footer.jsp"%>