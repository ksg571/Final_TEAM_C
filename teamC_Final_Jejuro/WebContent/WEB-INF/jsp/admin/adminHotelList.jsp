<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="sidebar.jsp"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
<div class="col-md-12">
	<div class="card">
		<div class="card-header card-header-info card-header-icon">
			<div class="card-icon">
				<i class="material-icons">hotel</i>
			</div>
			<h4 class="card-title">숙박업소 리스트</h4>
		</div>
		<div class="card-body">  
			<div class="table-responsive">
				<table style="vertical-align: middle;">  
					<tr>     			<td><select name="searchType">
					<option value="0">정렬</option>     
					<option value="1">숙박업소명</option>
					<option value="2">등록날짜</option>
					<option value="3">승인여부</option>
					<option value="3">공개여부</option>
					<option value="4">지역</option>
				</select></td><td colspan="3"></td></tr>
				</table>         
				<br>
				<table class="w3-table-all w3-hoverable w3-centered">
					<thead>
						<tr class="w3-light-grey">
							<th>번호</th>
							<th>숙소종류</th>
							<th>이름</th>
							<th>주소</th>
							<th>전화번호</th>
							<th>관리자</th>
							<th>작업1</th>
							<th>작업2</th>
						</tr>
					</thead>
					<tr>
						<td style="vertical-align: middle">1</td>
						<td style="vertical-align: middle">숙박</td>
						<td style="vertical-align: middle"><a href="#"><font color="blue">빠레트</font></a></td>
						<td style="vertical-align: middle">제주특별자치도</td>
						<td style="vertical-align: middle">010-9692-5209</td>
						<td style="vertical-align: middle">아이디명</td>
						<td style="vertical-align: middle">
							<button class="w3-button w3-tiny w3-button w3-blue w3-hover-grey">
								<b>승인</b>
							</button>
							<button class="w3-button w3-tiny w3-button w3-red w3-hover-grey">
								<b>거부</b>
							</button>
						</td>
						<td style="vertical-align: middle">
							<button class="w3-button w3-tiny w3-button w3-blue w3-hover-grey">
								<b>공개</b>
							</button>
							<button class="w3-button w3-tiny w3-button w3-red w3-hover-grey">
								<b>비공개</b>
							</button>
						</td>
					</tr>
					<tr>
						<td style="vertical-align: middle">1</td>
						<td style="vertical-align: middle">숙박</td>
						<td style="vertical-align: middle"><a href="#"><font color="blue">빠레트</font></a></td>
						<td style="vertical-align: middle">제주특별자치도</td>
						<td style="vertical-align: middle">010-9692-5209</td>
						<td style="vertical-align: middle">아이디명</td>
						<td style="vertical-align: middle">
							<button class="w3-button w3-tiny w3-button w3-blue w3-hover-grey">
								<b>승인</b>
							</button>
							<button class="w3-button w3-tiny w3-button w3-red w3-hover-grey">
								<b>거부</b>
							</button>
						</td>
						<td style="vertical-align: middle">
							<button class="w3-button w3-tiny w3-button w3-blue w3-hover-grey">
								<b>공개</b>
							</button>
							<button class="w3-button w3-tiny w3-button w3-red w3-hover-grey">
								<b>비공개</b>
							</button>
						</td>
					</tr>
					<tr>
						<td style="vertical-align: middle">1</td>
						<td style="vertical-align: middle">숙박</td>
						<td style="vertical-align: middle"><a href="#"><font color="blue">빠레트</font></a></td>
						<td style="vertical-align: middle">제주특별자치도</td>
						<td style="vertical-align: middle">010-9692-5209</td>
						<td style="vertical-align: middle">아이디명</td>
						<td style="vertical-align: middle">
							<button class="w3-button w3-tiny w3-button w3-blue w3-hover-grey">
								<b>승인</b>
							</button>
							<button class="w3-button w3-tiny w3-button w3-red w3-hover-grey">
								<b>거부</b>
							</button>
						</td>
						<td style="vertical-align: middle">
							<button class="w3-button w3-tiny w3-button w3-blue w3-hover-grey">
								<b>공개</b>
							</button>
							<button class="w3-button w3-tiny w3-button w3-red w3-hover-grey">
								<b>비공개</b>
							</button>
						</td>
					</tr>
					<tr>
						<td style="vertical-align: middle">1</td>
						<td style="vertical-align: middle">숙박</td>
						<td style="vertical-align: middle"><a href="#"><font color="blue">빠레트</font></a></td>
						<td style="vertical-align: middle">제주특별자치도</td>
						<td style="vertical-align: middle">010-9692-5209</td>
						<td style="vertical-align: middle">아이디명</td>
						<td style="vertical-align: middle">
							<button class="w3-button w3-tiny w3-button w3-blue w3-hover-grey">
								<b>승인</b>
							</button>
							<button class="w3-button w3-tiny w3-button w3-red w3-hover-grey">
								<b>거부</b>
							</button>
						</td>
						<td style="vertical-align: middle">
							<button class="w3-button w3-tiny w3-button w3-blue w3-hover-grey">
								<b>공개</b>
							</button>
							<button class="w3-button w3-tiny w3-button w3-red w3-hover-grey">
								<b>비공개</b>
							</button>
						</td>
					</tr>
					
					<tr>
						<td style="vertical-align: middle">1</td>
						<td style="vertical-align: middle">숙박</td>
						<td style="vertical-align: middle"><a href="#"><font color="blue">빠레트</font></a></td>
						<td style="vertical-align: middle">제주특별자치도</td>
						<td style="vertical-align: middle">010-9692-5209</td>
						<td style="vertical-align: middle">아이디명</td>
						<td style="vertical-align: middle">
							<button class="w3-button w3-tiny w3-button w3-blue w3-hover-grey">
								<b>승인</b>
							</button>
							<button class="w3-button w3-tiny w3-button w3-red w3-hover-grey">
								<b>거부</b>
							</button>
						</td>
						<td style="vertical-align: middle">
							<button class="w3-button w3-tiny w3-button w3-blue w3-hover-grey">
								<b>공개</b>
							</button>
							<button class="w3-button w3-tiny w3-button w3-red w3-hover-grey">
								<b>비공개</b>
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
								<option value="1">숙박업소명</option>
								<option value="2">지역</option>
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
	$("#hotels2").attr("class","cnav-item ng-star-inserted active");
});
</script>