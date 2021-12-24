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

.chFnc { font-size:15px; margin-top:-5px; margin-right:15px; }
.btn { vertical-align:text-top; }
.bang { margin-top:6px; }

#start_Date, #end_Date { cursor:pointer; }
.btns { margin-bottom:40px; }

</style>	
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="container">
	<div class="inner">
		<div id="showRooms">
			<div align="center"><img src="/resources/images/gobook.jpg" alt="images" width="450px" height="450px" /></div>
		</div>
				
		<br/><br/><br/>
		<form class="form form-horizontal" action="/main/okBook" method="post" id="okBookForm">
			<div class="form-group">
				<label class="control-label col-sm-4">예약자 이름</label>
				<div class="col-sm-3">
					<c:if test="${member != null}">
						<input type="text" class="form-control" name="book_name" id="m_name" maxlength="50" value="${member.m_name}" />
					</c:if>
					<c:if test="${member == null}">
						<input type="text" class="form-control" name="book_name" id="m_name" maxlength="50" />
					</c:if>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-4">예약 인원</label>
				<div class="col-sm-3">
					<select class="form-control plusM" name="book_people">
						<% int p=1; %>
						<c:forEach var="i" begin="0" end="2" step="1">
							<c:if test="${room.r_people == room.r_people+i}">
								<option value="${room.r_people+i}" selected="selected">${room.r_people+i}</option>
							</c:if>
							
							<c:if test="${room.r_people != room.r_people+i}">
								<option value="${room.r_people+i}">${room.r_people+i} (+<%=p++%>0,000원)</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
			</div>	
					
			<div class="form-group">
				<label class="control-label col-sm-4">예약자 전화번호</label>
				<div class="col-sm-4">
					<c:if test="${member != null}">
						<input type="text" class="form-control" name="book_tel" id="m_tel" maxlength="50" value="${member.m_tel}" />
					</c:if>
					<c:if test="${member == null}">
						<input type="text" class="form-control" name="book_tel" id="m_tel" maxlength="50" />
					</c:if>
				</div>
			</div>	
			
			<div class="form-group">
				<label class="control-label col-sm-4">방 기능</label>
				<div class="col-sm-7 bang">
					<c:forEach var="fnc" items="${fnc}">
						<input class="btn bFnc" type="checkbox" name="room_fnc" value="${fnc.fnc_price}" /> <span class="chFnc">${fnc.fnc_name} <fmt:formatNumber value="${fnc.fnc_price}" />원</span>
					</c:forEach>
					<input type="checkbox" name="room_fnc" value="0" class="btn bFnc" /> <span class="chFnc">없음</span>
				</div>
			</div>
			
			<input type="hidden" name="r_bno" value="${room.r_bno}" />
		
			<div class="form-group">
				<label class="control-label col-sm-4">렌트</label>
				<div class="col-sm-5 bang">
					<c:forEach var="rent" items="${rent}">
						<input class="btn bRent" type="checkbox" name="room_rent" value="${rent.rent_price}" /> <span class="chFnc">${rent.rent_name} <fmt:formatNumber value="${rent.rent_price}" />원</span>
					</c:forEach>
					<input type="checkbox" value="0" name="room_rent" class="btn bRent" /> <span class="chFnc">없음</span>
				</div>
			</div>		
		
			<div class="form-group">
				<label class="control-label col-sm-4">결제 수단</label>
				<div class="col-sm-5">
					<select class="form-control" name="payment" id="payment">
						<c:forEach var="payment" items="${payment}">
							<option value="${payment.pay_name}">${payment.pay_name}, ${payment.pay_account}, ${payment.pay_bank}</option>
						</c:forEach>
					</select>
				</div>
			</div>
					
			<div class="form-group">
				<label class="control-label col-sm-4">예약 시작날짜</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="start_Date" name="start_date" readonly />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-4">예약 종료날짜</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="end_Date" name="end_date" readonly />
					<input type="hidden" id="days" name="days" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-4">총 가격</label>
				<div class="col-sm-2">
					<input type="text" class="form-control allM" value="<fmt:formatNumber value="${room.r_price}" />원" readonly="readonly"/>
					<input type="hidden" class="realM" name="r_price" value="${room.r_price}" />
				</div>
			</div>
		</form>
	
		<div class="col-sm-offset-7 btns">
			<button class="btn btn-info back">이전단계</button>
			<button type="button" class="btn btn-primary okBook">다음단계</button>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>
</body>
<script>
$('.okBook').click(function(){
	
	if($('#m_name').val() == "") {
		alert("예약자를 입력해야합니다.");
		$('#m_name').focus();
		return false;
	}
	
	if($('#m_tel').val() == "") {
		alert("전화번호를 입력해야합니다.");
		$('#m_tel').focus();
		return false;
	}
	
	if($('#start_Date').val() == "") {
		alert("시작 날짜를 선택하십시오.");
		$('#start_Date').focus();
		return false;
	}
	
	if($('#end_Date').val() == "") {
		alert("종료 날짜를 선택하십시오.");
		$('#end_Date').focus();
		return false;
	}
	
	if($('.bFnc').is(":checked") == false) {
		alert("방 기능을 선택하세요.");
		return false;
	}
	
	if($('.bRent').is(":checked") == false) {
		alert("렌트 종류를 선택하세요.");
		return false;
	}

	$('#okBookForm').submit(); 
	
});

