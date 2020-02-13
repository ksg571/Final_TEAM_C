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
<section class="section1">
	<div class="container clearfix">
		<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">
			<div class="clearfix"></div>

			<div class="content col-lg-3 col-md-3 col-sm-3 clearfix"></div>
			<div class="content col-lg-6 col-md-6 col-sm-6">
				<div style="text-align: center;"><h1>È¸¿ø Å»Åð</h1></div>
				<img alt="" src="./resources/img/user_delete.PNG">
				<div style="text-align: center;">
					<div>&nbsp;</div>
					<a href=""><button style="font-size: medium;" id="">È¸¿øÅ»Åð</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="infoModify"><button style="font-size: medium;" id="">Ãë¼Ò</button></a>
				</div>
			</div>
			<div class="content col-lg-3 col-md-3 col-sm-3 clearfix"></div>
		</div>
		<!-- end content -->
	</div>
	<!-- end container -->
</section>
<!-- end section -->
<%@include file="../main/footer.jsp"%>