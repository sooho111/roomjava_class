<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<%@ include file="../include/includeFile.jsp" %>
</head>
<body>
<h1>hello</h1>
<div class="m_content">
			<p class="order">예약 정보</p>
			<hr>
			
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
								<td align=center><a href="../member/myBookView?book_order=${bookList.book_order}">${bookList.book_order}</a></td>
								<td align=center>${bookList.book_name}</td>
								<td align=center>${bookList.book_people}</td>
								<td align=center>${bookList.book_ok}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</div>

</body>
</html>