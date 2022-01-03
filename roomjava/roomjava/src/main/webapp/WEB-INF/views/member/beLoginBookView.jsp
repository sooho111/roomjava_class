<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>예약 정보</title>
<%@ include file="../include/includeFile.jsp" %>

</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="m_content">
			<p class="order"> 조회 </p>
			<hr>
			<table class="table table-bordered table-hover">
				<thead>
					<tr class="info">
						<th align=center>주문번호</th>
						<th align=center>예약자</th>
						<th align=center>인원수</th>
						<th align=center>주문상태</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="bookView" items="${bookView}">				
						<tr>
							<td align=center>${bookView.book_order}</td>
							<td align=center>${bookView.book_name}</td>
							<td align=center>${bookView.book_people}</td>
							<td class="delivery" align=center>${bookView.book_ok}</td>			
						</tr>
						<input type="hidden" id="book_order" value="${bookView.book_order}"/>
					</c:forEach>
				</tbody>
			</table>
			
			<table class="table table-bordered table-hover orderInfo">
				<c:forEach items="${bookView}" var="bookView" varStatus="status">
					<c:if test="${status.first}">
						<thead>
							<tr class="info">
								<th align=center>예약자</th>
								<th align=center>휴대폰 번호</th>
								<th align=center>인원수</th>
								<th align=center>시작일</th>
								<th align=center>종료일</th>
								<th align=center>방번호</th>
								<th align=center>방종류</th>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td align=center>${bookView.book_name}</td>
								<td align=center>${bookView.book_tel}</td>
								<td align=center>${bookView.book_people}</td>
								<td align=center>${bookView.start_date}</td>
								<td align=center>${bookView.end_date}</td>
								<td align=center>${bookView.r_name}</td>
								<td align=center>${bookView.room_class}</td>
							</tr>
						</tbody>		
					</c:if>
				</c:forEach>
			</table>
			<button type="button" onclick="history.go(-1);" class="btn btn-warning btn-sm">뒤로가기</button>
			<input class="btn btn-danger" type="button" value="예약 취소" id="deleteBook"/>
		</div>
		<%@ include file="../include/footer.jsp" %>
</body>
<script>
$("#deleteBook").click(function(){
    if(confirm("예약을 취소하시겠습니까?")){
        location.href="${path}/member/deletebeBook?book_order="+$("#book_order").val();
    }
});
</script>
</html>