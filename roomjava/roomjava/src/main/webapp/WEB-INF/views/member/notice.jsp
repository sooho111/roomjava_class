
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice List</title>
<%@ include file="../include/includeFile.jsp" %>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
	<div class="container_con" style="margin-left:3%">
		
		
		<section id="container">
			
			
			
			<hr />
			
			<form role= "form" method="get">
				<table class="table table-hover">
					<thead>
						<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th></tr>
					</thead>
					
					<c:forEach items="${list}" var = "list">
						<tr>
							<td><c:out value="${list.notice_bno}" /></td>
							<td>
								<a href="/member/noticeDetail?n=${list.notice_bno }"><c:out value="${list.notice_title}" /></a>
							</td>
							<td>관리자</td>
							<td><fmt:formatDate value="${list.notice_date}" pattern="yyyy년MM월dd일"/></td>
						</tr>
					</c:forEach>
				</table>
				
				<div class="search row">
					<div class="col-xs-2 col-sm-2" style="margin-left:170px;">
						<select name = "searchType" class="form-control">
							<option value ="n" <c:out value = "$(scri.seachType == null ? 'selected' : '')"/>>---선택---</option>
							<option value ="title" <c:out value = "$(scri.seachType eq 't' ? 'selected' : '')"/>>제목</option>
							<option value ="content" <c:out value = "$(scri.seachType eq 'c' ? 'selected' : '')"/>>내용</option>
						</select>
					</div>
					
					<div class="col-xs-10 col-sm-5">
						<div class="input-group">
							<input type="text" name="keyword" id="keywordInput" value ="${scri.keyword}" class="form-control"/>
							<span class="input-group-btn">
								<button id ="searchBtn" type="button" class="btn btn-default">검색</button>
							</span>
						</div>
					</div>
				</div>
				
  				<div class="col-md-offset-3">
				  	<ul class="pagination">
					    <c:if test="${pageMaker.prev}">
					    	<li><a href="notice${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					    </c:if>
						
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					 		<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }" />>   
					    	<a href="notice${pageMaker.makeSearch(idx)}">${idx}</a></li>
					    </c:forEach>
						
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    	<li><a href="notice${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if>
			  		</ul>
				</div>
			</form>
		</section>
		

	</div>
					
					<script>
						$(function(){
							$('#searchBtn').click(function(){
								self.location = "noticeList?searchType=" +$("select option:selected").val() +"&keyword="+$("[name=keyword]").val()
							});
						});
					</script>
</body>
</html>