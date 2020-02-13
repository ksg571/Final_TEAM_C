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
                  <p class="card-category" style="color:#fb8c00">총 회원수</p>
                  <h3 class="card-title">100,000   
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
                  <p class="card-category" style="color:#e53935">숙박업자 승인대기</p>
                  <h3 class="card-title">5
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
            <div class="col-lg-3 col-md-6 col-sm-6">
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
            </div>
          </div>   
          
         <div class="card" style="width: 1000px; height: 600px; box-shadow : 0 4px 10px 0; float: left">
        	<div class="card-header card-header-icon card-header-primary">
        		<div class="card-icon">
        			<i class="material-icons">apartment</i>  
        		</div>    
        		<h4 class="card-title">등록된 숙박업체
        			<small>- 제주도</small>
        		</h4>  
        	</div>                    
        	<div class="card-body">    
				<div id="map" style="width:100%;height:100%; margin-top: 0px"></div>
        	</div>          
        </div>       
                         
       <div class="card" style="width: 582px; height: 600px; box-shadow : 0 4px 10px 0; margin-left: 1030px">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">숙박업체 상세보기</h4>
                  <p class="card-category">지도의 마커를 클릭하면 해당 업체의 상세보기가 가능합니다</p>
                </div>                       
        	<div class="card-body">    
<!-- AJAX처리할곳        	
                     <table class="table">
                      <tbody>
                      	<tr>
                          <td class="text-primary">종류</td>
                          <td>숙박</td>    
                        </tr>
                        <tr>
                          <td class="text-primary">업체이름</td>
                          <td>빠레트</td>    
                        </tr>
                        <tr>
                          <td class="text-primary">관리자아이디</td>
                          <td>hong123</td> 
                        </tr>
                        <tr>
                          <td class="text-primary">주소</td>
                          <td>제주특별자치도</td> 
                        </tr>
                        <tr>
                          <td class="text-primary">전화번호</td>
                          <td>010-9692-5209</td> 
                        </tr>
                      </tbody>    
                    </table> --> 
                    <p style="margin-top: 220px; margin-left: 190px; font-size: 15px">지도의 마커를 클릭해주세요</p>       
        	</div>          
        </div>   
                      
		<div class="card" style="width: 1615px; height: 600px; box-shadow : 0 4px 10px 0; margin-top: 60px">
        	<div class="card-header card-header-icon card-header-rose">
        		<div class="card-icon">
        			<i class="material-icons">insert_chart</i>  
        		</div>    
        		<h4 class="card-title">Multiple Bars Chart
        			<small>- Bar Chart</small>     
        		</h4>  
        	</div>                                
        	<div class="card-body">    
        		<canvas id="myChart" height="100px" style="height: 100px"></canvas>
        	</div>          
        </div>            
		              
        </div>         
    </div>
  </div>
  
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
var ctx = document.getElementById('myChart').getContext('2d');
var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'bar',

    // The data for our dataset
    data: {
        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
        datasets: [{
            label: 'My First dataset',
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: [0, 10, 5, 2, 20, 30, 45]
        }]
    },

    // Configuration options go here
    options: {}
});
</script>

<script>
$(document).ready(function() {   
	$("#main").attr("class","nav-item active");
});
</script>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fccc5bbbd75f1eda68de2e11f848fb3c&libraries=services"></script>
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(33.378922, 126.534310), // 지도의 중심좌표
    level: 10 // 지도의 확대 레벨
};   
  
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
{
    content: '<div>제주국제공항</div>', 
    latlng: new kakao.maps.LatLng(33.504724, 126.493655)
},
{
    content: '<div>라온빌리지</div>', 
    latlng: new kakao.maps.LatLng(33.341343, 126.278416)
},
{
    content: '<div>한라산 국립공원</div>', 
    latlng: new kakao.maps.LatLng(33.392053, 126.494821)
},
{
    content: '<div>우도 119지역센터</div>',
    latlng: new kakao.maps.LatLng(33.502165, 126.953610)
},
{
    content: '<div>마라도 성당</div>', 
    latlng: new kakao.maps.LatLng(33.1157089,126.2670024)
}
];

for (var i = 0; i < positions.length; i ++) {
// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[i].latlng // 마커의 위치
});

// 마커에 표시할 인포윈도우를 생성합니다 
var infowindow = new kakao.maps.InfoWindow({
    content: positions[i].content // 인포윈도우에 표시할 내용
});

// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
// 이벤트 리스너로는 클로저를 만들어 등록합니다 
// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
return function() {
    infowindow.open(map, marker);
};
}

//인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
return function() {
    infowindow.close();
};
}
	
</script>