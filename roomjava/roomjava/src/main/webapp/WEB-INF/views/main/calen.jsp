<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약하기</title>
	<!--
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	-->

	<script src="/resources/js/jquery-3.6.0.js"></script>
	<!-- fullcalender -->
	<script src='/resources/fullcalendar-5.10.1/lib/locales-all.min.js'></script>
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
	<!-- End fullcalender -->
	
	<style type="text/css">
	    body {
	        margin: 40px 10px;
	        padding: 0;
	        font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	        font-size: 14px;
	    }
	
	    #calendar {
	        max-width: 900px;
	        margin: 0 auto;
	    }
	
	    .fc-day-number.fc-sat.fc-past { color:#0000FF; }
	    .fc-day-number.fc-sun.fc-past { color:#FF0000; }

	</style>
	
	
	<%@ include file="../include/includeFile.jsp" %>
</head>



<body>
<%@ include file="../include/header.jsp" %>

<br /><br /><br />
<div id='calendar'></div>

<script>

document.addEventListener('DOMContentLoaded', function() {

		var calendarEl = document.getElementById('calendar');


		var calendar = new FullCalendar.Calendar(calendarEl, {

			initialView : 'dayGridMonth', // 월 달력

			// 달력 툴

			headerToolbar: {
			      left: 'prev',
			      center: 'title',
			      right: 'next today'
			 },

			editable: true,     // 드래그 수정 가능

			locale : 'ko',        // 한국어 설정(lib/locales/ko.js)

			 // 요일 클릭 이벤트
			dateClick : function() {
				alert('요일 클릭!');
			},
			
			// 일정 클릭 이벤트
			eventClick : function() {
				
				alert("^^"+$(this).text());
				
				return false;
				/*
				if ('title' == "글램핑") {
					alert('글램핑 클릭! book_gp.jsp로 이동');
					// location.href="book_gp";
				}  else if (title == "데크") {
					alert('데크 클릭! book_dk.jsp로 이동');
					// location.href="book_dk";
				} else if (title == "카라반") {
					alert('카라반 클릭! book_kb.jsp로 이동');
					// location.href=book_kb;
				} else if (title == "펜션") {
					alert('펜션 클릭! book_ps.jsp로 이동');
					// location.href="book_ps";
				} else {
					
				} */
				
				// alert('일정 클릭! 4.jsp로 이동');
				// location.href="4";
			}, 

		});	

		

		// 데이터 삽입방식

		calendar.addEvent({'title':'펜션', 'start':'2021-12-17'});
		calendar.addEvent({'title':'글램핑', 'start':'2021-12-17'});
		calendar.addEvent({'title':'데크', 'start':'2021-12-17'});
		calendar.addEvent({'title':'카라반', 'start':'2021-12-17'});
		
		calendar.addEvent({'title':'크리스마스', 'start':'2021-12-25'});
		
		calendar.addEvent({'title':'준현생일', 'start':'2021-12-04'});
		calendar.addEvent({'title':'연빈생일', 'start':'2022-01-06'});
		calendar.addEvent({'title':'동균생일', 'start':'2022-02-17'});
		calendar.addEvent({'title':'민영생일', 'start':'2022-03-17'});
		calendar.addEvent({'title':'학원종강', 'start':'2022-01-07'});
		
		calendar.addEvent({'title':'고객2-펌', 'start':'2021-07-18T22:00'});
		calendar.addEvent({'title':'고객3-염색', 'start':'2021-07-20T09:00'});
		calendar.addEvent({'title':'31일?', 'start':'2021-11-30'});

		// 렌더링

		calendar.render();

	});

</script>




<br /><br /><br />
<h6 align='center'>되는거냐!</h6>
<br /><br /><br />

<%@ include file="../include/footer.jsp" %>
</body>

</html>