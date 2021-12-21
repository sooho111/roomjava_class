<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


		<div class="container">
			<hr />
			<header>
				<h5>문의하기</h5>
			</header>
			
			<section class="container">
				<form role= "form" method="post">
					<table class="table table-hover">
						<thead>
							<tr><th id="num">번호</th><th id="tit">제목</th><th id="make">작성자</th><th id="reg">등록일</th></tr>
						</thead>
						
						<c:forEach items="${QnA}" var = "QnA">
							<tr>
								<c:set var = "secret" scope="session" value="${QnA.secret }" />
								<c:choose>
									<c:when test ="${secret == 1 }">
										<td><c:out value="${QnA.brdNum}"/><span class="glyphicon glyphicon-lock"></span></td>
										<td><a class ="QnAbtn${QnA.brdNum }" href="#" ><c:out value="${QnA.brd_Title}" /></a></td>
										<input type="hidden" name="brdNum" id="brdNum" value="${QnA.brdNum}">
										<input type="hidden" name="verify" id="berify" value="${QnA.verify }">
									</c:when>
									<c:when test ="${secret == 0 }">
										<td><c:out value="${QnA.brdNum}"/></td>
										<td><a href="/shop/QnADetail?brdNum=${QnA.brdNum }&n=${QnA.gdsNum}" ><c:out value="${QnA.brd_Title}" /></a></td>
									</c:when>
								</c:choose>
								
								<td><c:out value="${QnA.userName}" /></td>
								<td><fmt:formatDate value="${QnA.repDate}" pattern="yyyy.MM.dd"/></td>
							</tr>
							
							<script>
								$(document).on("click", ".QnAbtn${QnA.brdNum }", function(){
									
									var brdNum = $("#brdNum").val();
										
									var data = { brdNum : brdNum};
									
									$.ajax({
										url : "/shop/QnADetail",
										type : "post",
										data : data,
										success : function(result){
											
											if(result == 1 ) {
												location.href = "/shop/QnADetail?brdNum=${QnA.brdNum}&n=${QnA.gdsNum}";
										 	} else {
												alert("비밀글입니다.")
											}
										},
										error : function() {
											alert("로그인하셔야합니다.")
										}
									});
								});
	 						</script>
						</c:forEach>
					</table>
				</form>
			</section>
		</div>
</body>
</html>