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
				<li><a href="/member/memberDelete/${member.m_id}">회원 탈퇴</a><span class="glyphicon glyphicon-chevron-right"></span></li>
			</ul>
		</div>
<div class="m_content">
			<p class="order">예약 정보</p>
			<hr>
			<c:if test="${bookList == '[]' }">
				<p class="order">예약 정보가 없습니다.</p>
			</c:if>
			
			<c:if test="${bookList != '[]' }">
			
				<table class="table table-hover table-bordered">
					<thead>
						<tr class="info">
							<th>주문번호</th>
							<th>예약자 이름</th>
							<th>예약 인원</th>
							<th>상태</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="bookList" items="${bookList}">		
							<tr>
								<td align=center><a href="../member/myBookView?book_order=${bookList.book_order}">${bookList.book_order}</a></td>
								<td align=center>${bookList.m_name}</td>
								<td align=center>${bookList.book_people}</td>
								<td align=center>${bookList.book_ok}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</c:if>
		</div>
		<div class="m_content">
				<input type="hidden" id="m_id" name="m_id" value="${member.m_id}" />
		</div>
	</div>
</div>


<%@ include file="../include/footer.jsp" %>
</body>
<script type="text/javascript">
// 회원정보수정버튼을 눌렀을 경우 회원정보수정 페이지로 이동한다.
$("#memberUpdateBtn").on("click", function() {
	location.href = "/member/memberUpdate/" + $("#m_id").val();
});
</script>
</html>