<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ETC List</title>
<%@ include file="../../include/includeFile.jsp" %>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
.container { margin-top:70px; margin-bottom:70px; }
.btnss { margin-bottom:50px; }
.payment { font-size:20px; margin-bottom:30px; }
</style>
</head>
<body>
<%@ include file="../../include/m_header.jsp" %>
<div class="container">
			
		<div class="form-group">
			<div style="text-align: center; margin: 50px 0;">
				<h5><b>기본 기능</b></h5>
			</div>
		</div>	

		<form role= "form" method="get">
		
			<table class="table table-bordered table-striped table-hove">
				<thead>
					<tr>
						<th>기능 번호</th>
						<th>기능 이름</th>
						<th>기능 가격</th>
					</tr>
				</thead>
				
				<c:forEach items="${list}" var = "list">
					<tr>
						<td><a href="/admin/etc/fncUpdate?n=${list.fnc_bno}"><c:out value="${list.fnc_bno}" /></a></td>
						<td><c:out value="${list.fnc_name}" /></td>
						<td><c:out value="${list.fnc_price}" /></td>
					</tr>
				</c:forEach>
				
			</table>
			
			<div class="form-group btnss">
				<div align="right" class="col-sm-offset-3">
					<button type="button" class="btn btn-success btn-sm" onclick="location.href='fncInsert'">기본 기능 추가</button>
				</div>
			</div>
		</form>
</div>	
<div class="container">
			
		<div class="form-group">
			<div style="text-align: center; margin: 50px 0;">
				<h5><b>대여 기능</b></h5>
			</div>
		</div>	

		<form role= "form" method="get">
		
			<table class="table table-bordered table-striped table-hove">
				<thead>
					<tr>
						<th>대여 번호</th>
						<th>대여 이름</th>
						<th>대여 비용</th>
					</tr>
				</thead>
				
				<c:forEach items="${list2}" var = "list">
					<tr>
						<td><a href="/admin/etc/rentUpdate?n=${list.rent_bno }"><c:out value="${list.rent_bno}" /></a></td>
						<td><c:out value="${list.rent_name}" />	</td>
						<td><c:out value="${list.rent_price}" /></td>
					</tr>
				</c:forEach>
				
			</table>
			
			<div class="form-group btnss">
				<div align="right" class="col-sm-offset-3">
					<button type="button" class="btn btn-success btn-sm" onclick="location.href='rentInsert'">대여 기능 추가</button>
				</div>
			</div>
		</form>
	</div>	
</body>
</html>