$("#end_Date").datepicker();
// $("#start_Date").datepicker();

$('.back').click(function(){
	history.go(-1);
});


$("#start_Date").datepicker( {
onClose : function( selectedDate ) {  // 날짜를 설정 후 달력이 닫힐 때 실행
              if( selectedDate != "" ) {
                  // xxx의 maxDate를 yyy의 날짜로 설정
                 $("#end_Date").datepicker("option", "minDate", selectedDate);
                 
	var ar1 = selectedDate.split('-');
	var aaa = Number(ar1[2])+3;
	var aar1 = selectedDate.join("", selectedDate.split("-"))
	alert("^^" + aar1);
	
             	$("#end_Date").datepicker("option", "maxDate", aar1);
              }
          }
} );

var sDate=0;
var eDate=0;

$('#start_Date').change(function(){
	var sdd = $('#start_Date').val();
    var edd = $('#end_Date').val();
    
    if(sDate == 1) {
		var re = confirm("날짜를 수정하시면 다시 예약을 해야합니다.");
		if(re){
			$('#start_Date').val("");
			history.go();		
		} else {
			$('#start_Date').val(dd);
		}
	}
    
	if(sdd && edd && $("#start_Date").val() >= $("#end_Date").val()){
		alert("정신차려 이 친구야");
		$("#end_Date").val("");
		return false;
	}
	sDate = 1;
});

var daysPay;

$('#end_Date').change(function(){
	
	if(eDate == 1) {
		var re = confirm("날짜를 수정하시면 다시 예약을 해야합니다.");
		if(re){
			history.go();		
		} else {
			$('#end_Date').val(dd);
		}
	}
	
	if($("#start_Date").val() >= $("#end_Date").val()){
		alert("정신차려 이 친구야");
		$("#end_Date").val("");
		return false;
	}
	
    var sdd = $('#start_Date').val();
    var edd = $('#end_Date').val();
    var ar1 = sdd.split('-');
    var ar2 = edd.split('-');
    var da1 = new Date(ar1[0], ar1[1], ar1[2]);
    var da2 = new Date(ar2[0], ar2[1], ar2[2]);
    var dif = da2 - da1;
    var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
    var cMonth = cDay * 30;// 월 만듬
    var cYear = cMonth * 12; // 년 만듬
    
	if(sdd && edd){
		$('#days').val(parseInt(dif/cDay));
		daysPay = $('#days').val();
	}
	
    if(daysPay > 1) { 
    	if($('.bFnc').is(":checked") == true && $('.bRent').is(":checked") == true) {
    		alert("둘다");
    		$('.allM').val( ( ( ( Number($('.realM').val()) ) * Number(daysPay) ) - (Number($('.bRent:checked').val())+Number($('.bFnc:checked').val())) ).toLocaleString()+"원" );
			$('.realM').val( ( ( Number($('.realM').val()) ) * Number(daysPay) ) - (Number($('.bRent:checked').val())+Number($('.bFnc:checked').val())) );
	    	
    	} else if($('.bRent').is(":checked") == true) {
    		alert("렌트만");
			$('.allM').val( ( ( ( Number($('.realM').val()) ) * Number(daysPay) ) - Number( $('.bRent:checked').val() ) ).toLocaleString()+"원" );
			$('.realM').val( ( ( Number($('.realM').val()) ) * Number(daysPay) ) - Number( $('.bRent:checked').val() ) );
			
    	} else if($('.bFnc').is(":checked") == true) {
			alert("방기능만");
   			$('.allM').val( ( ( (Number($('.realM').val()) ) * Number(daysPay) ) - Number($('.bFnc:checked').val()) ).toLocaleString()+"원" );
   	    	$('.realM').val( (Number($('.realM').val()) * Number(daysPay)) - Number($('.bFnc:checked').val()) );
    		
    	} else if ($('.bFnc').is(":checked") == false || $('.bRent').is(":checked") == false) {
    		alert("놉");
	    	$('.allM').val( ((Number($('.realM').val()) * Number(daysPay)) ).toLocaleString()+"원");
	    	$('.realM').val( (Number($('.realM').val()) * Number(daysPay)) );

    	}
    	
    } else if(daysPay == 1) {
    	$('.allM').val((Number($('.realM').val()) * Number(daysPay)).toLocaleString()+"원");
    	$('.realM').val(Number($('.realM').val()) * Number(daysPay));
    }
    
    eDate=1;
});

var dd;
var present;

