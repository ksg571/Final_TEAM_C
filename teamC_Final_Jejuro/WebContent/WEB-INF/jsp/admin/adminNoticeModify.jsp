<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="sidebar.jsp"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link href="resources/lib/bootstrap/css/bootstrap.min2.css"
	rel="stylesheet">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
    
<div class="col-md-12">
	<div class="card">
            <div class="card-header card-header-primary card-header-icon">
              <div class="card-icon">
				<i class="material-icons">grade</i>
			</div>
			<h4 class="card-title">공지사항 수정</h4>
		</div>
		<div class="card-body">
			<div class="table-responsive">
<form action="#" method="post"> 
					<table style="width: 100%">
						
						<tr style="height: 40px;border-top: 1px solid #FF8C00; border-bottom: 1px solid #cccccc">
							<td style="background-color:  #ffddb3; width: 200px"><font color="#ff6666" style="font-weight: bold;">&nbsp;&nbsp;&nbsp;제목</font></td>
							<td style="text-align: center" colspan="3"><input type="text" name="title" style="width: 650px"></td>
						</tr>
						
						<tr style="height: 40px; border-bottom: 1px solid #cccccc;">
						
							<td style="background-color:  #ffddb3 "><font color="#ff6666" style="font-weight: bold;">&nbsp;&nbsp;&nbsp;작성자</font></td>
							<td style="text-align: center;">
								<label>ADMIN</label>
							</td>
						
							<td style="background-color:  #ffddb3 "><font color="#ff6666" style="font-weight: bold;">&nbsp;&nbsp;&nbsp;공개여부</font></td>
							<td style="text-align: center">
							공개&nbsp;&nbsp;<input type="radio" name="private" value="1">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							비공개&nbsp;&nbsp;<input type="radio" name="private" value="0">
							</td>
						</tr>
						
	
						
						<tr style="height: 10px"><td></td></tr>    
						
						<tr>
							<td colspan="4"><div id="summernote" style="width: 100px"></div></td>
						</tr>
						
						<tr><td style="height: 20px">&nbsp;</td></tr>
						
						<tr>
							<td colspan="4" style="text-align: right">
							<input type="submit" value="수정" style="width: 80px; height: 30px">
							&nbsp;
							<input type="reset" value="취소" style="width: 80px; height: 30px"></td>
						</tr>
					
					</table>
				</form>
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

<script>
	$('#summernote').summernote({
		tabsize : 2,
		height : 700
	});
</script>
