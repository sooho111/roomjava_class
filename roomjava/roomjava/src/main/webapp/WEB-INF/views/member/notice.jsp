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
.container { margin-top:70px; margin-bottom:70px; }
.btnss { margin-bottom:50px; }
.notice { font-size:20px; margin-bottom:30px; }


.noticeInfo {  padding:30px 20px 20px 20px; display:none; height:500px; }
.noticeInfo .inputArea { margin:10px 0; }
.noticeInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
.noticeInfo .inputArea input { font-size:14px; padding:5px; }
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
	<div class="container">
			
		<div class="form-group">
			<div style="text-align: center; margin: 50px 0;">
				<h5><b>공지사항</b></h5>
			</div>
		</div>	

			<div class="noticeInfo">
				<form class="form-horizontal" role="form" method="post" autocomplete="off">
				
				<input type="hidden" name="notice_bno" value="${detail.notice_bno}" id="notice_bno"/>
	
			
			<div class="inputArea">
				<label for="title" class="control-label col-sm-2">제  목</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="notice_title" name="notice_title" style="background:#EEE;" maxlength="50"  value="${detail.notice_title}" readonly="readonly"  />
				</div>
			</div>
			
			
			<div class="inputArea">
				<label for="repDate" class="control-label col-sm-2">작성일자</label>
				<div class="col-sm-3">
					<input class="form-control" type="text" name="notice_date"  value="<fmt:formatDate value="${detail.notice_date}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/>" readonly="readonly"  />
				</div>
			</div>
			
			<div class="inputArea">
				<label for="content" class="control-label col-sm-2">내  용</label>
				<div class="col-sm-4">
					<textarea rows="15" cols="140" id="notice_content" name="notice_content" style="background:#EEE; padding:5px; border-radius:4px;" readonly="readonly" >${detail.notice_content}</textarea>
				</div>
			</div>
				
	<div class="inputArea">
		   	<br/>
	<button type="button" class="cancel_btn">취소</button>
		                  		
		   
	 </div>
				
				</form>
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
							<a href="/member/noticeDetail?n=${list.notice_bno }"><c:out value="${list.notice_title}" /></a>
						</td>
						<td>관리자</td>
						<td><fmt:formatDate value="${list.notice_date }"  pattern="yyyy년MM월dd일 HH:mm:ss"/></td>
					</tr>
				</c:forEach>
				
			</table>
			
			<div class="search row">
			
				<div align="center" class="col-xs-2 col-sm-2" style="margin-left:300px;">
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

			<br/>
			<br/>
			<br/>

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

<%@ include file="../include/footer.jsp" %>
	</div>
				<script>
					$(function(){
						$('#searchBtn').click(function(){
							self.location = "notice?searchType=" +$("select option:selected").val() +"&keyword="+$("[name=keyword]").val()	});
					});
					
					$(".noticeDetail_btn").click(function(){
						$(".noticeInfo").slideDown();
						$(".noticeDetail_btn").slideUp();
					});
		     
		      $(".cancel_btn").click(function(){
		      $(".noticeInfo").slideUp();
		      $(".noticeDetail_btn").slideDown();
		      });
					
				</script>
</body>
</html>