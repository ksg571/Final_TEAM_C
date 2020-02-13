<%@include file="../main/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <section class="post-wrapper-top">
    <div class="container">
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <ul class="breadcrumb">
          <li><a href="index.html">Home</a></li>
          <li>숙박</li>
        </ul>
        <h2>숙박</h2>
      </div>
    </div>
  </section>
  <!-- end post-wrapper-top -->

  <section class="section1">
    <div class="container clearfix">
      <div class=" col-lg-12 col-md-12 col-sm-12 clearfix">

        <div class="divider"></div>

        <nav class="portfolio-filter clearfix">
          <ul><!--- htype 1:호텔 ,2:모텔 ,3:캠핑 ,4:리조트  -->
            <li><a href="#" class="dmbutton2" data-filter="*">종합</a></li>
            <li><a href="#" class="dmbutton2" data-filter=".호텔">호텔</a></li>
            <li><a href="#" class="dmbutton2" data-filter=".모텔">모텔</a></li>
            <li><a href="#" class="dmbutton2" data-filter=".캠핑">캠핑</a></li>
            <li><a href="#" class="dmbutton2" data-filter=".리조트">리조트</a></li>
          </ul>
        </nav>

        <div class="portfolio-centered">
          <div class="recentitems portfolio">
          
                     <c:forEach var="e" items="${list }">
                     
            <div class="portfolio-item col-lg-6 col-md-6 col-sm-6 col-xs-12 ${e.hType}"><!--<<-여기타입  -->
              <div class="he-wrap tpl6 market-item">
                <img src="resources/img/house/${e.hTopImg }" style="width: 500px; height: 300px;">
                <div class="he-view">
                  <div class="bg a0" data-animate="fadeIn">
                    <h3 class="big a1" data-animate="fadeInDown">${e.hName}</h3>
                    <!-- 사진 확대 -->
                    <a data-rel="prettyPhoto" href="resources/img/house/${e.hTopImg }" class="dmbutton a2" data-animate="bounceInLeft">
                    <i class="fa fa-search"></i></a>
                    <!-- 바로가기 -->
                    <a href="housedetail?hNo=${e.hNo}" class="dmbutton a2" data-animate="bounceInRight"><i class="fa fa-link"></i></a>
                    <div class="portfolio_category text-center a2" data-animate="fadeIn">
                      <a href="#"></a>
                    </div>
                    <!-- portfolio_category -->
                  </div>
                  <!-- he bg -->
                </div>
                <!-- he view -->
              </div>
              <!-- he wrap -->
              <h3 class="title">${e.hName}(${e.hType})</h3>
              <p> 주소 : ${e.hAddr1}</p>
            </div>
            
              </c:forEach> 
            <!-- end col-12 -->



          </div>
          <!-- portfolio -->
        </div>
        <!-- portfolio container -->
        <div class="divider"></div>
      </div>
      <!-- end container -->
      </div>
  </section>
  <!-- end section -->

  
<%@include file="../main/footer.jsp"%>