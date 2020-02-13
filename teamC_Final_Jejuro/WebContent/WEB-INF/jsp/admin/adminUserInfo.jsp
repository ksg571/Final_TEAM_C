<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="sidebar.jsp"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
<div class="col-md-12">
	<div class="card">
            <div class="card-header card-header-warning card-header-icon">
              <div class="card-icon">
                <i class="material-icons">how_to_reg</i>
			</div>
			<h4 class="card-title">회원관리 리스트</h4>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table style="vertical-align: middle;">  
					<tr>     			<td><select name="searchType">
					<option value="0">정렬</option>     
					<option value="1">아이디</option>
					<option value="2">이름</option>
					<option value="3">가입일자</option>
				</select></td></tr>
				</table>         
				<br>
				<table class="w3-table-all w3-hoverable w3-centered">
					<thead>
						<tr class="w3-light-grey">
							<th>회원번호</th>
							<th>아이디</th>   
							<th>비밀번호</th>
							<th>이름</th>
							<th>이메일</th>
							<th>성별</th>    
							<th>전화번호</th>
							<th>가입일</th>
							<th>작업</th>
						</tr>
					</thead>
					<tr>
						<td style="vertical-align: middle">1</td>
						<td style="vertical-align: middle">admin</td>
						<td style="vertical-align: middle"><input type="password" value="test11" ></td>
						<td style="vertical-align: middle"><input type="text" value="관리자" style="width: 80px"></td>
						<td style="vertical-align: middle"><input type="text" value="admin@gmail.com"></td>
						<td style="vertical-align: middle"><input type="text" value="남자" style="width: 80px"></td>
						<td style="vertical-align: middle"><input type="text" value="010-0000-0000" style="width: 120px"></td>
						<td style="vertical-align: middle">20-01-21 14:37</td>
						<td style="vertical-align: middle">
							<button class="w3-button w3-tiny w3-button w3-blue w3-hover-grey">
								<b>수정</b>
							</button>
							<button class="w3-button w3-tiny w3-button w3-red w3-hover-grey">
								<b>탈퇴</b>
							</button>
						</td>
					</tr>
					
					<tr>
						<td style="vertical-align: middle">1</td>
						<td style="vertical-align: middle">admin</td>
						<td style="vertical-align: middle"><input type="password" value="test11"></td>
						<td style="vertical-align: middle"><input type="text" value="관리자" style="width: 80px"></td>
						<td style="vertical-align: middle"><input type="text" value="admin@gmail.com"></td>
						<td style="vertical-align: middle"><input type="text" value="남자" style="width: 80px"></td>
						<td style="vertical-align: middle"><input type="text" value="010-0000-0000" style="width: 120px"></td>
						<td style="vertical-align: middle">20-01-21 14:37</td>
						<td style="vertical-align: middle">
							<button class="w3-button w3-tiny w3-button w3-blue w3-hover-grey">
								<b>수정</b>
							</button>
							<button class="w3-button w3-tiny w3-button w3-red w3-hover-grey">
								<b>탈퇴</b>
							</button>
						</td>
					</tr>
					
					<tr>
						<td style="vertical-align: middle">1</td>
						<td style="vertical-align: middle">admin</td>
						<td style="vertical-align: middle"><input type="password" value="test11"></td>
						<td style="vertical-align: middle"><input type="text" value="관리자" style="width: 80px"></td>
						<td style="vertical-align: middle"><input type="text" value="admin@gmail.com"></td>
						<td style="vertical-align: middle"><input type="text" value="남자" style="width: 80px"></td>
						<td style="vertical-align: middle"><input type="text" value="010-0000-0000" style="width: 120px"></td>
						<td style="vertical-align: middle">20-01-21 14:37</td>
						<td style="vertical-align: middle">
							<button class="w3-button w3-tiny w3-button w3-blue w3-hover-grey">
								<b>수정</b>
							</button>
							<button class="w3-button w3-tiny w3-button w3-red w3-hover-grey">
								<b>탈퇴</b>
							</button>
						</td>
					</tr>
					
				</table>
				<br><br>
				<form action="boardUplist" method="post">
				<table style="margin-left: auto; margin-right: auto;">
				<tr>            
					<th colspan="6" style="color: black;">
							<input type="hidden" name="page" value="${param.page}"> <select
								name="searchType">
								<option value="1">아이디</option>
								<option value="2">이름</option>
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
	$("#site").attr("class","nav-item ng-star-inserted active");         
	$("#maps").attr("class","collapse show");
	$("#site4").attr("class","cnav-item ng-star-inserted active");
});
</script>