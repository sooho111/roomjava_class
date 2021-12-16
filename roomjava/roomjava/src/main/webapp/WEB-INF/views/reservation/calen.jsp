<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!--
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	-->
	<link rel="stylesheet" href="../resources/css/calen.css">
	<title>예약하기</title>
	
	<!-- fullcalender 
	<link href='/resources/fullcalendar-5.6.0/lib/main.css' rel='stylesheet' />
	<script src='/resources/fullcalendar-5.6.0/lib/main.js'></script>
	<script>
	
	      document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	          initialView: 'dayGridMonth'
	        });
	        calendar.render();
	      });
	
	</script>	-->
	<%@ include file="../include/includeFile.jsp" %>
</head>

<body>
<%@ include file="../include/indexHeader.jsp" %>

	<div class="calendar">
		<div class="header">
			<div class="year-month"></div>
			<div class="nav">
				<button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
				<button class="nav-btn go-today" onclick="goToday()">Today</button>
				<button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
			</div>
		</div>
		<div class="main">
			<div class="days">
				<div class="day">일</div>
				<div class="day">월</div>
				<div class="day">화</div>
				<div class="day">수</div>
				<div class="day">목</div>
				<div class="day">금</div>
				<div class="day">토</div>
			</div>
		<div class="dates"></div>
		</div>
	</div>
	<script src="../resources/js/calen.js"></script>


<%@ include file="../include/footer.jsp" %>
</body>

</html>