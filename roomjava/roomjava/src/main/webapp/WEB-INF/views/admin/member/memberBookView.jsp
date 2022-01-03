<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 예약 상세 정보</title>
	<%@ include file="../../include/includeFile.jsp" %>
<style type="text/css">
.container { margin-top:70px; margin-bottom:70px; }
.info { cursor:pointer; }
</style>
</head>
<body>
<%@ include file="../../include/m_header.jsp" %>


<section class="container">

	<div class="form-group">
		<h5><b>회원 예약 상세 정보</b></h5>
	</div>
	<div id="container_box">
		<div class="memberBookView">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>방번호</th>
						<th>예약자이름</th>
						<th>예약인원</th>
						<th>예약자 전화번호</th>
						<th>예약상태</th>
						<th>예약시작일자</th>
						<th>예약종료일자</th>
						<th>입금 계좌</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="View" items="${memberBookView}">				
						<tr>
						<td align=center>${View.room_class}, ${View.r_name}호 </td>
						<td align=center>${View.m_name}</td>
						<td align=center>${View.book_people}</td>
						<td align=center>${View.book_tel}</td>
						<td align=center>${View.book_ok}</td>
						<td align=center>${View.start_date}</td>
						<td align=center>${View.end_date}</td>
						<td align=center>${View.payment}</td>
						</tr>
						
					</c:forEach>
					
				</tbody>
			</table>
		</div>	
		<div>
		<c:forEach var="View" items="${memberBookView}">	
		<div class="bookOkChange">
							<form role="form" action="/admin/member/memberBookView" method="post" class="bookOkForm">
								<input type="hidden" name="book_order" value="${View.book_order}" />
								<input type="hidden" name="book_ok" class="book_ok" value="" />
							</form>
							
							<button type="button" class="btn btn-info book_ok1_btn">예약 확정</button>
							<button type="button" class="btn btn-success book_ok2_btn">입실 중</button>
							<button type="button" class="btn btn-danger book_ok3_btn">퇴실 완료</button>
						</div>	
		</c:forEach>
		</div>
	</div>
</section>




</body>
<script>

$(".book_ok1_btn").click(function(){
	$(".book_ok").val("예약 확정");
	$(".bookOkForm").submit();
});

$(".book_ok2_btn").click(function(){
	$(".book_ok").val("입실 중");
	$(".bookOkForm").submit();
});

$(".book_ok3_btn").click(function(){
	$(".book_ok").val("퇴실 완료");
	$(".bookOkForm").submit();
});


</script>
</html>