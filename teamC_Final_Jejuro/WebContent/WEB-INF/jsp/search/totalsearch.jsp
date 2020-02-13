<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="../main/header.jsp"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.table {
	border-collapse: collapse;
	border-top: 3px solid #168;
	width: 50%;
	margin-left: 495px;
}

.table th {
	color: #168;
	background: #f0f6f9;
	text-align: center;
}

.table th, .table td {
	padding: 10px;
	border: 1px solid #ddd;
}

.table th:first-child, .table td:first-child {
	border-left: 0;
}

.table th:last-child, .table td:last-child {
	border-right: 0;
}

.table tr td:first-child {
	text-align: center;
}

.table caption {
	caption-side: bottom;
	display: none;
}

h3 {
	margin-left: 42%;
}

</style>
</head>
<body>
	<h3>찾으시는 "${search}" 검색 결과입니다.</h3>
	<table class="table">
		<tr>
			<th>제목</th>
			<th>타입</th>
			<th>이미지</th>
		</tr>
		<c:forEach var="e" items="${list}">
			<tr>
				<c:choose>
				<c:when test="${e.atype eq '하우스'}">
				<td><a href="housedetail?hNo=${e.hno}">${e.hname}</a></td>
				<td>${e.htype}</td>
				<td><img src="resources/img/house/${e.htopimg}" style="margin-left: 130px;width: 500px;height: 200px;"></td>
				</c:when>
				<c:when test="${e.atype  eq '관광지'}">
				<td><a href="tourdetail?hNo=${e.hno}">${e.hname}</a></td>
				<td>${e.htype}</td>
				<td><img src="resources/img/tourspot/${e.htopimg}" style="margin-left: 130px;width: 500px;height: 200px;"></td>
				</c:when> 
				</c:choose>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="3"><%@include file="page_totalsearch.jsp"%></td>
		</tr>
	</table>
</body>
</html>
<%@include file="../main/footer.jsp"%>