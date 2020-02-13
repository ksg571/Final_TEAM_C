<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="sidebar.jsp"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<style>
.h4, h4 {
	font-size: 40px!important;
	margin: 1px 0;
	margin-top: 6px;    
}     bandbroomregisterform
a{
color: #FF8C00
} 

input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type="password"]{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}


input[type=submit] {
  width: 100%;
  background-color: #FF8C00;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.bandbForm{ border-radius: 5px;
  background-color: #F5F5F5;
  padding: 10px;}

</style>   

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
    
<div class="col-md-12">
	<div class="card">
            <div class="card-header card-header-primary card-header-icon">
              <div class="card-icon">
				<i class="material-icons">grade</i>
			</div>
			<h4 class="card-title">방(룸) 등록하기</h4>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				
			
<div class = "bandbForm">
			<form>  
			        <label for="kind">방 이름</label>
				    <select id="kind" name="kind">
					<option value="domitory">이시돌의 집</option>
					<option value="guesthouse">바다</option>
					<option value="hotel">제주감귤</option>
					</select> 
				    
				    <label for="kind">방 개수</label>
				    <input type="text" id="name" name="name" placeholder="방 갯수를 숫자만 입력하세요">
				    
				    
				    <label for="kind">방 가격</label>
				    <input type="text" id="name" name="name" placeholder="방 가격을  숫자만 입력하세요">
	    
					<br><label for="name">인원 수</label>
				    <input type="text" id="tel" name="tel" placeholder="최대 인원 수 를  숫자만 입력하세요">
				    
				    <br><label for="name">룸 사진</label>
				    <input type="file" id="admintel" name="admintel">
				    
				    <br><label for="name">룸 상세정보</label>
				    <input type="text" id="name" name="name" placeholder="룸의 상세 정보를 입력하세요">
                    <br> 
					
				<input type="submit" value="제출">
			</form>
		</div>
	


	<!-- end content -->

	<!-- end container -->

				</table>

			</div>
		</div>
	</div>
</div>

</div>
</div>
</div>

<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample4_roadAddress').value = fullRoadAddr;
            document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guide').innerHTML = '';
            }
        }
    }).open();
}
</script>

<script>
$(document).ready(function() {   
	$("#site").attr("class","nav-item ng-star-inserted active");         
	
});
</script>