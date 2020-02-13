<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search bar animation</title>
<link href='https://fonts.googleapis.com/css?family=Roboto:400,500'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel='stylesheet prefetch'
	href='http://fonts.googleapis.com/css?family=Palanquin:400,100,200,300'>
<link rel="stylesheet" href="resources/search/css/style.css">
</head>
<body>
	<div><img src="resources/img/dolgarbang.png" style="float:left;height: 100%;width: 20%"></div>
	<div><img src="resources/img/dolgarbang.png" style="float:right;height: 100%;width: 20%"></div>
	<form id="content" method="post" action="totalsearch?page=1">
	<div>
		<input type="text" name="input" class="input">
		<button type="reset" class="search"></button><br>
	</div>
	</form>
	<ul id = "ranklist" style = "width: 200px; text-align: center;margin-top: 5%;margin-left:47%"></ul>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="resources/search/js/index.js"></script>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script>
	$(function() {
		$('body').hide();
		$('body').fadeIn(2000);
	});

	$(function() {

		function loadSearchRank() {
			$.ajax({dataType : "json",
					url : "searchrank",
					data : {},
					success : function(data) {
						console.log("진입은하니2");
						console.log(data);
						var items = [];
							items.push('<p style = "color: rgb(10,10,10);">추천검색어</p>');
							$.each(data,function(k, recommend) {
												//items.push('<p class = "clist">'+recommend.data+'</p>');
												items.push('<p><a href = "totalsearch?input='
														+ encodeURI(recommend.data,"EUC-KR")
														+ '&page=1"style = "text-decoration: none; color: rgb(240,240,240);">'
														+ recommend.data
														+ '</a></p>');
											});
							$('#ranklist').html(items.join(''));
							$('#ranklist').delay(2000).show();
					}
				});
			}
			$('.search').on('focus',function() {loadSearchRank()
				$('.search').on('keyup', function() {
					if ($(this).val() == "")
						loadSearchRank()
				})
				});
		});
</script>
</html>