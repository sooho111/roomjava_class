<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<%@ include file="../../include/includeFile.jsp" %>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
.container { margin-top:70px; margin-bottom:70px; }
.btnss { margin-bottom:50px; }
.notice { font-size:20px; margin-bottom:30px; }
</style>
</head>
<body>
<%@ include file="../../include/m_header.jsp" %>
<div class="container">
		
	<div class="form-group">
		<div style="text-align: center; margin: 50px 0;">
			<h5><b>공지사항</b></h5>
		</div>
	</div>	

	<form role= "form" method="get">
	
		<table class="table table-bordered table-striped table-hove">
			<thead>
				<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th></tr>
			</thead>
			
			<c:forEach items="${list}" var = "list">
				<tr>
					<td><c:out value="${list.notice_bno}" /></td>
					<td>
						<a href="/admin/board/noticeDetail?n=${list.notice_bno }"><c:out value="${list.notice_title}" /></a>
					</td>
					<td>관리자</td>
					<td><fmt:formatDate value="${list.notice_date}" pattern="yyyy년MM월dd일 HH:mm:ss"/></td>
				</tr>
			</c:forEach>
			
		</table>
		
		<div class="form-group btnss">
			<div align="right" class="col-sm-offset-3">
				<button type="button" class="btn btn-success btn-sm" onclick="location.href='noticeInsert'">글 작 성</button>
			</div>
			
		
		<div>
			<div align="center" class="col-xs-2 col-sm-2" style="margin-left:300px;">
				<select name = "searchType" class="form-control">
					<option value ="n" <c:out value = "$(scri.seachType == null ? 'selected' : '')"/>>---선택---</option>
					<option value ="notice_title" <c:out value = "$(scri.seachType eq 't' ? 'selected' : '')"/>>제목</option>
					<option value ="notice_content" <c:out value = "$(scri.seachType eq 'c' ? 'selected' : '')"/>>내용</option>
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
			
		</div>

		<div class="col-md-offset-5">
		  	<ul class="pagination">
			    <c:if test="${pageMaker.prev}">
			    	<li><a href="noticeList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
			    </c:if>
				
			    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			 		<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }" />>   
			    	<a href="noticeList${pageMaker.makeSearch(idx)}">${idx}</a></li>
			    </c:forEach>
				
			    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			    	<li><a href="noticeList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
			    </c:if>
	  		</ul>
		</div>
	</form>
</div>
<div class="container">
		
	<div class="form-group">
		<div style="text-align: center; margin: 50px 0;">
			<h5><b>faq</b></h5>
		</div>
	</div>	

	<form role= "form" method="get">
	
		<table class="table table-bordered table-striped table-hove">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
				</tr>
			</thead>
			
			<c:forEach items="${faqlist}" var = "faqlist">
				<tr>
					<td><c:out value="${faqlist.faq_bno}" /></td>
					<td>
						<a href="/admin/board/faqDetail?n=${faqlist.faq_bno }"><c:out value="${faqlist.faq_title}" /></a>
					</td>
					<td>관리자</td>
				</tr>
			</c:forEach>
			
		</table>
		
		<div class="form-group btnss">
			<div align="right" class="col-sm-offset-3">
				<button type="button" class="btn btn-success btn-sm" onclick="location.href='faqInsert'">FAQ 작 성</button>
			</div>
			
		
		<div>
			<div align="center" class="col-xs-2 col-sm-2" style="margin-left:300px;">
				<select name = "searchType" class="form-control">
					<option value ="n" <c:out value = "$(scri.seachType == null ? 'selected' : '')"/>>---선택---</option>
					<option value ="faq_title" <c:out value = "$(scri.seachType eq 't' ? 'selected' : '')"/>>제목</option>
					<option value ="faq_content" <c:out value = "$(scri.seachType eq 'c' ? 'selected' : '')"/>>내용</option>
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
			
		</div>

		<div class="col-md-offset-5">
		  	<ul class="pagination">
			    <c:if test="${pageMaker2.prev}">
			    	<li><a href="noticeList${pageMaker2.makeSearch(pageMaker2.startPage - 1)}">이전</a></li>
			    </c:if>
				
			    <c:forEach begin="${pageMaker2.startPage}" end="${pageMaker2.endPage}" var="idx">
			 		<li <c:out value="${pageMaker2.cri.page == idx ? 'class=info' : '' }" />>   
			    	<a href="noticeList${pageMaker2.makeSearch(idx)}">${idx}</a></li>
			    </c:forEach>
				
			    <c:if test="${pageMaker2.next && pageMaker2.endPage > 0}">
			    	<li><a href="noticeList${pageMaker2.makeSearch(pageMaker2.endPage + 1)}">다음</a></li>
			    </c:if>
	  		</ul>
		</div>
	</form>
</div>

</body>
<script>
	$(function(){
		$('#searchBtn').click(function(){
			self.location = "boardList?searchType=" +$("select option:selected").val() +"&keyword="+$("[name=keyword]").val()	});
	});
</script>

</html>