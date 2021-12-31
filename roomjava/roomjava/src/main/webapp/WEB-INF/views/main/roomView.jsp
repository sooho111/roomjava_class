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

<style>
#bheader .inner .gnb > li:nth-child(2) > a { font-weight:700; }

#container { margin-top:50px; }
#container .inner { width:1200px; }
#container .inner:after { content:""; clear:both; display:block; }

.gTitle { font-size:25px; font-weight:700; color:#333; border-bottom:1px solid #777; padding-bottom:20px; margin-bottom:20px; }

#allRooms { width:200px; float:left; }
.Rooms li { font-size:15px; margin-bottom:15px; }
.Rooms li a { color:#888; }
.Rooms li a:hover { color:#111; text-decoration:none; }

#showRooms { float:right; width:950px; position:relative; padding-bottom:50px; }

#showDatil { float:right; width:950px; position:relative; padding-bottom:50px; }
.list:after { content:""; clear:both; display:block; }
.list li { font-size:30px; padding-top:40px; }
.list li:first-child { float:left; font-size:30px; margin-bottom:15px; margin-right:100px; padding-top:0px; }

#story { width:100%; margin-bottom:150px; }
#story .inner { width:1200px; text-align:center; }
.course { margin:40px 0px; }

#story .context { text-align:left; margin-left:80px; width:800px; }
.context .title { font-size:35px; font-weight:500; color:#333; margin-bottom:20px; }
.context p { font-size:20px; color:#666; font-weight:300; }
#story .context.con2 { margin-bottom:60px; }

#story .f_title { margin-left:80px; font-size:35px; font-weight:500; color:#333; border-top:1px solid #999; border-bottom:1px solid #999; width:800px; padding:50px 0px; }

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
		
			<c:forEach items="${kinds}" var="kind">
				<c:if test="${kind.room_bno == room.r_kind}">
					<p class="gTitle">${kind.room_class} ${room.r_name}호 상세 정보</p>
				</c:if>
			</c:forEach>
		
			<ul class="list">
				<li><img src="/resources/images/none.png" alt="images" width="300px" height="300px" /></li>	
				<li>${room.r_name}호</li>
				<li class="r_price">1박 : ${room.r_price}원</li>
				<li>최대인원 : ${room.r_people}명</li>
			</ul>
			<hr>
			
			<form action="/main/goBook" method="post" id="bookForm">
				<input type="hidden" name="r_bno" value="${room.r_bno}" />
				<input type="hidden" name="r_name" value="${room.r_name}" />
				<input type="hidden" name="r_kind" value="${room.r_kind}" />
				<input type="hidden" name="r_people" value="${room.r_people}" />
				<input type="hidden" name="r_price" value="${room.r_price}" />
				<input type="hidden" name="r_base" value="${room.r_base}" />
				<input type="hidden" name="r_rent" value="${room.r_rent}" />
				<input type="hidden" name="start_date" value="${start_date}" />
				<input type="hidden" name="end_date" value="${end_date}" />
			</form>
	
			<ul class="btns" align="right">
				<li><button type="button" class="btn btn-primary goBook">다음단계</button></li>
			</ul>
		</div>
		
		<div id="showDatil">
			<p class="gTitle">시설 상세 정보 보기</p>
			
			<div id="story">
				<p class="course"><img src="../../resources/images/course.png" alt="course" /></p>
				
				<div class="context">
					<p class="title">기본 정보</p>
					<p>입실 : 15:00 | 퇴실 : 12:00</p>
					<br>
					<p>22시 이후 입실 시 사전문의 (필수)</p>
					<p>무료 Wi-Fi</p>
					<p>전 객실 금연</p>
					<p>픽업 불가</p>
					<br>
					<p class="title">인원 추가 정보</p>
					<p>영유아 기준인원 포함 / 최대인원 초과불가</p>
					<br>
					<p>8세 이상부터 추가요금 발생</p>
					<p>현장결제</p>
					<br>
					<p class="title">취소 및 환불 규정</p>
					<p>숙박일 기준 7 일 전 : 100% 환불</p>
					<p>숙박일 기준 6 일 전 : 90% 환불</p>
					<p>숙박일 기준 5 일 전 : 85% 환불</p>
					<p>숙박일 기준 4 일 전 : 80% 환불</p>
					<p>숙박일 기준 3 일 전 : 70% 환불</p>
					<p>숙박일 기준 2 일 전 : 50% 환불</p>
					<p>숙박일 기준 1 일 전 : 30% 환불</p>
					<p>숙박일 기준 당일 및 NO-SHOW : 환불불가</p>
					<p>취소, 환불시 수수료가 발생할 수 있습니다</p>
					<br>
					<p class="title">확인사항 및 기타</p>
					<p>최대 인원 초과시 입실이 불가 합니다 (방문객 불가)</p>
					<p>체크인 시 배정 객실 선택시 현장에서 랜덤 배정됩니다</p>
					<p>전 객실 애완동물 출입이 불가합니다</p>
					<p>보호자 동반없는 미성년자는 이용하실 수 없습니다</p>
					<p>해당 이미지는 실제와 상이 할 수 있습니다</p>
					<p>이용시설의 분실 및 훼손의 책임은 이용자에게 있으니 주의부탁드립니다</p>
					<p>객실 내에서는 화재위험물질 (화약, 폭죽 등)은 사용 하실 수 없습니다 (화재로 인한 책임은 이용자에게 있습니다)</p>
					<p>쓰레기는 지정된 장소에 분리하여 주시기 바랍니다</p>
					<p>위의 정보는 펜션의 사정에 따라 변경될 수 있습니다</p>
					<p>성수기 기간동안 일부 객실의 경우 요금변동이 있을 수 있습니다</p>
				</div>
			</div>
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

$('.goBook').click(function(){
	$('#bookForm').submit();
});


</script>
</html>