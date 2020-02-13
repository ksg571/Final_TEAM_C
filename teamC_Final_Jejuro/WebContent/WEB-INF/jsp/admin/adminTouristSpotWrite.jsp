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
		<div class="card-header card-header-rose card-header-icon">
			<div class="card-icon">
				<i class="material-icons">terrain</i>
			</div>
			<h4 class="card-title">관광지 등록</h4>
		</div>
		<div class="card-body">
			<div class="table-responsive">
<form action="#" method="post"> 
					<table style="width: 100%">
						
						<tr style="height: 40px;border-top: 1px solid #FF8C00; border-bottom: 1px solid #cccccc">
							<td style="background-color:  #ffddb3; width: 200px"><font color="#ff6666" style="font-weight: bold;">&nbsp;&nbsp;&nbsp;제목</font></td>
							<td style="text-align: center" colspan="3"><input type="text" name="title" style="width: 725px"></td>
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
						
						<tr style="height: 40px; border-bottom: 1px solid #cccccc;">
						
							<td style="background-color:  #ffddb3 "><font color="#ff6666" style="font-weight: bold;">&nbsp;&nbsp;&nbsp;관광지 종류</font></td>
							<td style="text-align: center;">
								<select>
									<option value="1">유람선</option>
									<option value="2">등산</option>
								</select>
							</td>
						
							<td style="background-color:  #ffddb3 "><font color="#ff6666" style="font-weight: bold;">&nbsp;&nbsp;&nbsp;전화번호</font></td>
							<td style="text-align: center">
								<input type="text">
							</td>
						</tr>
						
						<tr style="height: 40px;border-top: 1px solid #FF8C00; border-bottom: 1px solid #cccccc">
							<td style="background-color:  #ffddb3; width: 200px"><font color="#ff6666" style="font-weight: bold;">&nbsp;&nbsp;&nbsp;주소</font></td>
							<td style="text-align: center" colspan="3">
								<input type="text" id="sample5_address" placeholder="주소" style="width: 650px" readonly>
								<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br></td>
						</tr>
						
						<tr style="height: 40px;border-top: 1px solid #FF8C00; border-bottom: 1px solid #cccccc">
							<td style="background-color:  #ffddb3; width: 200px"><font color="#ff6666" style="font-weight: bold;">&nbsp;&nbsp;&nbsp;지도</font></td>
							<td style="text-align: center; height: 330px" colspan="3">
								<div id="map" style="width:1270px;height:350px;margin-top:10px;"></div>
							</td>
						</tr>   
   
						<tr>
							<td colspan="4"><div id="summernote" style="width: 100px"></div></td>
						</tr>
						
						<tr><td style="height: 20px">&nbsp;</td></tr>
						
						<tr>
							<td colspan="4" style="text-align: right">
							<input type="submit" value="작성" style="width: 80px; height: 30px">
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
	$("#site2").attr("class","cnav-item ng-star-inserted active");
});
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fccc5bbbd75f1eda68de2e11f848fb3c&libraries=services"></script>
<script>
    
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(33.507040, 126.492990), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨    
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(33.507040, 126.492990),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>

<script>
	$('#summernote').summernote({
		placeholder : '관광지에 대해 작성해주세요',
		tabsize : 2,
		height : 700
	});
</script>
