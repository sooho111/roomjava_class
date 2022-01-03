<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${member.m_id}님의 정보</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@400;800&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

/* visual */
.t_visual { height:300px; width:100%; background:url("/resources/images/photo4.jpg") no-repeat top center; position:relative; margin-bottom:70px; }
.t_visual .inner { width:960px; position:relative; }
.t_visual_black { height:300px; width:100%; background:rgba(0,0,0,0.5); position:absolute; }

.me { position:absolute; left:0; top:0; margin-top:90px; }
.me p { color:#fff; font-family:'Nanum Myeongjo',serif; }
.me p:first-child { font-weight:800; font-size:40px; margin-bottom:15px; }
.me p:last-child { font-size:20px; }

/* myContent */
#myContent { height:750px; }
#myContent .inner { width:960px; }
#myContent .inner:after { content:""; clear:both; display:block; }

.left_bar { float:left; }
.left_bar .myShopping { width:200px; border-bottom:1px solid #888; margin-bottom:20px; }
.left_bar .myShopping:last-child { border:0; }
.left_bar .myShopping li { margin-bottom:20px; position:relative; }
.left_bar .myShopping li:first-child { color:#333; font-weight:700; font-size:20px; } 
.left_bar .myShopping li a { color:#666; font-weight:300; font-size:15px; }
.glyphicon-chevron-right { color:#666; position:absolute; right:0; top:4px; }

.m_content { float:right; width:700px; }
.m_content .order { font-size:20px; }

th { text-align:center; }

</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="t_visual">
	<div class="t_visual_black"></div>
	
	<div class="inner">
		<div class="me">
			<p>${member.m_name}</p>
			<p>${member.m_id}님 환영합니다.</p>
		</div>
	</div>
</div>

<div id="myContent">
	<div class="inner">
		<div class="left_bar">
			<ul class="myShopping">
				<li></li>
				<li><a href="myPage">예약 확인</a><span class="glyphicon glyphicon-chevron-right"></span></li>
				<li><a href="memberUpdate/${member.m_id}">회원 정보 수정</a><span class="glyphicon glyphicon-chevron-right"></span></li>
				<li class = "memberDelete"><a href="#">회원 탈퇴</a><span class="glyphicon glyphicon-chevron-right"></span></li>
			</ul>
		</div>
		<div class="m_content">
			<p class="order"> 조회 </p>
			<hr>
			<table class="table table-bordered table-hover">
				<thead>
					<tr class="info">
						<th align=center>주문번호</th>
						<th align=center>예약자</th>
						<th align=center>인원수</th>
						<th align=center>주문상태</th>
						<th align=center>입금계좌</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="bookView" items="${bookView}">				
						<tr>
							<td align=center>${bookView.book_order}</td>
							<td align=center>${bookView.m_name}</td>
							<td align=center>${bookView.book_people}</td>
							<td class="delivery" align=center>${bookView.book_ok}</td>
							<td align=center>${bookView.payment}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<table class="table table-bordered table-hover orderInfo">
				<c:forEach items="${bookView}" var="bookView" varStatus="status">
					<c:if test="${status.first}">
						<thead>
							<tr class="info">
								<th align=center>예약자</th>
								<th align=center>휴대폰 번호</th>
								<th align=center>인원수</th>
								<th align=center>시작일</th>
								<th align=center>종료일</th>
								<th align=center>방번호</th>
								<th align=center>방종류</th>
								<th align=center>총 액</th>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td align=center>${bookView.m_name}</td>
								<td align=center>${bookView.book_tel}</td>
								<td align=center>${bookView.book_people}</td>
								<td align=center>${bookView.start_date}</td>
								<td align=center>${bookView.end_date}</td>
								<td align=center>${bookView.r_name}</td>
								<td align=center>${bookView.room_class}</td>
								<td align=center>${bookView.r_price}원</td>
							</tr>
						</tbody>		
					</c:if>
					<input type="hidden" id=book_order value="${bookView.book_order}">
				</c:forEach>
			</table>
			<c:if test="${checkReview==0}">
			<input class="btn btn-primary" type="button" value="후기 작성" id="goreview" /> 
			</c:if>
			<c:if test="${checkReview==1}">
			<input class="btn btn-primary" type="button" value="후기 수정" id="updatereview" /> 
			<input class="btn btn-danger" type="button" value="후기 삭제" id="deletereview" />
			</c:if>
			<input class="btn btn-danger" type="button" value="예약 취소" id="deleteBook"/>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>
</body>
<script type="text/javascript">
$("#goreview").click(function(){
    if(confirm("리뷰를 작성하시겠습니까?")){
        location.href="${path}/member/insertReview?book_order="+$("#book_order").val();
    }
});
$("#updatereview").click(function(){
    if(confirm("리뷰를 수정하시겠습니까?")){
        location.href="${path}/member/updateReview?book_order="+$("#book_order").val();
    }
});
$("#deletereview").click(function(){
    if(confirm("리뷰를 삭제하시겠습니까?")){
        location.href="${path}/member/deleteReview?book_order="+$("#book_order").val();
    }
});
$("#deleteBook").click(function(){
    if(confirm("예약을 취소하시겠습니까?")){
        location.href="${path}/member/deleteBook?book_order="+$("#book_order").val();
    }
});
</script>
</html>