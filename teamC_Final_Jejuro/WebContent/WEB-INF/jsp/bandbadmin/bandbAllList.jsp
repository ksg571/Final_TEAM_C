<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="sidebar.jsp"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
<div class="col-md-12">
	<div class="card">
            <div class="card-header card-header-danger card-header-icon">
              <div class="card-icon">
                <i class="material-icons">emoji_people</i>
			</div>
			<h4 class="card-title">숙소 스케줄</h4>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table style="vertical-align: middle;">  
					<tr>     			<td><select name="searchType">
					<option value="0">정렬</option>     
					<option value="1">사용 완료</option>
					<option value="2">입금 대기중</option>
					<option value="3">사용중</option>
					<option value="4">입실 대기중</option>
					<option value="5"></option>
				</select></td></tr>
				</table>         
				<br>
				<table class="w3-table-all w3-hoverable w3-centered">
					<thead>
						<tr class="w3-light-grey">
							<th>번호</th>
							<th>숙소 이름</th>   
							<th>방 이름</th>
							<th>예약자</th>
							<th>예약 인 수</th>
							<th>예약일</th>
							<th>예약인 전화번호</th>
							<th>입금 현황</th>
							<th>사용 현황</th>
						</tr>
					</thead>
					<tr>
						<td style="vertical-align: middle">1</td>
						<td style="vertical-align: middle"><a href="bandbdetail" style="color: blue">이시돌의 집</a></td>
						<td style="vertical-align: middle">성 바오로의 방</td>
						<td style="vertical-align: middle">박민정</td>
						<td style="vertical-align: middle">3</td>
						<td style="vertical-align: middle">20-01-21 14:37</td>
						<td style="vertical-align: middle">010-111-1234</td>
						<td style="vertical-align: middle; color: blue">입금 완료</td>
						<td style="vertical-align: middle; color: blue">퇴실</td>
					</tr> 
					<tr>
						<td style="vertical-align: middle">1</td>
						<td style="vertical-align: middle"><a href="bandbdetail" style="color: blue">이시돌의 집</a></td>
						<td style="vertical-align: middle">성 바오로의 방</td>
						<td style="vertical-align: middle">박건영</td>
						<td style="vertical-align: middle">5</td>
						<td style="vertical-align: middle">20-01-21 14:37</td>
						<td style="vertical-align: middle">010-111-2222</td>
						<td style="vertical-align: middle; color: blue">입금 완료</td>
						<td style="vertical-align: middle; color: red">입실 대기중</td>
					</tr> 
					 
			
				</table>
				<br><br>
				<form action="boardUplist" method="post">
				<table style="margin-left: auto; margin-right: auto;">
				<tr>            
					<th colspan="6" style="color: black;">
							<input type="hidden" name="page" value="${param.page}"> <select
								name="searchType">
								
								<option value="0">검색</option>
								<option value="1">숙소 이름</option>
								<option value="2">방 이름</option>
								<option value="3">예약자</option>
								<option value="4">예약인 전화번호</option>
							</select>&nbsp; <input name="searchValue"> <input type="submit"
								value="검색" style="width: 50px">           
					</th>  
					</tr>   
				</table>
				</form>
			</div>
		</div>
	</div>
</div>

</div>
</div>
</div>


<script>
$(document).ready(function() {   
	$("#hotels").attr("class","nav-item ng-star-inserted active");         
	
});
</script>
</script>