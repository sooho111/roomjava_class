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
</head>
<body>
<%@ include file="../../include/m_header.jsp" %>


<section class="container">
	<div id="container_box">
		<div class="memberBookView">
			<table class="table table-bordered table-hover">
				<thead>
					<tr class="info">
				<td align=center width=20>방번호</td>
				<td align=center width=30>예약자이름</td>
				<td align=center width=5>예약인원</td>
				<td align=center width=11>예약자 전화번호</td>
				<td align=center width=20>예약상태</td>
				<td align=center width=20>예약시작일자</td>
				<td align=center width=20>예약종료일자</td>
			</tr>
				</thead>
				
				<tbody>
					<c:forEach var="View" items="${memberBookView}">				
						<tr>
						<td align=center>${View.r_bno}</td>
						<td align=center>${View.book_name}</td>
						<td align=center>${View.book_people}</td>
						<td align=center>${View.book_tel}</td>
						<td align=center>${View.book_ok}</td>
						<td align=center>${View.start_date}</td>
						<td align=center>${View.end_date}</td>
						</tr>
						
		
								
					</c:forEach>
					<div class="bookOkChange">
						<form role="form" action="/admin/member/memberBookView" method="post" class="bookOkForm">
							<input type="hidden" name="book_order" value="${View.book_order}" />
							<input type="hidden" name="book_ok" class="book_ok" value="" />
						</form>
						
						<button type="button" class="btn btn-info book_ok1_btn">예약 확정</button>
						<button type="button" class="btn btn-success book_ok2_btn">입실 중</button>
						<button type="button" class="btn btn-danger book_ok3_btn">퇴실 완료</button>
					</div>							
				</tbody>
			</table>
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