<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/includeFile.jsp" %>
<title>예약정보</title>

</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="m_content">
			<p class="order">예약 정보</p>
			<hr>
			<c:if test="${bookList == '[]' }">
				<p class="order">예약 정보가 없습니다.</p>
				<button type="button" onclick="history.go(-1);" >Cancel</button>
			</c:if>
			
			<c:if test="${bookList != '[]' }">
				<table class="table table-hover table-bordered">
					<thead>
						<tr class="info">
							<th>주문번호</th>
							<th>예약자 이름</th>
							<th>예약 인원</th>
							<th>상태</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="bookList" items="${bookList}">		
							<tr>
								<td align=center><a href="../member/beLoginBookView?book_order=${bookList.book_order}">${bookList.book_order}</a></td>
								<td align=center>${bookList.m_name}</td>
								<td align=center>${bookList.book_people}</td>
								<td align=center>${bookList.book_ok}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</c:if>
				<button type="button" onclick="history.go(-1);" class="btn btn-warning btn-sm">뒤로가기</button>
			</div>
		<%@ include file="../include/footer.jsp" %>
</body>
</html>