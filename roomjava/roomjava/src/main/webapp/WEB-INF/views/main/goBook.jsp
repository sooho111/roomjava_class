<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약하기</title>
	<%@ include file="../include/includeFile.jsp" %>
	
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
	
</head>
<body>
<%@ include file="../include/header.jsp" %>
<h1>예약하기!!!!!</h1>


<div class="container">
	<form class="form-horizontal" method="post" enctype="multipart/form-data" action="#">
		<div class="inner">
			<div id="showRooms">
				<div class="img"><img src="/resources/images/none.png" alt="images" width="450px" height="450px" />
			</div>
				

				
				
				
		<div class="form-group">
			<label class="control-label col-sm-2">밀키트 종류</label>
			<div class="col-sm-2">
				<select class="form-control" name="mk_kind" id="mk_kind">
					<c:forEach var="kind" items="${kind}">
						<option value="${kind.kind_name}">${kind.kind_name}</option>
					</c:forEach>
				</select>
			</div>
		</div>		
	
		<div class="form-group">
			<label class="control-label col-sm-2">밀키트 종류</label>
			<div class="col-sm-2">
				<select class="form-control" name="mk_kind" id="mk_kind">
					<c:forEach var="kind" items="${kind}">
						<option value="${kind.kind_name}">${kind.kind_name}</option>
					</c:forEach>
				</select>
			</div>
		</div>		
	
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				<ul class="btns">
					<li><button class="btn btn-info">이전단계</button></li>
					<li><button type="submit" class="btn btn-primary booking" id="submit">예약하기</button></li>
				</ul>
					<input type="hidden" name="r_name" value="${list.r_name} + " />
					<input type="hidden" name="r_kind" value="${list.r_kind}" />
					<input type="hidden" name="r_people" value="${list.r_people}" />
					<input type="hidden" name="r_price" value="${list.r_price}" />
					<input type="hidden" name="r_base" value="${list.r_base}" />
					<input type="hidden" name="r_rent" value="${list.r_rent}" />
<br /><br />
<h1>예약 정보</h1>
<br /><br />
				
<!-- 달력보여주기!!!!!!! 짱이지?! -->				
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
				
				alert("^^"+calendar.getEventById());
				
				return false;
			
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
					
				}
				
				// alert('일정 클릭! 4.jsp로 이동');
				// location.href="4";
			}, 

		});	 

		

		// 데이터 삽입방식

		calendar.addEvent({id:'a',title:'펜션', 'start':'2021-12-17'});
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
<!-- END - 달력보여주기!!!!!!! -->	
<br /><br />			

			
			</div>
		</div>
	</form>	
</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>