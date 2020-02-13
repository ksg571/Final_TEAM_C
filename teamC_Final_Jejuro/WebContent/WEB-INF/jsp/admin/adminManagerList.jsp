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
			<h4 class="card-title">숙박업자 리스트</h4>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table style="vertical-align: middle;">  
					<tr>     			<td><select name="searchType">
					<option value="0">정렬</option>     
					<option value="1">아이디</option>
					<option value="2">이름</option>
					<option value="3">가입일자</option>
					<option value="4">승인상태</option>
				</select></td></tr>
				</table>         
				<br>
				<table class="w3-table-all w3-hoverable w3-centered">
					<thead>
						<tr class="w3-light-grey">
							<th>번호</th>   
							<th>아이디</th>   
							<th>비밀번호</th>
							<th>이름</th> 
							<th>전화번호</th>
							<th>가입일</th> 
							<th>관리업소</th>
							<th>작업1</th>
							<th>작업2</th>
						</tr>
					</thead>
					<tr>
						<td style="vertical-align: middle">1</td>
						<td style="vertical-align: middle">Manager</td>
						<td style="vertical-align: middle"><input type="password" value="test11" style="width: 80px"></td>
						<td style="vertical-align: middle"><input type="text" value="홍두민" style="width: 70px"></td>
						<td style="vertical-align: middle"><input type="text" value="010-0000-0000" style="width: 120px"></td>
						<td style="vertical-align: middle">20-01-21 14:37</td>
						<td style="vertical-align: middle"><a href="adminManagerHotelList" onClick="window.open(this.href, '', 'width=600, height=580'); return false;" style="color: blue">보기</a></td>
						<td style="vertical-align: middle">  
							<button class="w3-button w3-tiny w3-button w3-blue w3-hover-grey">
								<b>승인</b>
							</button>
							<button class="w3-button w3-tiny w3-button w3-red w3-hover-grey">
								<b>거절</b>
							</button>
						</td>
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
						<td style="vertical-align: middle">2</td>
						<td style="vertical-align: middle">Manager22</td>
						<td style="vertical-align: middle"><input type="password" value="test11" style="width: 80px"></td>
						<td style="vertical-align: middle"><input type="text" value="김두환" style="width: 70px"></td>
						<td style="vertical-align: middle"><input type="text" value="010-9999-1111" style="width: 120px"></td>
						<td style="vertical-align: middle">20-01-21 14:37</td>
						<td style="vertical-align: middle"><a href="adminManagerHotelList" onClick="window.open(this.href, '', 'width=600, height=580'); return false;" style="color: blue">보기</a></td>
						<td style="vertical-align: middle">  
							<button class="w3-button w3-tiny w3-button w3-blue w3-hover-grey">
								<b>승인</b>
							</button>
							<button class="w3-button w3-tiny w3-button w3-red w3-hover-grey">
								<b>거절</b>
							</button>
						</td>
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
						<td style="vertical-align: middle">3</td>
						<td style="vertical-align: middle">Manager33</td>
						<td style="vertical-align: middle"><input type="password" value="test11" style="width: 80px"></td>
						<td style="vertical-align: middle"><input type="text" value="강사준" style="width: 70px"></td>
						<td style="vertical-align: middle"><input type="text" value="010-0000-0000" style="width: 120px"></td>
						<td style="vertical-align: middle">20-01-21 14:37</td>
						<td style="vertical-align: middle"><a href="adminManagerHotelList" onClick="window.open(this.href, '', 'width=600, height=580'); return false;" style="color: blue">보기</a></td>
						<td style="vertical-align: middle">  
							<button class="w3-button w3-tiny w3-button w3-blue w3-hover-grey">
								<b>승인</b>
							</button> 
							<button class="w3-button w3-tiny w3-button w3-red w3-hover-grey">
								<b>거절</b>
							</button>
						</td>
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
	$("#hotels").attr("class","nav-item ng-star-inserted active");         
	$("#forms").attr("class","collapse show");
	$("#hotels1").attr("class","cnav-item ng-star-inserted active");
});
</script>