<%@include file="../main/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 아이디 중복검사 -->
<script>
	$(function() {
		//회원 아이디 중복 확인!
		$("#idChkBtn").click(function() {
			$.ajax({
				url : "idcheck?uuId=" + $("#uuId").val(),
				success : function(data) {
					if (data == 0) {
						alert("사용가능");
					} else {
						alert("사용중");
					}
				}
			})
		});
	});
</script>
<script>
	function DosignUp() {

		var userid = $("#uuId").val();
		var userpwd = $("#uPwd").val();
		var inputPwdCfm = $("#signUpUserPwdCfm").val();
		var username = $("#uName").val();
		var email = $("#uEmail").val();
		var birth = $("#uBirth").val();
		var phone = $("#uPhone").val();
		var img = $("#uImg").val();

		if (userid.length == 0) {
			alert("아이디를 입력해 주세요");
			$("#userid").focus();
			return false;
		}

		if (userpwd.length == 0) {
			alert("비밀번호를 입력해 주세요");
			$("#userpwd").focus();
			return false;
		} else {
			if (userpwd.length < 8) {
				alert("비밀번호를 8자 이상 입력해주세요");
				$("#userpwd").focus();
				return false;
			}
		}

		if (userpwd != inputPwdCfm) {
			alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요.");
			$("#signUpUserPwd").focus();
			return false;
		}

		if (username.length == 0) {
			alert("이름을 입력해주세요");
			$("#username").focus();
			return false;
		}

		if (email.length == 0) {
			alert("이메일을 입력해주세요");
			$("#email").focus();
			return false;
		}
		if (birth.length == 0) {
			alert("생일을 입력해주세요");
			$("#uBirth").focus();
			return false;
		}
		if (phone.length == 0) {
			alert("핸드폰번호를 입력해주세요");
			$("#uPhone").focus();
			return false;
		}
		if (confirm("회원가입을 하시겠습니까?")) {
			alert("회원가입을 축하합니다");
			return true;
		}

	}
</script>
<section class="post-wrapper-top">
	<div class="container">
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
			<ul class="breadcrumb">
				<li><a href="home">Home</a></li>
				<li>Register</li>
			</ul>
			<h2>회원가입</h2>
		</div>
	</div>
</section>
<!-- end post-wrapper-top -->

<section class="section1">
	<div class="container clearfix">
		<div class="content col-lg-12 col-md-12 col-sm-12 clearfix"
			style="margin-left: 20%">
			<div class="col-lg-4 col-md-4 col-sm-12">
				<h4 class="title">
					<span style="margin-left: 80px; font-size: 30px">이용약관</span>
				</h4>
				<ul class="check">
					<li><a href="#">회원필수 입력사항 : 아이디,비밀번호,이름</a></li>
					<li><a href="#">회원가입시 여행플랜 기능을 사용할 수 있습니다.</a></li>
					<li><a href="#">이용 약관 동의</a></li>
					<li><a href="#">개인 정보 수집 및 이용에 대한 동의</a></li>
					<li><a href="#">위치정보 이용약관 동의</a></li>
				</ul>
			</div>
			<!-- end login -->

			<div class="col-lg-4 col-md-4 col-sm-12">
				<h4 class="title">
					<span style="font-size: 30px; margin-left: 80px;">회원가입</span>
				</h4>
				<form id="register" method="post" name="registerform"
					onsubmit="return DosignUp();" action="register"
					enctype="multipart/form-data">
					<div class="form-group">
						<input type="text" name="uuId" id="uuId" class="form-control"
							placeholder="아이디"> &nbsp;<input type="button" id="idChkBtn"
							class="button" value="중복확인">
					</div>
					<input type="hidden" id="target" class="">
					<div class="form-group">
						<input type="password" name="uPwd" id="uPwd" class="form-control"
							placeholder="비밀번호 (8자 이상)">
					</div>
					<div class="form-group">
						<input type="password" name="signUpUserPwdCfm"
							id="signUpUserPwdCfm" class="form-control" placeholder="비밀번호확인">
					</div>
					<div class="form-group">
						<input type="text" name="uName" id="uName" class="form-control"
							placeholder="이름">
					</div>
					<div class="form-group">
						<input type="text" name="uBirth" id="uBirth" class="form-control"
							placeholder="주민번호(001107)">
					</div>
					<div class="form-group">
						<input type="email" name="uEmail" id="uEmail" class="form-control"
							placeholder="이메일(kosmo@kosmo.co.kr)">
					</div>
					<div class="form-group">
						<select name="uGender" class="form-control">
							<option value="M">남자</option>
							<option value="F">여자</option>
						</select>
					</div>
					<div class="form-group">
						<input type="text" id="uPhone" name="uPhone" class="form-control"
							placeholder="전화번호(000-0000-0000)">
					</div>
					<div class="form-group">
						사용자이미지 : 미선택시 기본이미지로 등록됩니다.
						<input multiple="multiple" type="file" id="userImg"
							name="userImg">
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-lg btn-success btn-block"
							value="가입">
					</div>
				</form>
			</div>
			<!-- end register -->
		</div>
		<!-- end content -->
	</div>
	<!-- end container -->
</section>
<!-- end section -->

<%@include file="../main/footer.jsp"%>