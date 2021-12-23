<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 예약 목록</title>
	<%@ include file="../../include/includeFile.jsp" %>
</head>
<body>
<%@ include file="../../include/m_header.jsp" %>

<div class="container">
	
	<table class="table table-bordered table-hover">
		<thead>
			<tr class="info">
				<td align=center width=20>예약번호</td>
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
			<c:forEach var="List" items="${memberBookList}">	
				<tr>
					<td align=center><a href="../member/memberBookView?book_order=${List.book_order}">ㅎㅎ</a></td>
					<td align=center>${List.r_bno}</td>
					<td align=center>${List.book_name}</td>
					<td align=center>${List.book_people}</td>
					<td align=center>${List.book_tel}</td>
					<td align=center>${List.book_ok}</td>
					<td align=center>${List.start_date}</td>
					<td align=center>${List.end_date}</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

</div>	


</body>
</html>