<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약완료</title>
<%@ include file="../include/includeFile.jsp" %>

<style>
.inner { text-align:center; margin:50px 0; }
.preReservation p { font-size:20px; }

</style>

</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="container">
	<div class="inner">
		<div class="preReservation">
			<p>가예약 되었습니다.</p>
			<p>입금이 확인되면 예약완료가 됩니다.</p>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>