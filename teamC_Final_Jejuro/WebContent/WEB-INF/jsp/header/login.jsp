<%@include file="../main/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
 <section class="post-wrapper-top">
    <div class="container">
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <ul class="breadcrumb">
          <li><a href="home">Home</a></li>
          <li>Login</li>
        </ul>
        <h2>로그인</h2>
      </div>
    </div>
  </section>
  <!-- end post-wrapper-top -->

  <section class="section1">
    <div class="container clearfix">
      <div class="content col-lg-12 col-md-12 col-sm-12 clearfix">
        <div class="col-lg-6 col-md-6 col-sm-12" style="margin-left: 30%">
          <h4 class="title">
                    	<span>회원 로그인</span>
                    </h4>
          <form id="loginform" method="post" name="loginform" action="login" autocomplete=off>
            <div class="form-group">
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="text" name="uuId" id="uuId" class="form-control" placeholder="Username">
              </div>
            </div>
            <div class="form-group">
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" name="uPwd" id="uPwd" class="form-control" placeholder="Password">
              </div>
            </div>
            <div class="form-group">
              <div class="checkbox">
                <label>
									<input type="checkbox"> Remember me
								</label>
              </div>
            </div>
            <div class="form-group">
              <button type="submit" class="button">Sign in</button>
            </div>
          </form>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12">
        
        </div>
        <!-- end login -->
      </div>
      <!-- end content -->
    </div>
    <!-- end container -->
  </section>
  <!-- end section -->
<%@include file="../main/footer.jsp"%>