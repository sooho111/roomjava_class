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
			<c:if test="${kind == null}">
				<c:forEach items="${kinds}" var="kind">
					
						<p class="gTitle">${kind.room_class}</p>
						
						<div class="kindList">
							<c:forEach items="${allRooms}" var="list">
								<c:if test="${kind.room_class == list.r_kind}">
								
									<ul class="list">
										<li class="lover">
											<a href="roomView?r_bno${list.r_bno}">
												<img src="/resources/images/none.png" alt="images" width="230px" height="230px" />
											</a>
											<button type="button" class="love"><span class="glyphicon glyphicon-heart-empty"></span></button>
										<input type="hidden" value="${list.r_name}" />
										<input type="hidden" value="${list.r_kind}" />
										<input type="hidden" value="${list.r_people}" />
										<input type="hidden" value="${list.r_price}" />
										<input type="hidden" value="${list.r_base}" />
										<input type="hidden" value="${list.r_rent}" />	
											<form action="/shop/goCart" method="post">
											<input type="hidden" name="r_name" value="${r_name}" />
											<input type="hidden" name="r_kind" value="${r_kind}" />
											<input type="hidden" name="r_people" value="${r_people}" />
											<input type="hidden" name="r_price" value="${r_proce}" />
											<input type="hidden" name="r_base" value="${list.r_base}" />
											<input type="hidden" name="r_rent" value="${list.r_rent}" />
											</form>
											<button type="button" class="goCart"><span class="glyphicon glyphicon-shopping-cart"></span></button>
										</li>
										<li><a href="roomView?r_bno=${list.r_bno}">${list.r_name}</a></li>
										<li class="cut"><a href="roomView?r_bno=${list.r_bno}">${list.r_price}</a></li>
										<li class="gkind"><a href="roomView?r_bno=${list.r_bno}">${list.r_kind}</a></li>
										
									</ul>
								</c:if>
							</c:forEach>
						</div>
						
				</c:forEach>
			</c:if>
		
			<c:forEach items="${kind}" var="kind">
					<p class="gTitle">${kind.kind_name}</p>
					
					<div class="kindList">
						<c:forEach items="${allMeals}" var="list">
						<!-- ################################### -->
							<c:if test="${kind.room_class == list.r_kind}">
																	<ul class="list">
										<li class="lover">
											<a href="roomView?r_bno${list.r_bno}">
												<img src="/resources/images/none.png" alt="images" width="230px" height="230px" />
											</a>
											<button type="button" class="love"><span class="glyphicon glyphicon-heart-empty"></span></button>
										<input type="hidden" value="${list.r_name}" />
										<input type="hidden" value="${list.r_kind}" />
										<input type="hidden" value="${list.r_people}" />
										<input type="hidden" value="${list.r_price}" />
										<input type="hidden" value="${list.r_base}" />
										<input type="hidden" value="${list.r_rent}" />	
											<form action="/shop/goCart" method="post">
											<input type="hidden" name="r_name" value="${r_name}" />
											<input type="hidden" name="r_kind" value="${r_kind}" />
											<input type="hidden" name="r_people" value="${r_people}" />
											<input type="hidden" name="r_price" value="${r_proce}" />
											<input type="hidden" name="r_base" value="${list.r_base}" />
											<input type="hidden" name="r_rent" value="${list.r_rent}" />
											</form>
											<button type="button" class="goCart"><span class="glyphicon glyphicon-shopping-cart"></span></button>
										</li>
										<li><a href="roomView?r_bno=${list.r_bno}">${list.r_name}</a></li>
										<li class="cut"><a href="roomView?r_bno=${list.r_bno}">${list.r_price}</a></li>
										<li class="gkind"><a href="roomView?r_bno=${list.r_bno}">${list.r_kind}</a></li>
										
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