<%@include file="../main/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<style>
input.img-button {
	background: url( "resources/img/kakaopay.jpg" ) no-repeat;
	border: none;
	margin-left: 25%;
	width: 344px;
	height: 144px;
	cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	$(function () {
		$("#inlineCheckbox1").click(function () {
			console.log("111");
			var IMP = window.IMP; // ��������
			IMP.init('imp69352987');
			// 'iamport' ��� �ο����� "������ �ĺ��ڵ�"�� ���
			// i'mport ������ ������ -> ������ -> �������ĺ��ڵ�
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0���� ����.
				/*
				'kakao':īī������,
				html5_inicis':�̴Ͻý�(��ǥ�ذ���)
				'nice':���̽�����
				'jtnet':����Ƽ��
				'uplus':LG���÷���
				'danal':�ٳ�
				'payco':������
				'syrup':�÷�����
				'paypal':������
				 */
				pay_method : 'card',
				/*
				'samsung':�Ｚ����,
				'card':�ſ�ī��,
				'trans':�ǽð�������ü,
				'vbank':�������,
				'phone':�޴����Ҿװ���
				 */
				merchant_uid : 'merchant_' + new Date().getTime(),
				/*
				merchant_uid�� ���
				https://docs.iamport.kr/implementation/payment
				���� url�� ���󰡽ø� ���� �� �ִ� ����� �ֽ��ϴ�.
				�����ϼ���.
				���߿� ������ �غ��Կ�.
				 */
				name : $('#hName').text() + '_' + $('#rName').text(),
				//����â���� ������ �̸�
				amount : $('#pPrice').val(),
				//����

				buyer_email : $('#email').val(),
				buyer_name : $('#lname').val(),
				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			/*
			����� ������,
			������ ������ �����Ǵ� URL�� ����
			(īī������, ������, �ٳ��� ���� �ʿ����. PC�� ���������� callback�Լ��� ����� ������)
			 */
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '�Ϸ��ư�� �����ּ���\n';
					msg += '����ID : ' + rsp.imp_uid+'\n';
					msg += '���� �ŷ�ID : ' + rsp.merchant_uid+'\n';
					msg += '���� �ݾ� : ' + rsp.paid_amount+'\n';
					msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num+'\n';
				} else {
					var msg = '������ �����Ͽ����ϴ�.';
					msg += '�������� : ' + rsp.error_msg;
				}
				alert(msg);
			});
			location.href="add_pay";
			
		});

	
	
		$('#cancle').click(function() {
			var rvNo = $('#rvNo').val();
			console.log(rvNo);

			if (confirm("�����Ͻðڽ��ϱ�?") == true) {
				console.log(rvNo);
				alert("��ҵǾ����ϴ�.");
				location.href = "del_res?rvNo=" + rvNo;
			} else {
				return;
			}
		});

	});
</script>
<section class="post-wrapper-top">
	<div class="container">
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
			<ul class="breadcrumb">
				<li><a href="home">Home</a></li>
				<li>Checkout</li>
			</ul>
			<h2>�����ϱ�</h2>
		</div>
	</div>
</section>
<!-- end post-wrapper-top -->

<section class="section1">
	<div class="container clearfix" style="margin-left: 30%">
		<div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix">

			<h5 class="title">������ ����</h5>

			<form id="personalinfo" action="add_pay" name="personalinfo" method="post" ">
				<label for="lname">������ ����<span class="required">*</span>
				</label> <input type="text" name="lname" id="lname" class="form-control" value="${sessionScope.uName}" disabled="disabled"> <label
					for="email">������ �̸��� �ּ� </label> <input type="text" name="name"
					id="email" class="form-control" value="${sessionScope.uEmail}">
				<label for="lname">��������<span class="required">*</span>
				</label> <input type="text" name="lname" id="lname" class="form-control"
					value="${rlist.startDate }" disabled="disabled"> <label
					for="lname">�������� <span class="required">*</span>
				</label> <input type="text" name="lname" id="lname" class="form-control"
					value="${rlist.endDate }" disabled="disabled">

				<div class="clearfix"></div>
				<div class="divider"></div>
				<table class="table table-striped checkout" data-effect="fade">
					<thead>
						<tr>
							<th>���� ���</th>
							<th>�� ����</th>
							<th>�� ����</th>
							<th>�ο���</th>
							<th>�����ϼ�</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="hName"><img src="resources/img/room/${rlist.rImg }"
								alt="" style="width: 100px">${rlist.hName }</td>
							<td id="rName">${rlist.rName }</td>
							<td id="">${rlist.rPrice }</td>
							<td id="">${rlist.rvPeople }</td>
							<td id="">${sessionScope.day}(��)</td>
						</tr>
					</tbody>
				</table>
				<div class="clearfix"></div>

				<div class="clearfix"></div>

				<div class="well text-right">
					TOTAL:<input type="text" id="pPrice" name="pPrice"
						disabled="disabled" value="${sessionScope.want}">(��) <input
						type="hidden" id="rvNo" name="rvNo" value="${rlist.rvNo }">
					<input type="hidden" name="uNo" value="${sessionScope.uNo }">
				</div>

				<div class="clearfix"></div>
				<div class="divider"></div>



				<h5 class="title">�����������</h5>
				<div id="type" style="text-align: center;">
					<label class="checkbox-inline"> <input id="inlineCheckbox1"
						type="radio" name="pType" value="a"> <strong>�ſ�ī��</strong>
					</label> <label class="checkbox-inline"> <input
						id="inlineCheckbox2" type="radio" name="pType" value="b">
						<strong>�������</strong>
					</label>
				</div>
				<div id="card" style="display: none;">
					<button id="check_module" type="button">���� ����Ʈ ���� ��� �׽�Ʈ�غ���22</button>
				</div>
				<div class="clearfix"></div>
				<div class="divider"></div>



				<div style="text-align: center;">
					<h5 class="title"></h5>
					<input type="button" id="cancle" class="button" value="���">
					<input type="submit"  class="button" value="�Ϸ�">
				</div>
			</form>
		</div>
		<!-- end content -->
	</div>
	<!-- end container -->
</section>
<!-- end section -->
<%@include file="../main/footer.jsp"%>