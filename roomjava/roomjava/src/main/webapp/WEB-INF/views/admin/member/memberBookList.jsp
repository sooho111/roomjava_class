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
<style type="text/css">
.container { margin-top:70px; margin-bottom:70px; }
.info { cursor:pointer; }
</style>
</head>
<body>
<%@ include file="../../include/m_header.jsp" %>

<div class="container">

	<div class="form-group">
		<h5><b>회원 예약 목록</b></h5>
	</div>
	<form role= "form">
	<table class="table table-bordered table-striped table-hove">
		<thead>
			<tr>
				<th>예약번호</th>
				<th>예약자이름</th>
				<th>예약인원</th>
				<th>예약자 전화번호</th>
				<th>예약상태</th>
				<th>예약시작일자</th>
				<th>예약종료일자</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="List" items="${memberBookList}">	
				<tr>
					<td class="info" align=center><a href="../member/memberBookView?book_order=${List.book_order}">${List.book_order}</a></td>
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
	</form>

</div>	


</body>
</html>