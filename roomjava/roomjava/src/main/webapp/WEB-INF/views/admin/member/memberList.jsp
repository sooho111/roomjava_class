<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
<%@ include file="../../include/includeFile.jsp" %>
</head>
<body>
<%@ include file="../../include/m_header.jsp" %>
<div class="container">

	<div class="form-group">
		<h5><b>회원 목록</b></h5>
	</div>
	<form role= "form">
	<table class="table table-bordered table-striped table-hove">
		<thead>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이  름</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>주  소</th>
				<th>생년월일</th>
				<th>권  한</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="member" items="${list}">
			<tr>
				<td class="info"  onclick="location.href='/admin/member/memberDetail/${member.m_bno}'">${member.m_bno}</td>
				<td>${member.m_id}</td>
				<td>${member.m_pwd}</td>
				<td>${member.m_name}</td>
				<td>${member.m_tel}</td>
				<td>${member.m_email}</td>
				<td>${member.m_address}</td>
				<td>${member.m_birth}</td>
				<c:if test="${member.m_power ==2 }"><td>관리자</td> 		</c:if>
				<c:if test="${member.m_power ==3 }"><td>일반 회원</td>	</c:if>
				
				
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</form>
	
	<div align="center" class="col-xs-2 col-sm-2" style="margin-left:170px;">
		
		<select name = "searchType" class="form-control" id='searchType'>
			<option>검색종류</option>
				<option value="id" <c:if test="${pageVO.type} == 'id'">selected</c:if>>아이디</option>
				<option value="name" <c:if test="${pageVO.type} == 'name'">selected</c:if>>이  름</option>
				<option value="birth" <c:if test="${pageVO.type} == 'birth'">selected</c:if>>생년월일</option>
		</select>
	</div>
	<div class="col-xs-10 col-sm-5">
		<div class="input-group">
			<input type="text" name="keyword" id="searchKeyword" value ="${pageVO.keyword}" class="form-control"/>
			<span class="input-group-btn">
				<button id ="searchBtn" type="button" class="btn btn-default">검색</button>
			</span>
		</div>
	</div>

	<div class="col-sm-offset-3 col-sm-4">
		<ul class="btn-group pagination">
		    <c:if test="${pageMaker.prev }">
		    <li>
		        <a href='<c:url value="/admin/member/memberList?page=${pageMaker.startPage-1}"/>'><span class="glyphicon glyphicon-chevron-left"></span></a>
		    </li>
		    </c:if>
		    
		    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
		    <li>
		        <a href='<c:url value="/admin/member/memberList?page=${pageNum}"/>'><i>${pageNum}</i></a>
		    </li>
		    </c:forEach>
		    
		    <c:if test="${pageMaker.next && pageMaker.endPage >0}">
		    <li>
		        <a href='<c:url value="/admin/member/memberList?page=${pageMaker.endPage+1}"/>'><span class="glyphicon glyphicon-chevron-right"></span></a>
		    </li>
		    </c:if>
		</ul>
	</div>
	
	<form id="formList" action="/admin/member/memberList" method="get">
		<input type='hidden' name='page'		value="${result.currentPageNum}">
		<input type='hidden' name='size'		value="${result.currentPage.pageSize}">
		<input type='hidden' name='searchType' 	value="${pageVO.type}">
		<input type='hidden' name='keyword' 	value="${pageVO.keyword}">
	</form>
	
	
</div>

<script>

$(document).ready(function() {
	
	var formObj = $("#formList");
	
	// 검색 버튼을 눌렀을 경우
	$("#searchBtn").click(function(e){
		
		var typeStr = $("#searchType").find(":selected").val();
		var keywordStr = $("#searchKeyword").val();
		
		console.log(typeStr, "" , keywordStr);
		
		//alert("검색 타입" + typeStr);
		//alert("검색 키워드" + keywordStr);
		
		//formObj.find("[name='type']").val(typeStr);
		formObj.find("[name='searchType']").val(typeStr);
		formObj.find("[name='keyword']").val(keywordStr);
		formObj.find("[name='page']").val("1");
		formObj.submit();
	});

});

</script>

</body>

</html>