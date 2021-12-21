<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 리스트</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
#header .inner .gnb li:nth-child(3) a { font-weight:700; }
#container { margin-top:50px; }
#container .inner { width:960px; }
#container .inner:after { content:""; clear:both; display:block; }

#allRooms { width:180px; float:left; }
.gTitle { font-size:25px; font-weight:700; color:#333; border-bottom:1px solid #777; padding-bottom:20px; margin-bottom:20px; }
.Rooms li { font-size:15px; margin-bottom:15px; }
.Rooms li a { color:#888; }
.Rooms li a:hover { color:#111; text-decoration:none; }

<div class="container">
	<form class="form-horizontal" method="post" enctype="multipart/form-data" action="/manager/productRegister">
#showRooms { width:750px; float:right; position:relative; padding-bottom:50px; }
.list { float:left; width:230px; margin-right:20px; margin-bottom:30px; }
.list li a { color:#777; font-size:15px; }
.list li:nth-child(2) a { color:#333; font-size:23px; font-weight:500; }
.list li:first-child { margin-bottom:15px; }
.kindList:after { content:""; display:block; clear:both; }

</style>

</head>
<body>
<%@ include file="../include/header.jsp" %>

<div id="container">
	<div class="inner">
		<div id="allRooms">

			<p class="gTitle">모든 방</p>

			<ul class="Rooms">
				<c:forEach items="${kinds}" var="kind">
					<li class="room_name"><a href="#">${kind.room_class}</a></li>
					<input type="hidden" value="${kind.room_bno}" />
				</c:forEach>
			</ul>
			<form action="/main/roomList" method="POST" id="kindList">
				<input type="hidden" name="room_bno" class="bno" />
			</form>
			
		</div>
		
		<div id="showRooms">
			<c:if test="${list.room_class != null}">
				<p class="gTitle">${list.room_class}</p>
			</c:if>
			<c:forEach items="${kinds}" var="kind">
				<c:if test="${list.room_class == null}">
					<p class="gTitle">${kind.room_class}</p>
				</c:if>
				
				<div class="kindList">
					<c:forEach items="${allRooms}" var="list">
						<c:if test="${kind.room_bno == list.r_kind}">
							<ul class="list">
								<li>
									<a href="roomView?r_bno=${list.r_bno}">
										<img src="/resources/images/none.png" alt="images" width="230px" height="230px" />
									</a>
								</li>
								<li><a href="roomView?r_bno=${list.r_bno}">${kind.room_class} ${list.r_name}호</a></li>
								<li><a href="roomView?r_bno=${list.r_bno}"><fmt:formatNumber value="${list.r_price}" />원</a></li>
							</ul>
						</c:if>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>

<script>
$('.room_name').click(function(){
	$('.bno').val($(this).next().val());
	$('#kindList').submit();
});

</script>
</html>