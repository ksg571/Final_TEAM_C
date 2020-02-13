<%@include file="../main/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<style>
#div1, #div2 {
	float: left;
	width: 100px;
	height: 80px;
	margin: 10px;
	padding: 10px;
	border: 1px solid black;
}

.config_table .t_input {
	height: 29px;
	line-height: 29px;
	border: 1px solid #c8c8ca;
	width: 421px;
	padding-left: 15px;
}
</style>
<section class="post-wrapper-top">
	<div class="container">
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
			<ul class="breadcrumb">
				<li><a href="home">Home</a></li>
				<li>마이페이지</li>
			</ul>
			<h2>정보수정</h2>
		</div>
	</div>
</section>
<!-- end post-wrapper-top -->

<section class="section1">
	<div class="container clearfix">
		<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">
			<div class="clearfix"></div>

			<div class="content col-lg-2 col-md-2 col-sm-2 clearfix"></div>
			<div class="content col-lg-8 col-md-8 col-sm-8">

				<div style="text-align: center;">
					<h2>회원 정보 수정</h2>
				</div>
				<div></div>
				<form>
					<table class="config_table" style="width:100%;">
						<colgroup>
							<col width=250 />
							<col width=* />
						</colgroup>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<tr>
							<th>
								<!--이름-->이름
							</th>
							<td><input type="text" name="name" class="t_input" id="uname"
								value="teamC" /></td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<tr>
							<th>
								<!--이름-->아이디
							</th>
							<td><input type="text" name="id" id="uuid" class="t_input" value="id"
								disabled /></td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<tr>
							<th>
								<!--비밀번호-->비밀번호
							</th>
							<td><a href="" class="pw_reset"> <!--재설정-->비밀번호 재설정
							</a></td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<tr>
							<th>
								<!--이메일 주소-->이메일 주소
							</th>
							<td><input type="text" name="email_address" class="t_input"
								value=" @naver.com" disabled /></td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<tr>
							<th>
								<!--성별-->성별
							</th>
							<td><input type="radio" value="M" name="ugender" id="ugender">&nbsp;여성
								&nbsp;&nbsp; <input type="radio" value="F" name="ugender">&nbsp;남성
								&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						
						<tr>
							<th>
								<!--이름-->전화번호
							</th>
							<td><input type="text" name="uphone" class="t_input" id="uphone"
								value="teamC" /></td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<tr>
							<th>
								<!--이름-->이미지
							</th>
							<td><input type="file" name="uimg" id="uimg"
								value="teamC" /></td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<tr>
							<th>
								<!--이름-->가입일
							</th>
							<td><input type="text" name="udate" class="t_input" id="udate"
								value="2020-01-26" disabled /></td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<tr>
						<td>
							<a href="user_delete">회원탈퇴</a>
						</td>							
						<td style="float: right;">
							<a href="mypage"><button style="font-size: medium;" id="update">변경사항 저장</button></a>
						</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="content col-lg-2 col-md-2 col-sm-2 clearfix"></div>



		</div>
		<!-- end content -->
	</div>
	<!-- end container -->
</section>
<!-- end section -->
<script>
	function allowDrop(ev) {
		ev.preventDefault();
	}

	function drag(ev) {
		ev.dataTransfer.setData("text", ev.target.id);
	}

	function drop(ev) {
		ev.preventDefault();
		var data = ev.dataTransfer.getData("text");
		ev.target.appendChild(document.getElementById(data));
	}
</script>
<%@include file="../main/footer.jsp"%>