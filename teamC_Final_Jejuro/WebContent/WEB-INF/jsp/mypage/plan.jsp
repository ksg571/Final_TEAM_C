<%@include file="../main/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<style type="text/css">
<!--
여행정보 style -->#myinfo {
	font-size: 15px;
	font-weight: bond;
	color: black;
}

#plan2 {
	margin-left: 20px;
	margin-bottom: 5px;
	width: 40px;
	height: 40px;
}

<!--
icon 크기 -->#plan {
	width: 35px;
	height: 35px;
}

<!--
ul에 . 안보이기 -->ul {
	list-style: none;
}

<!--
일정표 style -->.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #eee;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #eee;
}

.tg .tg-jiqj {
	font-weight: bold;
	font-size: 16px;
	background-color: black;
	color: white;
	border-color: #eee;
	text-align: center;
	vertical-align: top
}

.tg .tg-ruqc {
	font-weight: bold;
	font-size: 18px;
	background-color: black;
	color: white;
	border-color: #eee;
	text-align: center;
	vertical-align: top
}

.tg .tg-6888 {
	font-size: 18px;
	background-color: #FFF5EE;
	color: #000000;
	border-color: #eee;
	text-align: center;
	vertical-align: top
}

.tg .tg-ii8n {
	font-size: 16px;
	background-color: #FFF5EE;
	border-color: #eee;
	text-align: center;
	vertical-align: top
}
</style>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<!-- w3.css modal -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- drag and drop 함수 -->
<script>
	function drag(event) { //dragstart
		event.dataTransfer.setData("text", event.target.id);
		event.dataTransfer.effectAllowed = "copy";
		scroll: true, clone = event.target.cloneNode(true);
		cloneId = event.target.getAttribute("text");
		clone.className += ' ' + 'text';
		console.log(event.dataTransfer.effectAllowed)

	}

	function allowDrop(event) { // dragover
		event.dataTransfer.dropEffect = "copy";
		console.log(event.dataTransfer.dropEffect)
		event.preventDefault();
	}

	function drop(event) { //drop
		var i = 0;
		event.dataTransfer.dropEffect = "copy";
		event.preventDefault();
		//선택된 요소 복제(자식요소까지)해서 drop 영역에 drop해줄거야 
		var data = event.dataTransfer.getData("text");
		var clone = document.getElementById(data).cloneNode(true);

		//옮겨진 애는 못 옮기게 하자 draggable="false"
		//그대신 x표 만들어야 되나 아..
		clone.setAttribute("draggable", "false");
		clone.setAttribute("id", "drag" + i);
		i++;
		event.target.closest(".tg-ii8n").append(clone);
		console.log(event.dataTransfer.dropEffect)
	}
	//동적으로 생성된 요소에 이벤트 적용하기
	$(document).on("click", ".close", function() {

		if (confirm("삭제하시겠습니까?")) {
			//closest() : 셀렉터로 잡히는 상위 요소 중 가장 근접한 하나 반환해줌
			console.log("this name : " + $(this).parents("a").value)
			console.log("this name : " + $(this).closest("a").value)
			console.log("this name : " + $(this).parents("a").value)
			console.log("this name : " + $(this).closest("a").value)
			console.log("this name : " + this.value)
			$(this).closest("a").fadeOut(100);
		} else {
			// 취소 버튼 클릭 시 동작
		}

	});
</script>

