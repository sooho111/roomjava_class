<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/includeFile.jsp" %>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

</style>
</head>
<body>
<%@ include file="../../include/m_header.jsp" %>

	<div class="container">
		<form class="form-horizontal" name ="updateForm" role="form" method="post" action="/admin/payment/paymentUpdate?n=${update.pay_bno }">
			<input type="hidden" name="pay_bno" value="${update.pay_bno}" readonly="readonly"/>
			<div class="form-group">
				<div style="text-align: center; margin: 50px 0;">
					<h5><b>결제항목 수정</b></h5>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">예 금 주</label>
				<div class="col-sm-1">
					<input type="text" class="form-control" name="pay_name" maxlength="20" placeholder="예 금 주" value="${update.pay_name}"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">계 좌 번 호</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="pay_account" maxlength="50" placeholder="계 좌 번 호" value="${update.pay_account}"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">은 행 명</label>
				<div class="col-sm-1">
					<input type="text" class="form-control" name="pay_bank" maxlength="50" placeholder="은 행 명" value="${update.pay_bank}"/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-9">
					<button type="submit" class="btn btn-success update_btn">저장</button>&nbsp;
					<button type="submit" class="btn btn-warning cancel_btn">취소</button>
				</div>
			</div>
		</form>
		
	</div>
	
	<script type="text/javascript">
	$(document).ready(function(){
		
		$(".cancel_btn").on("click", function(){
			event.preventDefault();
			location.href = "/admin/payment/paymentList";
		})
	})
</script>

<%@ include file="../../include/footer.jsp" %>
</body>
</html>