$.datepicker.setDefaults({
	showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다. 
	changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다. 
	changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다. 
    dateFormat: 'yy-mm-dd',	//날짜 포맷이다. 보통 yy-mm-dd 를 많이 사용하는것 같다.
    prevText: '이전 달',	// 마우스 오버시 이전달 텍스트
    nextText: '다음 달',	// 마우스 오버시 다음달 텍스트
    closeText: '닫기', // 닫기 버튼 텍스트 변경
    currentText: '오늘', // 오늘 텍스트 변경
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더중 월 표시를 위한 부분
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더 중 월 표시를 위한 부분
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],	//한글 캘린더 요일 표시 부분
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	//한글 요일 표시 부분
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	// 한글 요일 표시 부분
    showMonthAfterYear: true,	// true : 년 월  false : 월 년 순으로 보여줌
    yearSuffix: '년',	//
    showButtonPanel: true,	// 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
    minDate: "+1D",
    maxDate: "",
	beforeShow: function (input, inst) { // 일자 선택되기전 이벤트 발생
        dd = $(this).val();
	},
	/* onSelect: function (dateText, inst) { // 일자 선택된 후 이벤트 발생
		var curDate = $("#start_Date").datepicker("getDate");  // Date return
		curDate.setDate( curDate.getDate() + 1 );
		$("#end_Date").datepicker("option", "maxDate", curDate+3);
	}*/
});

var m = 0;
var c = 0;

$('.plusM').change(function(){
	
	if($('.plusM option:selected').val() != ${room.r_people}){
		
		if($('.plusM option:selected').val() == ${room.r_people+1}) {
			
			if(c == 2 && sDate == 1) {
				m -= Number(daysPay) * 10000;
				
			} else if(c == 4 && sDate == 1) {
				m -= Number(daysPay) * 10000;
				
			} else if(sDate == 1) {
				m += Number(daysPay) * 10000;
				
			} else if(c == 2 || c == 4) {
				m -= 10000;
				
			} else {				
				m += 10000;
			}
			
			if($('.bFnc').is(":checked") == true || $('.bRent').is(":checked") == true) {
				$('.allM').val((Number($('.realM').val())+m).toLocaleString()+"원");
				$('.realM').val(Number($('.realM').val())+m);
				m=0;
				c=1;
				
			} else {
				$('.allM').val((Number($('.realM').val())+m).toLocaleString()+"원");
				$('.realM').val(Number($('.realM').val())+m);
				m=0;
				c=3;
			}

		} else if($('.plusM option:selected').val() == ${room.r_people+2}) {
			
			if(c == 1 && sDate == 1) {
				m += Number(daysPay) * 10000;
				
			} else if(c == 3 && sDate == 1) {
				m += Number(daysPay) * 10000;
				
			} else if(sDate == 1) {
				m += Number(daysPay) * 20000;
				
			} else if(c == 1 || c == 3) {
				m += 10000;
				
			} else {
				m += 20000;
			}
			
			if($('.bFnc').is(":checked") == true || $('.bRent').is(":checked") == true) {
				
				$('.allM').val((Number($('.realM').val())+m).toLocaleString()+"원");
				$('.realM').val(Number($('.realM').val())+m);
				m=0;
				c=2;
			} else {
				$('.allM').val((Number($('.realM').val())+m).toLocaleString()+"원");
				$('.realM').val(Number($('.realM').val())+m);
				m=0;
				c=4;
			}
		}
		
	} else {
		
		if(c == 1 && sDate == 1) {
			m -= Number(daysPay) * 10000;
			
		} else if(c==3 && sDate==1) {
			m -= Number(daysPay) * 10000;
			
		} else if(c==2 && sDate==1) {
			m -= Number(daysPay) * 20000;
			
		} else if(c==4 && sDate==1) {
			m -= Number(daysPay) * 20000;
			
		} else if(c == 1 || c == 3) {
			m -= 10000;
			
		} else if(c == 2 || c == 4) {
			m -= 20000;
		}
		
		if($('.bFnc').is(":checked") == true || $('.bRent').is(":checked") == true) {
			$('.allM').val((Number($('.realM').val())+m).toLocaleString()+"원");
			$('.realM').val(Number($('.realM').val())+m);
			m=0;
			c=0;
		} else {
			$('.allM').val((Number($('.realM').val())+m).toLocaleString()+"원");
			$('.realM').val(Number($('.realM').val())+m);
			m=0;
			c=0;
		} 
	}
});

$('.bFnc').change(function(){
	
	if($(this).is(":checked") == true){
		$('.allM').val((Number($('.realM').val())+Number($(this).val())).toLocaleString()+"원");
		$('.realM').val(Number($('.realM').val())+Number($(this).val()));
		
	} else if($(this).is(":checked") == false) {
		$('.allM').val((Number($('.realM').val())-Number($(this).val())).toLocaleString()+"원");
		$('.realM').val(Number($('.realM').val())-Number($(this).val()));
	}
	
});

$('.bRent').change(function(){
	
	if($(this).is(":checked") == true){
		$('.allM').val((Number($('.realM').val())+Number($(this).val())).toLocaleString()+"원");
		$('.realM').val(Number($('.realM').val())+Number($(this).val()));
		
	} else if($(this).is(":checked") == false) {
		$('.allM').val((Number($('.realM').val())-Number($(this).val())).toLocaleString()+"원");
		$('.realM').val(Number($('.realM').val())-Number($(this).val()));
	}
	
});


</script>
</html>