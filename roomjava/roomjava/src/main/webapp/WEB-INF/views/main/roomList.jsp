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
</head>
<body>
<%@ include file="../include/header.jsp" %>




<div id="container">
	<div class="inner">
	
		<div id="allRooms">
		
			<p class="gTitle">모든 방</p>
			<ul class="Rooms">
			</ul>
		</div>
		
		<div id="showRooms">
				<c:forEach items="${kinds}" var="kind">
					
						<p class="gTitle">${kind.room_bno}</p>
						
						<div class="kindList">
							<c:forEach items="${allRooms}" var="list">
								<c:if test="${kind.room_bno == list.r_kind}">
								
									<ul class="list">
										<li class="lover">
											<a href="roomView?r_bno=${list.r_bno}">
												<img src="/resources/images/none.png" alt="images" width="230px" height="230px" />
											</a>
										<input type="hidden" value="${list.r_name}" />
										<input type="hidden" value="${list.r_kind}" />
										<input type="hidden" value="${list.r_people}" />
										<input type="hidden" value="${list.r_price}" />
										<input type="hidden" value="${list.r_base}" />
										<input type="hidden" value="${list.r_rent}" />	
											<form action="/shop/goCart" method="post">
											<input type="hidden" name="r_name" value="${list.r_name} + " />
											<input type="hidden" name="r_kind" value="${list.r_kind}" />
											<input type="hidden" name="r_people" value="${list.r_people}" />
											<input type="hidden" name="r_price" value="${list.r_price}" />
											<input type="hidden" name="r_base" value="${list.r_base}" />
											<input type="hidden" name="r_rent" value="${list.r_rent}" />
											</form>
										</li>
										<li><a href="roomView?r_bno=${list.r_bno}">${kind.room_class} ${list.r_name}호</a></li>
										<li ><a href="roomView?r_bno=${list.r_bno}"><fmt:formatNumber value="${list.r_price}" />원</a></li>
										<li ><a href="roomView?r_bno=${list.r_bno}">${list.r_kind}</a></li>
										
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
</html>