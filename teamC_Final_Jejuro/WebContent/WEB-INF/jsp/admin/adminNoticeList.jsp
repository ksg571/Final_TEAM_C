<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="sidebar.jsp"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
<div class="col-md-12">
	<div class="card">
            <div class="card-header card-header-primary card-header-icon">
              <div class="card-icon">
				<i class="material-icons">grade</i>
			</div>
			<h4 class="card-title">공지사항 리스트</h4>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table style="vertical-align: middle;">      
					<tr>     			
					<td><select name="searchType">
					<option value="0">정렬</option>     
					<option value="1">제목</option>
					<option value="2">날짜</option>
					<option value="3">공개여부</option>
				</select></td>      
				<td style="width: 1450px"></td>
				<td><a href="adminNoticeWrite"><button class="w3-button w3-red">+</button></a></td></tr>
				</table>         
				<br>
				<table class="w3-table-all w3-hoverable w3-centered">
					<thead>
						<tr class="w3-light-grey">
							<th>번호</th>
							<th width="600px">제목</th>
							<th>글쓴이</th>
							<th>날짜</th>
							<th>공개여부</th>
						</tr>
					</thead>
					<tr>
						<td style="vertical-align: middle">1</td>
						<td style="vertical-align: middle"><a href="adminNoticeInfo" style="color: blue">공지사항입니다</a></td>
						<td style="vertical-align: middle"><input type="text" value="관리자" id="aa"></td>
						<td style="vertical-align: middle">20/01/20 10:00</td>
						<td style="vertical-align: middle">
							<button class="w3-button w3-tiny w3-button w3-blue w3-hover-grey" onclick="document.getElementById('id01').style.display='block'">
								<b>공개</b>
							</button>
							<button class="w3-button w3-tiny w3-button w3-red w3-hover-grey">
								<b>비공개</b>
							</button>
						</td>
					</tr>
					<tr>
						<td style="vertical-align: middle">1</td>
						<td style="vertical-align: middle"><a href="adminNoticeInfo" style="color: blue">공지사항입니다</a></td>
						<td style="vertical-align: middle">관리자</td>
						<td style="vertical-align: middle">20/01/20 10:00</td>
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
						<td style="vertical-align: middle"><a href="adminNoticeInfo" style="color: blue">공지사항입니다</a></td>
						<td style="vertical-align: middle">관리자</td>
						<td style="vertical-align: middle">20/01/20 10:00</td>
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
						<td style="vertical-align: middle"><a href="adminNoticeInfo" style="color: blue">공지사항입니다</a></td>
						<td style="vertical-align: middle">관리자</td>
						<td style="vertical-align: middle">20/01/20 10:00</td>
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
						<td style="vertical-align: middle"><a href="adminNoticeInfo" style="color: blue" style="color: blue">공지사항입니다</a></td>
						<td style="vertical-align: middle">관리자</td>
						<td style="vertical-align: middle">20/01/20 10:00</td>
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
<div id="id01" class="w3-modal">

<div class="swal2-container swal2-center swal2-fade swal2-shown"
	style="overflow-y: auto;">
	<div aria-labelledby="swal2-title" aria-describedby="swal2-content"
		class="swal2-popup swal2-modal swal2-show" tabindex="-1" role="dialog"
		aria-live="assertive" aria-modal="true" style="display: flex;">
		<div class="swal2-header">
			<ul class="swal2-progresssteps" style="display: none;"></ul>
			<div class="swal2-icon swal2-error" style="display: none;">
				<span class="swal2-x-mark"><span
					class="swal2-x-mark-line-left"></span><span
					class="swal2-x-mark-line-right"></span></span>
			</div>
			<div class="swal2-icon swal2-question" style="display: none;">
				<span class="swal2-icon-text">?</span>
			</div>
			<div class="swal2-icon swal2-warning swal2-animate-warning-icon"
				style="display: flex;">
				<span class="swal2-icon-text">!</span>
			</div>
			<div class="swal2-icon swal2-info" style="display: none;">
				<span class="swal2-icon-text">i</span>
			</div>
			<div class="swal2-icon swal2-success" style="display: none;">
				<div class="swal2-success-circular-line-left"
					style="background-color: rgb(255, 255, 255);"></div>
				<span class="swal2-success-line-tip"></span> <span
					class="swal2-success-line-long"></span>
				<div class="swal2-success-ring"></div>
				<div class="swal2-success-fix"
					style="background-color: rgb(255, 255, 255);"></div>
				<div class="swal2-success-circular-line-right"
					style="background-color: rgb(255, 255, 255);"></div>
			</div>
			<img class="swal2-image" style="display: none;">
			<h2 class="swal2-title" id="swal2-title">Are you sure?</h2>
			<button type="button" class="swal2-close" style="display: none;">×</button>
		</div>
		<div class="swal2-content">
			<div id="swal2-content" style="display: block;">You will not be
				able to recover this imaginary file!</div>
			<input class="swal2-input" style="display: none;"><input
				type="file" class="swal2-file" style="display: none;">
			<div class="swal2-range" style="display: none;">
				<input type="range">
				<output></output>
			</div>
			<select class="swal2-select" style="display: none;"></select>
			<div class="swal2-radio" style="display: none;"></div>
			<label for="swal2-checkbox" class="swal2-checkbox"
				style="display: none;"><input type="checkbox"></label>
			<textarea class="swal2-textarea" style="display: none;"></textarea>
			<div class="swal2-validationerror" id="swal2-validationerror"
				style="display: none;"></div>
		</div>
		<div class="swal2-actions" style="display: flex;">
			<button type="button" class="swal2-confirm btn btn-success"
				aria-label="" onclick="test()">Yes, delete it!</button>
			<button type="button" class="swal2-cancel btn btn-danger"
				aria-label="" style="display: inline-block;">No, keep it</button>
		</div>
		<div class="swal2-footer" style="display: none;"></div>
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
	$("#site1").attr("class","cnav-item ng-star-inserted active");
	
});
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
function test(){
	this().style.display='none'
	console.log("dd")
	console.log($('#aa').val())
}
</script>