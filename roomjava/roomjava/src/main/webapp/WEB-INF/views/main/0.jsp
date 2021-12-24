<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시설 안내</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
#bheader .inner .gnb > li:first-child > a { font-weight:700; }

.course { margin:40px 0px; }

#story { width:100%; margin-bottom:150px; }
#story .inner { width:960px; text-align:center; }

#story .context { text-align:left; margin-left:80px; width:800px; }
.context .title { font-size:35px; font-weight:500; color:#333; margin-bottom:20px; }
.context p { font-size:20px; color:#666; font-weight:300; }
#story .context.con2 { margin-bottom:60px; }

#story .f_title { margin-left:80px; font-size:35px;
	 font-weight:500; color:#333; border-top:1px solid #999; border-bottom:1px solid #999; width:800px; padding:50px 0px; }

.homeBtn { margin-top:130px; font-size:20px; width:300px; height:40px; background:#fff; border:1px solid #999; }

</style>

</head>
<body>
<%@ include file="../include/header.jsp" %>

<div id="story">
	<div class="inner">
		<p class="course"><img src="../../resources/images/infra/infra1.jpg" alt="course" width="600px" height="600px"/></p>
		<p class="course"><img src="../../resources/images/infra/infra2.jpg" alt="course" width="600px" height="600px"/></p>
		<hr/>
		<p class="course"><img src="../../resources/images/infra/course.png" alt="course" /></p>
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
		<button type="button" class="homeBtn">홈으로</button>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>

<script>
$(function(){
	$('.homeBtn').click(function(){
		location.href="/";
	});
})
</script>
</body>
</html>