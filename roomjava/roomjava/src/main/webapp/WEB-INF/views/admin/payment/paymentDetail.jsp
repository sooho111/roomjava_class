<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<%@ include file="../../include/includeFile.jsp" %>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

</style>
</head>
<body>
<%@ include file="../../include/m_header.jsp" %>

	<div class="container">
		<form class="form-horizontal" name="readForm" method="post">
		<input type="hidden" id="pay_bno" name="pay_bno" value="${detail.pay_bno}" />
			
			<div class="form-group">
				<div style="text-align: center; margin: 50px 0;">
					<h5><b>결제 사항 정보</b></h5>
				</div>
			</div>			
			<div class="form-group">
				<label for="title" class="control-label col-sm-2">예 금 주</label>
				<div class="col-sm-1">
					<input class="form-control" type="text" id="pay_name" name="pay_title" style="background:#EEE;" maxlength="50"  value="${detail.pay_name}" readonly="readonly"  />
				</div>
			</div>
			
			
			<div class="form-group">
				<label for="repDate" class="control-label col-sm-2">계 좌 번 호</label>
				<div class="col-sm-2">
					<input class="form-control" type="text" name="pay_account"  value="${detail.pay_account}" readonly="readonly" style="cursor:text" />
				</div>
			</div>
			
			<div id="form-group" class="form-group">
				<label for="content" class="control-label col-sm-2">은 행 명</label>
				<div class="col-sm-1">
					<input type="text" class="form-control" name="pay_bank" maxlength="50" value="${detail.pay_bank}" readonly="readonly"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-9">
					<button type ="button" class="btn btn-primary" onclick="location.href='paymentUpdate?n=${detail.pay_bno}'" >수정</button>&nbsp;
					<button type="button" class="btn btn-danger" onclick="location.href='paymentDelete?n=${detail.pay_bno}'" >삭제</button>
				</div>
			</div>
			
			
		</form>
	</div>
				<%@ include file="../../include/footer.jsp" %>
</body>
</html>