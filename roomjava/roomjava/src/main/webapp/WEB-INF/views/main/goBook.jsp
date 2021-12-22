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
#bheader .inner .gnb > li:nth-child(2) > a { font-weight:700; }
body { overflow-x:hidden; font-size:14px; }
#calendar {
    max-width: 900px;
    margin: 0 auto;
}

.fc-day-number.fc-sat.fc-past { color:#0000FF; }
.fc-day-number.fc-sun.fc-past { color:#FF0000; }
#showRooms { margin-top:40px; }

</style>	

</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="container">
	<div class="inner">
		<div id="showRooms">
			<div align="center"><img src="/resources/images/none.png" alt="images" width="450px" height="450px" />
		</div>
				
		<br/><br/><br/>
		<form class="form form-horizontal">
			<div class="form-group">
				<label class="control-label col-sm-4">예약자 이름</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="m_name" id="m_name" maxlength="50" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-4">예약 인원</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" 
					name="member" id="member" maxlength="50" />
				</div>
			</div>	
					
			<div class="form-group">
				<label class="control-label col-sm-4">예약자 전화번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" 
					name="m_tel" id="m_tel" maxlength="50" />
				</div>
			</div>	
			
			<div class="form-group">
				<label class="control-label col-sm-4">방 기능</label>
				<div class="col-sm-5">
					<select class="form-control" name="room_fnc" id="room_fnc">
						<c:forEach var="fnc" items="${fnc}">
							<option value="${fnc.fnc_name}">${fnc.fnc_name}</option>
						</c:forEach>
					</select>
				</div>
			</div>		
		
<<<<<<< HEAD
			<div class="form-group">
				<label class="control-label col-sm-4">렌트</label>
				<div class="col-sm-5">
					<select class="form-control" name="room_rent" id="room_rent">
						<c:forEach var="rent" items="${rent}">
							<option value="${rent.rent_name}">${rent.rent_name}, ${rent.rent_price}원</option>
						</c:forEach>
					</select>
				</div>
			</div>		
		
			<div class="form-group">
				<label class="control-label col-sm-4">결제 수단</label>
				<div class="col-sm-5">
					<select class="form-control" name="payment" id="payment">
						<c:forEach var="payment" items="${payment}">
							<option value="${payment.pay_name}">${payment.pay_name}, ${payment.pay_account}, ${payment.pay_bank}은행</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</form>
		
=======
		<div class="form-group">
			<label class="control-label col-sm-2">예약자 이름</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" 
				name="book_name" id="book_name" maxlength="50" placeholder="이름을 입력하십시오."/>
			</div>
		</div><br/><br/>
				
		<div class="form-group">
			<label class="control-label col-sm-2">예약 인원(최대인원, 최소인원)</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" 
				name="book_people" id="book_people" maxlength="50" />
			</div>
		</div><br/><br/>
				
		<div class="form-group">
			<label class="control-label col-sm-2">예약자 전화번호</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" 
				name="book_tel" id="book_tel" maxlength="50" placeholder="전화번호를 입력하십시오."/>
			</div>
		</div><br/><br/>	
		
		<div class="form-group">
			<label class="control-label col-sm-2">예약 시작날짜 만들 예정</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" 
				name="start_Date" id="start_Date" maxlength="50" placeholder="datepicker 넣어야지."/>
			</div>
		</div><br/>
		<div class="form-group">
			<label class="control-label col-sm-2">예약 종료날짜 만들 예정</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" 
				name="end_Date" id="end_Date" maxlength="50" placeholder="datepicker 넣어야지."/>
			</div>
		</div><br/><br/>		
		
		
		<div class="form-group">
			<label class="control-label col-sm-2">추가 옵션</label>
			<div class="col-sm-5">
				<select class="form-control" name="room_fnc" id="room_fnc">
					<c:forEach var="fnc" items="${fnc}">
						<option value="${fnc.fnc_name}">${fnc.fnc_name}</option>
					</c:forEach>
				</select>
			</div>
		</div><br/><br/>	
	
		<div class="form-group">
			<label class="control-label col-sm-2">렌트</label>
			<div class="col-sm-5">
				<select class="form-control" name="room_rent" id="room_rent">
					<c:forEach var="rent" items="${rent}">
						<option value="${rent.rent_name}">${rent.rent_name}, ${rent.rent_price}원</option>
					</c:forEach>
				</select>
			</div>
		</div><br/><br/>
	
		<div class="form-group">
			<label class="control-label col-sm-2">결제 수단</label>
			<div class="col-sm-5">
				<select class="form-control" name="payment" id="payment">
					<c:forEach var="payment" items="${payment}">
						<option value="${payment.pay_name}">${payment.pay_name}, ${payment.pay_account}, ${payment.pay_bank}은행</option>
					</c:forEach>
				</select>
			</div>
		</div><br/><br/>
		
		<div class="form-group">
			<label class="control-label col-sm-2">가격 구현할 예정(방가격 + 추가인원가격 + 추가기능가격 + 렌트가격)</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" 
				name="mk_price" id="mk_price" maxlength="30" value="${productView.mk_price}" readonly="readonly"/>
			</div>
		</div><br/><br/>		
		
				
>>>>>>> 531fc7fd8aaf0aceabb5bfd72f904154c2f60d9b
		<form action="/main/okBook" method="post" id="okBookForm">
			<input type="hidden" name="r_bno" value="${room.r_bno}" />
			<input type="hidden" name="r_name" value="${room.r_name}" />
			<input type="hidden" name="r_kind" value="${room.r_kind}" />
			<input type="hidden" name="r_people" value="${room.r_people}" />
			<input type="hidden" name="r_price" value="${room.r_price}" />
			<input type="hidden" name="r_base" value="${room.r_base}" />
			<input type="hidden" name="r_rent" value="${room.r_rent}" />
		</form>
	
<<<<<<< HEAD
		<div class="col-sm-offset-8">
			<button class="btn btn-info">이전단계</button>
			<button type="button" class="btn btn-primary okBook">다음단계</button>
		</div>			
=======
		<br/><br/>
		<ul class="btns">
			<li><button class="btn btn-info">이전단계</button></li>
			<li><button type="button" class="btn btn-primary okBook">다음단계</button></li>
		</ul>				
>>>>>>> 531fc7fd8aaf0aceabb5bfd72f904154c2f60d9b


<br /><br />

			</div>
		</div>
		
<br /><br />
				
<!-- 달력보여주기!!!!!!! 짱이지?! 			
<div id='calendar'></div>
<input type="button" id="btnAddTest" value="추가">
-->	
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
			dateClick : function(date) {
				// JSON.stringify(date)[17]+JSON.stringify(date)[18]
				// date["dateStr"]
				alert('요일 클릭!'+JSON.stringify(date));
				alert('요일 클릭!'+date["dateStr"]);
			},
			
			// 일정 클릭 이벤트
			eventClick : function(date) {
				
				alert('팬션 클릭!'+JSON.stringify(date));
				var arrCal = calendar.getEvents(); 
				// arrCal[1].title
				// alert(JSON.stringify(date)[114]+JSON.stringify(date)[115]);
				
				return false;
				
				if (JSON.stringify(date)[114]+JSON.stringify(date)[115] == "글램") {
					alert('글램핑 클릭! book_gp.jsp로 이동');
					// location.href="book_gp";
				}  else if (JSON.stringify(date)[114]+JSON.stringify(date)[115] == "데크") {
					alert('데크 클릭! book_dk.jsp로 이동');
					// location.href="book_dk";
				} else if (JSON.stringify(date)[114]+JSON.stringify(date)[115] == "카라") {
					alert('카라반 클릭! book_kb.jsp로 이동');
					// location.href=book_kb;
				} else if (JSON.stringify(date)[114]+JSON.stringify(date)[115] == "펜션") {
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

<%@ include file="../include/footer.jsp" %>
</body>
<script>
$('.okBook').click(function(){
	alert("버튼이 눌리나요??");
	$('#okBookForm').submit();
	
});
</script>
</html>