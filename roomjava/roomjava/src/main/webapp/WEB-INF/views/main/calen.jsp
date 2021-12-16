<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!--
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	-->
	<title>예약하기</title>
	<!-- fullcalender -->
	<link href='/resources/fullcalendar-5.10.1/lib/main.css' rel='stylesheet' />
	<script src='/resources/fullcalendar-5.10.1/lib/main.js'></script>
	
	<script>
	      document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	          initialView: 'dayGridMonth'
	        });
	        calendar.render();
	      });
	
	</script>
	
	<%@ include file="../include/includeFile.jsp" %>
</head>

<body>
<%@ include file="../include/header.jsp" %>
<div id='calendar'></div>
	

<%@ include file="../include/footer.jsp" %>
</body>

</html>