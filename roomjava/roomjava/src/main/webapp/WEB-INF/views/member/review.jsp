<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
#bheader .inner .gnb > li:nth-child(3) > a { font-weight:700; }
.container { margin-top:70px; margin-bottom:70px; }
span.plusIcon { cursor:pointer; }
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="container" >
	<div class="col-sm-12">
		<table class="table table-bordered">
			<thead>
				<tr align="center">
					<th>후 기</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="review" items="${list}" varStatus="status">
				<tr>
	   			 <td>
			      <span class="glyphicon glyphicon-plus plusIcon"></span>
			      <span class="glyphicon glyphicon-minus plusIcon" style="display:none"></span>
			      (${review.r_name},
			    <c:if test="${review.r_kind == 1 }">펜션</c:if>
				<c:if test="${review.r_kind == 2 }">데크</c:if>
				<c:if test="${review.r_kind == 3 }">글램핑</c:if>
				<c:if test="${review.r_kind == 4 }">카라반</c:if>) 작성자:${review.m_id} 등록일:${review.m_reg}
			    </td>  
	 			 </tr>
			  <tr style="display:none">
			    <td>
			      <table class="table table-bordered">
			        <tr>
			        	<td>별점 :<c:choose>
							<c:when test="${review.review_star == 5 }">★★★★★</c:when>
							<c:when test="${review.review_star == 4 }">★★★★</c:when>
							<c:when test="${review.review_star == 3 }">★★★</c:when>
							<c:when test="${review.review_star == 2 }">★★</c:when>
							<c:when test="${review.review_star == 1 }">★</c:when>
						</c:choose></td> 
						
					</tr>
			        <tr>
			          <td>
			      	${review.r_content}
			      	 </td>
			        </tr>
			      </table>    
			    </td>
			  </tr>
			  </c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="col-sm-offset-3 col-sm-4">
		<h3><a class="label label-info">검색조건</a></h3>
		
		<select id='searchType'>
			<option>검색종류</option>
				<option value="r_name"   <c:if test="${pageVO.type} == 'r_name'">selected</c:if>>방 호수</option>
				<option value="review_writer" <c:if test="${pageVO.type} == 'review_writer'">selected</c:if>>작 성 자 </option>
		</select>
	  <input type='text' id='searchKeyword' value="${pageVO.keyword}">
	  <button id='searchBtn'>Search</button> 
	</div>
	
	<div class="col-sm-offset-3 col-sm-4">
		<ul class="btn-group pagination">
		    <c:if test="${pageMaker.prev }">
		    <li>
		        <a href='<c:url value="/member/review?page=${pageMaker.startPage-1}"/>'><span class="glyphicon glyphicon-chevron-left"></span></a>
		    </li>
		    </c:if>
		    
		    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
		    <li>
		        <a href='<c:url value="/member/review?page=${pageNum}"/>'><i>${pageNum}</i></a>
		    </li>
		    </c:forEach>
		    
		    <c:if test="${pageMaker.next && pageMaker.endPage >0}">
		    <li>
		        <a href='<c:url value="/member/review?page=${pageMaker.endPage+1}"/>'><span class="glyphicon glyphicon-chevron-right"></span></a>
		    </li>
		    </c:if>
		</ul>
	</div>
	
	<form id="formList" action="/member/review" method="get">
		<input type='hidden' name='page'		value="${result.currentPageNum}">
		<input type='hidden' name='size'		value="${result.currentPage.pageSize}">
		<input type='hidden' name='searchType' 	value="${pageVO.type}">
		<input type='hidden' name='keyword' 	value="${pageVO.keyword}">
	</form>
	
	
</div>
	<%@ include file="../include/footer.jsp" %>
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


$(".plusIcon").on("click",function(){
	  var obj = $(this);
	  if( obj.hasClass("glyphicon-plus") ){
	    obj.hide();
	    obj.next().show();            
	    obj.parent().parent().next().show();
	  } else {
	     obj.hide();
	     obj.prev().show();
	     obj.parent().parent().next().hide();
	  }
	});




</script>

</body>

</html>