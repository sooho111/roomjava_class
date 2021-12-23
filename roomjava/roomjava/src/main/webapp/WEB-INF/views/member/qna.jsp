<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 게시판</title>
<%@ include file="../include/includeFile.jsp"%>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="container">
		
	<div class="form-group">
		<div style="text-align: center; margin: 50px 0;">
			<h5><b>1:1 문의 게시판</b></h5>
		</div>
	</div>	

	<form role= "form" method="get">
	
		<table class="table table-bordered table-striped table-hove">
			<thead>
				<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th></tr>
			</thead>
			
			<c:forEach items="${qnaList}" var = "qnaList">
				<tr>
					<td><c:out value="${qnaList.qna_bno}" /></td>
					<td><a class ="qnabtn" href="#" ><c:out value="${qnaList.qna_title}" /></a></td>
					<td><c:out value="${qnaList.m_id}" /></td>
					<td><fmt:formatDate value="${qnaList.qna_date}" pattern="yyyy년MM월dd일 HH:mm:ss"/></td>
				
				</tr>
			</c:forEach>
			
		</table>
		
		<div class="form-group btnss">
			<div align="right" class="col-sm-offset-3">
				<button type="button" class="btn btn-success btn-sm" onclick="location.href='qnaInsert'">글 작 성</button>
			</div>
			
		
		<div>
			<div align="center" class="col-xs-2 col-sm-2" style="margin-left:300px;">
				<select name = "searchType" class="form-control">
					<option value ="n" <c:out value = "$(scri.seachType == null ? 'selected' : '')"/>>---선택---</option>
					<option value ="qna_title" <c:out value = "$(scri.seachType eq 't' ? 'selected' : '')"/>>제목</option>
					<option value ="qna_content" <c:out value = "$(scri.seachType eq 'c' ? 'selected' : '')"/>>내용</option>
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
			    	<li><a href="qna${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
			    </c:if>
				
			    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			 		<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }" />>   
			    	<a href="qna${pageMaker.makeSearch(idx)}">${idx}</a></li>
			    </c:forEach>
				
			    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			    	<li><a href="qna${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
			    </c:if>
	  		</ul>
		</div>
	</form>
</div>
<%@ include file="../include/footer.jsp" %>

<script>
$('#searchBtn').click(function(){
	self.location = "qna?searchType=" +$("select option:selected").val() +"&keyword="+$("[name=keyword]").val()
});
	
	
$('.qnabtn').click(function(){
	var qna_bno = $(this).parent().prev().text();
	var data = { qna_bno : qna_bno };
	
	$.ajax({
		url : "/member/qnaDetail",
		type : "post",
		data : data,
		success : function(result){
			
			if(result == 1 ) {
				location.href = "/member/qnaDetail?qna_bno="+ qna_bno;
		 	} else {
				alert("관리자와 작성자만 들어갈 수 있습니다.")
			}
		},
		error : function() {
			alert("로그인하셔야합니다.")
		}
	});
});
	
</script>

</body>
</html>