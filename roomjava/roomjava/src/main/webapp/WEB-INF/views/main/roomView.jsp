<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>방 상세 정보</title>
	<%@ include file="../include/includeFile.jsp" %>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<h1>방 상세 정보</h1>


<div class="container">
	<form class="form-horizontal" method="post" enctype="multipart/form-data" action="/main/goBook">
	<div class="inner">
		
	<br/><br/>
	
		<div id="showRooms">
			<div class="img"><img src="/resources/images/none.png" alt="images" width="450px" height="450px" /></div>
			
				<br /><br />
			<ul class="btns">
				<li><button class="btn btn-info">이전단계</button></li>
				<li><button type="submit" class="btn btn-primary goBook" id="submit">다음단계</button></li>
			</ul>
			
					<input type="hidden" name="r_name" value="${list.r_name} + " />
					<input type="hidden" name="r_kind" value="${list.r_kind}" />
					<input type="hidden" name="r_people" value="${list.r_people}" />
					<input type="hidden" name="r_price" value="${list.r_price}" />
					<input type="hidden" name="r_base" value="${list.r_base}" />
					<input type="hidden" name="r_rent" value="${list.r_rent}" />
				<br /><br />
			<h1>시설 상세 정보 보기</h1>
				<br /><br />
			<div id="detail">
				<img src="/resources/images/photo1.jpg" alt="사진1" width="800px" />
				<br /><br />
				<img src="/resources/images/photo4.jpg" alt="사진2" width="800px" />
			</div>
			

			
		</div>
	</div>
</form>	
</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>