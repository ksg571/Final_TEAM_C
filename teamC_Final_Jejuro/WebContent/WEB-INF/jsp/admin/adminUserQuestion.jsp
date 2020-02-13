<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="sidebar.jsp"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
<div class="col-md-12">
	<div class="card">
           <div class="card-header card-header-success card-header-icon">
             <div class="card-icon">
               <i class="material-icons">local_post_office</i>
			</div>
			<h4 class="card-title">회원문의 리스트</h4>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table style="vertical-align: middle;">  
					<tr>     			<td><select name="searchType">
					<option value="0">정렬</option>     
					<option value="1">제목</option>
					<option value="2">날짜</option>
					<option value="2">상태</option>
				</select></td><td colspan="3"></td></tr>
				</table>         
				<br>
				<table class="w3-table-all w3-hoverable w3-centered"> 
					<thead>
						<tr class="w3-light-grey">
							<th>번호</th>
							<th>유저명</th>
							<th>제목</th>
							<th>날짜</th>
							<th>상태</th>
						</tr>
					</thead>
					<tr>
						<td style="vertical-align: middle">1</td>
						<td style="vertical-align: middle">hong</td>
						<td style="vertical-align: middle"><a href="adminUserQuestionChk" onClick="window.open(this.href, '', 'width=600, height=580'); return false;"><font style="color:blue">싸이트운영에대해</font></a></td>
						<td style="vertical-align: middle">20/01/20 10:00</td>
						<td style="vertical-align: middle"><font style="color : red">미처리</font></td>
					</tr>
					<tr>
						<td style="vertical-align: middle">1</td>
						<td style="vertical-align: middle">hong</td>
						<td style="vertical-align: middle"><a href="adminUserQuestionChk" onClick="window.open(this.href, '', 'width=600, height=580'); return false;"><font style="color:blue">싸이트운영에대해</font></a></td>
						<td style="vertical-align: middle">20/01/20 10:00</td>
						<td style="vertical-align: middle"><font style="color : blue">처리</font></td>
					</tr>
					<tr>
						<td style="vertical-align: middle">1</td>
						<td style="vertical-align: middle">hong</td>
						<td style="vertical-align: middle"><a href="adminUserQuestionChk" onClick="window.open(this.href, '', 'width=600, height=580'); return false;"><font style="color:blue">싸이트운영에대해</font></a></td>
						<td style="vertical-align: middle">20/01/20 10:00</td>
						<td style="vertical-align: middle"><font style="color : red">미처리</font></td>
					</tr>
					<tr>
						<td style="vertical-align: middle">1</td>
						<td style="vertical-align: middle">hong</td>
						<td style="vertical-align: middle"><a href="adminUserQuestionChk" onClick="window.open(this.href, '', 'width=600, height=580'); return false;"><font style="color:blue">싸이트운영에대해</font></a></td>
						<td style="vertical-align: middle">20/01/20 10:00</td>
						<td style="vertical-align: middle"><font style="color : blue">처리</font></td>
					</tr>
					<tr>
						<td style="vertical-align: middle">1</td>
						<td style="vertical-align: middle">hong</td>
						<td style="vertical-align: middle"><a href="adminUserQuestionChk" onClick="window.open(this.href, '', 'width=600, height=580'); return false;"><font style="color:blue">싸이트운영에대해</font></a></td>
						<td style="vertical-align: middle">20/01/20 10:00</td>
						<td style="vertical-align: middle"><font style="color : red">미처리</font></td>
					</tr>
					<tr>
						<td style="vertical-align: middle">1</td>
						<td style="vertical-align: middle">hong</td>
						<td style="vertical-align: middle"><a href="adminUserQuestionChk" onClick="window.open(this.href, '', 'width=600, height=580'); return false;"><font style="color:blue">싸이트운영에대해</font></a></td>
						<td style="vertical-align: middle">20/01/20 10:00</td>
						<td style="vertical-align: middle"><font style="color : blue">처리</font></td>
					</tr>
				</table>
				<br><br>     
				<form action="boardUplist" method="post">
				<table style="margin-left: auto; margin-right: auto;">
				<tr>            
					<th colspan="6" style="color: black;">
							<input type="hidden" name="page" value="${param.page}"> <select
								name="searchType">
								<option value="1">작성자</option>
								<option value="2">제목</option>
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
	$("#UserQuestion").attr("class","nav-item active");
});
</script>