<div>
	<!-- 제일 큰 div 시작-->
	<div class="modal-body"
		style="width: 1650px; height: 1500px; margin-left: 10%;">
		<!-- drag and drop 전체 div 시작-->
		<div style="width: 710px; height: 1470px; float: left;">
			<!-- 여행정보, 숙박 div 시작 -->
			<div style="width: 350px; float: left;">
				<!-- 여행정보 시작 -->
				<h3>
					<img alt="" id="plan"
						src="resources/img/plan_icon/icons8-popular-man-50.png"><a>여행정보</a>
				</h3>
				<div
					style="width: 300px; height: 310px; background: #FFE4B5; border-radius: 18px; margin-top: 10px; overflow-y: auto;">
					<br>
					<div class="tab-content">
						<div class="tab-pane active" id="div1" ondrop="drop(event)"
							ondragover="allowDrop(event)">
							<ul>
								<li>
									<div>
										<img alt="" id="plan2"
											src="resources/img/plan_icon/icons8-title.png"><span
											id="myinfo">제목&nbsp;&nbsp; </span><span>${plist.mTitle}</span>
									</div>
								</li>
								<li>
									<div>
										<img alt="" id="plan2"
											src="resources/img/plan_icon/icons8-planner-64.png"><span
											id="myinfo">시작일&nbsp;&nbsp; </span><span>${plist.startDate}</span>
									</div>
								</li>
								<li>
									<div>
										<img alt="" id="plan2"
											src="resources/img/plan_icon/icons8-planner-64.png"><span
											id="myinfo">종료일&nbsp;&nbsp; </span><span>${plist.endDate}</span>
									</div>
								</li>
								<li>
									<div>
										<img alt="" id="plan2"
											src="resources/img/plan_icon/icons8-people-50.png"><span
											id="myinfo">인원수&nbsp;&nbsp; </span>${plist.mPeople}명
									</div>
								</li>
								<li>
									<div>
										<img alt="" id="plan2"
											src="resources/img/plan_icon/icons8-multicultural-people-50.png"><span
											id="myinfo">일행&nbsp;&nbsp; </span><span>${plist.mWith}</span>
									</div>
								</li>
								<li>
									<div>
										<img alt="" id="plan2"
											src="resources/img/plan_icon/icons8-title-50.png"><span
											id="myinfo">여행테마&nbsp;&nbsp; </span><span>${plist.mTheme}</span>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 여행정보 끝-->
				<!-- 내가예약한숙박 시작 -->
				<h3>
					<img alt="" id="plan"
						src="resources/img/plan_icon/icons8-reception-50.png"><a>내가예약한숙박</a>
				</h3>
				<div
					style="width: 300px; height: 230px; background: #FFF5EE; border-radius: 18px; margin-top: 10px; overflow-y: auto;">

					<div class="tabbable">
						<div class="tab-content">
							<div class="tab-pane active" id="recent">
								<ul class="recent_posts">
									<br>
									<c:forEach var="e" items="${rlist}">
									<li><a href="#" draggable="true" ondragstart="drag(event)"
										id="drag1">${e.hName}<span class="close">&times;</span></a><img
											src="resources/img/recent_post_01.png" alt="" id="plan" />
									<p>${e.hAddr1}${e.rName }</p>
									<a class="readmore">예약인원수 : ${e.rPeople }</a></li>
									<hr>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- 내가예약한숙박 끝 -->
				<!-- 내가찜한숙박 시작 -->
				<h3>
					<img alt="" id="plan"
						src="resources/img/plan_icon/icons8-house-80.png"><a>내가찜한숙박</a>
				</h3>
				<div
					style="width: 300px; height: 300px; background: #FFF5EE; border-radius: 18px; margin-top: 10px; overflow-y: auto;">

					<div class="tabbable">
						<br>
						<div class="tab-content">
							<div class="tab-pane active" id="recent2">
								<ul class="recent_posts">
								<c:forEach var="e" items="${hplist }">
									<li><a href="#" draggable="true" ondragstart="drag(event)"
										id="drag30"> ${e.hName }<span class="close">&times;</span></a>
										<img src="resources/img/house/${e.hTopImg}" alt="" id="plan" style="height: 60px"/>
										<p class="readmore">${e.hType }</p></li>
									<hr>
								</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- 내가찜한숙박 끝 -->
				<div
					style="width: 300px; height: 150px; background: #FFF5EE; border-radius: 18px; margin-top: 10px;">
					<div class="tabbable">
						<div class="w3-container">
							<h3>
								<button
									onclick="document.getElementById('id01').style.display='block'"
									class="w3-button">
									<img alt="" id="plan"
										src="resources/img/plan_icon/icons8-money-80.png">
								</button>
								<a>여행가계부</a>
							</h3>
							<div id="id01" class="w3-modal">
							<form action="add_money" method="post">
								<div class="w3-modal-content"
									style="width: 360px; height: 375px;">
									<header class="w3-container w3-teal">
										<span
											onclick="document.getElementById('id01').style.display='none'"
											class="w3-button w3-display-topright">&times;</span>
										<h2>가계부</h2>
									</header>
									<div class="w3-container">
										<br>
										<table>
											<tr>
												<td><img alt="" id="plan2"
													src="resources/img/plan_icon/icons8-airplane-take-off-50.png">항공기</td>
												<td><input type="text" id="" name="airplane"></td>
											</tr>
											<tr>
												<td><img alt="" id="plan2"
													src="resources/img/plan_icon/icons8-transportation-50.png">교통</td>
												<td><input type="text" id="" name="transportaion"></td>
											</tr>
											<tr>
												<td><img alt="" id="plan2"
													src="resources/img/plan_icon/icons8-hotel-50.png">숙소예약</td>
												<td><input type="text" id="" name="reser"></td>
											</tr>
											<tr>
												<td><img alt="" id="plan2"
													src="resources/img/plan_icon/icons8-street-food-50.png">음식</td>
												<td><input type="text" id="" name="food"></td>
											</tr>
											<tr>
												<td><img alt="" id="plan2"
													src="resources/img/plan_icon/icons8-ticket-64.png">입장료</td>
												<td><input type="text" id="" name="tiket"></td>
											</tr>
											<tr>
												<td><img alt="" id="plan2"
													src="resources/img/plan_icon/icons8-inscription-50.png">기타</td>
												<td><input type="text" id="" name="etc"></td>
											</tr>
										</table>
									</div>
									<footer class="w3-container w3-teal" style="height: 40px;">
										<input type="submit" value="등록" class="btn btn-primary"
											style="float: right; background-color: black; margin-top: 2px;" />
									</footer>
									
								</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 여행정보, 숙박 div 끝-->

			<!-- 검색, 관광지 div 시작 -->
			<div style="width: 350px; float: left;">
				<!-- 통합검색 시작 -->
				<h3>
					<img alt="" id="plan"
						src="resources/img/plan_icon/icons8-search-64.png"><a>통합
						검색</a>
				</h3>
				<div
					style="width: 300px; height: 300px; background: #FFF5EE; border-radius: 18px; margin-top: 10px; overflow-y: auto;">
					<br>
					<div class="plan_info_box nleft">
						<div class="info_select">
							<input type="text" class="" placeholder="검색하세요"
								style="width: 80%; margin-left: 20px;" id="total_budget_amount">
						</div>
						<br>
					</div>
					<div class="tab-content">
						<div class="tab-pane active" id="div1" ondrop="drop(event)"
							ondragover="allowDrop(event)">
							<ul class="recent_posts">
								<li><a href="#" draggable="true" ondragstart="drag(event)"
									id="drag5"> 숙소이름<span class="close">&times;</span></a><img src="resources/img/recent_post_01.png"
									alt="" id="plan" /></li>
								<hr>
								<li><a href="#" draggable="true" ondragstart="drag(event)"
									id="drag6"> 관광지이름<span class="close">&times;</span></a><img
									src="resources/img/recent_post_02.png" alt="" id="plan" /></li>
								<hr>
							</ul>
						</div>
					</div>
				</div>
				<!-- 통합검색 끝 -->
				<!-- 내가찜한관광지 시작 -->
				<h3>
					<img alt="" id="plan"
						src="resources/img/plan_icon/icons8-camper-80.png"><a>내가찜한관광지</a>
				</h3>
				<div
					style="width: 300px; height: 942px; background: #FFF5EE; border-radius: 18px; margin-top: 10px; overflow-y: scroll;">

					<div class="tabbable">
						<br>
						<div class="tab-content">
							<div class="tab-pane active" id="recent2">
								<ul class="recent_posts">
									<c:forEach var="e" items="${ tplist}">
									<li><a href="#" draggable="true" ondragstart="drag(event)"
										id="drag7"> ${ e.tName}<span class="close">&times;</span></a><img
										src="resources/img/tourspot/${e.tTopImg }" alt="" id="plan" style="height: 60px"/>
										<p class="readmore">${e.tType }</p></li>
									<hr>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- 내가찜한관광지 끝-->
			</div>
			<!-- 검색, 관광지 div 끝-->
		</div>
		<!-- drag and drop 전체 div 끝-->

		<!-- 지도, 일정표 div 시작 -->
		<div style="width: 780px; height: 1480px; float: left;">
			<!-- 지도API -->
			<h3>
				<img alt="" id="plan"
					src="resources/img/plan_icon/icons8-map-marker-64.png"><a>지도</a>
			</h3>
			<div id="map"
				style="width: 750px; height: 350px; background-color: skyblue; margin-top: 10px;">
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8b2b3fa7a88682f73a72b57b119c70c3"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
					mapOption = {
						center : new kakao.maps.LatLng(33.380965, 126.536057), // 지도의 중심좌표
						level : 10
					// 지도의 확대 레벨
					};

					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

					// 마커를 표시할 위치와 title 객체 배열입니다 
					var positions = [ {
						title : '우도',
						latlng : new kakao.maps.LatLng(33.501140, 126.951368)
					}, {
						title : '제주국제공항',
						latlng : new kakao.maps.LatLng(33.507080, 126.492860)
					}, {
						title : '텃밭',
						latlng : new kakao.maps.LatLng(33.450879, 126.569940)
					}, {
						title : '근린공원',
						latlng : new kakao.maps.LatLng(33.451393, 126.570738)
					} ];

					// 마커 이미지의 이미지 주소입니다
					var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

					for (var i = 0; i < positions.length; i++) {

						// 마커 이미지의 이미지 크기 입니다
						var imageSize = new kakao.maps.Size(24, 35);

						// 마커 이미지를 생성합니다    
						var markerImage = new kakao.maps.MarkerImage(imageSrc,
								imageSize);

						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
							map : map, // 마커를 표시할 지도
							position : positions[i].latlng, // 마커를 표시할 위치
							title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
							image : markerImage
						// 마커 이미지 
						});
					}
				</script>

			</div>
			<!-- 지도API -->
			<!-- 일정표 시작 -->
			<h3>
				<img alt="" id="plan"
					src="resources/img/plan_icon/icons8-schedule-50.png"><a>일정표</a>
			</h3>
			<div style="width: 750px; height: 940px; margin-top: 10px;">
				<%
					int num1 = Integer.parseInt(request.getParameter("num"));
				%>
				<table class="tg" border="1"
					style="table-layout: fixed; width: 750px; height: 910px; border: 1px solid;">
					<tr>
						<th class="tg-ruqc" style="width: 130px">시간</th>
						<%
							for (int i = 1; i < num1 + 1; i++) {
						%>
						<th class="tg-jiqj"><%=i%>일차</th>
						<%
							}
						%>
					</tr>
					<%
						for (int j = 5; j <= 23; j++) {
					%>
					<tr>
						<td class="tg-6888"><%=j%>:00</td>
						<%
							for (int i = 0; i < num1; i++) {
						%>
						<td class="tg-ii8n" id="div2" ondrop="drop(event)"
							ondragover="allowDrop(event)"></td>
						<%
							}
						%>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<!-- 일정표 시작 -->
		</div>
		<!-- 지도, 일정표 div 끝 -->
	</div>
	<!-- 제일 큰 div 끝-->
	<div style="text-align: center;">
		<input class="button small" type="button" value="취소"> <input
			class="button small" type="button" value="저장">
	</div>
</div>
<!-- end section -->
<%@include file="../main/footer.jsp"%>