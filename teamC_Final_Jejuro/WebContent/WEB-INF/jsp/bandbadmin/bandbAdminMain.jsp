<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@include file="sidebar.jsp"%>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
          <div class="row">    
            <div class="col-lg-3 col-md-6 col-sm-6" >
              <div class="card card-stats" style="box-shadow : 0 4px 10px 0">
                <div class="card-header card-header-warning card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">how_to_reg</i>
                  </div>
                  <p class="card-category" style="color:#fb8c00">예약신청</p>
                  <h3 class="card-title">5   
                    <small>명</small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons text-danger">warning</i>
                    <a href="#pablo">Get More Space...</a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats" style="box-shadow : 0 4px 10px 0">
                <div class="card-header card-header-success card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">local_post_office</i>
                  </div>
                  <p class="card-category" style="color:#43a047">문의사항 대기</p>
                  <h3 class="card-title">10
                  	<small>건</small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons">date_range</i> Last 24 Hours
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats" style="box-shadow : 0 4px 10px 0">
                <div class="card-header card-header-danger card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">emoji_people</i>
                  </div>
                  <p class="card-category" style="color:#e53935">등록된 숙소</p>
                  <h3 class="card-title">3
                 	 <small>건</small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons">local_offer</i> Tracked from Github
                  </div>
                </div>
              </div>
            </div>
            <!-- <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="card card-stats" style="box-shadow : 0 4px 10px 0">
                <div class="card-header card-header-info card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">hotel</i>
                  </div>
                  <p class="card-category" style="color:#00acc1">숙박업소 승인대기</p>
                  <h3 class="card-title">24  
                  	<small>건</small>    
                  </h3>
                </div>    
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons">update</i> Just Updated
                  </div>
                </div>
              </div>
            </div> -->
          </div>     
                                   
		<div class="card" style="width: 1630px; height: 600px; box-shadow : 0 4px 10px 0">
        	<div class="card-header card-header-icon card-header-rose">
        		<div class="card-icon">
        			<i class="material-icons">insert_chart</i>  
        		</div>    
        		<h4 class="card-title">Multiple Bars Chart
        			<small>- Bar Chart</small>
        		</h4>  
        	</div>                    
        	<div class="card-body">    
        		<canvas id="calender" height="100px" style="height: 100px"></canvas>
        	</div>          
        </div>            
		              
        </div>         
    </div>
  </div>
  
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> -->
<link rel="stylesheet" type="text/css" href="/css/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="/css/fullcalendar.min.css" />
<script type="text/javascript" src="<c:url value='/js/fullcalendar.min.js'/>"></script>

<script type="text/javascript">

$(function(){
 calendarEvent();
});

function calendarEvent(eventData){
 $("#calender").html("");
 var date = new Date();
 var d = date.getDate();
 var m = date.getMonth();
 var y = date.getFullYear();
 var calendar = $('#calender').fullCalendar({
  header: {
   left: "",
   center: "title",
//    right: "month,basicWeek,basicDay"
   right: "today prev,next"
   },
   editable: true,
   titleFormat: {
   month: "yyyy년 MMMM",
   week: "[yyyy] MMM dd일{ [yyyy] MMM dd일}",
   day: "yyyy년 MMM d일 dddd"
   },
   allDayDefault: false,
   defaultView: "month",
   editable: false,
   monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
   monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
   dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
   dayNamesShort: ["일","월","화","수","목","금","토"],
   buttonText: {
   today : "오늘",
   month : "월별",
   week : "주별",
   day : "일별",
   },
   events : eventData,
   timeFormat : "HH:mm",
 });
</script>



<script>
$(document).ready(function() {   
	$("#main").attr("class","nav-item active");
});
</script>