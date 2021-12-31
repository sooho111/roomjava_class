<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%! SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); %>
<%
String start_date = null;
String end_date = null;

if(request.getParameter("start_date") != null) {
	start_date = request.getParameter("start_date");
} else {
	start_date = null;
}

if(request.getParameter("end_date") != null) {
	end_date = request.getParameter("end_date");
} else {
	end_date = null;
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 리스트</title>
<%@ include file="../include/includeFile.jsp" %>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
#bheader .inner .gnb > li:nth-child(2) > a { font-weight:700; }
#container { margin-top:50px; }
#container .inner { width:1200px; }
#container .inner:after { content:""; clear:both; display:block; }

#allRooms { width:200px; float:left; }
.gTitle { font-size:25px; font-weight:700; color:#333; border-bottom:1px solid #777; padding-bottom:20px; margin-bottom:20px; }
.Rooms li { font-size:15px; margin-bottom:15px; }
.Rooms li a { color:#888; }
.Rooms li a:hover { color:#111; text-decoration:none; }

#showRooms { width:950px; float:right; position:relative; padding-bottom:50px; }
.list { float:left; width:230px; margin-right:20px; margin-bottom:30px; border:1px solid red; }
.list li a { color:#777; font-size:15px; }
.list li:nth-child(2) a { color:#333; font-size:23px; font-weight:500; }
.list li:first-child { margin-bottom:15px; }

.kindList:after { content:""; display:block; clear:both; }
.kindList { border:1px solid blue; }

#start_Date, #end_Date { cursor:pointer; }

</style>

</head>
<body>
<%@ include file="../include/header.jsp" %>

<div id="container">
	<div class="inner">
	
		<form class="form form-horizontal" action="/main/roomList" method="post" id="roomDate">
			<div class="form-group">
				<label class="control-label col-sm-4">예약 시작날짜</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="start_Date" name="start_date" value="" readonly />
				</div>
				<label class="control-label col-sm-1">예약 종료날짜</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="end_Date" readonly />
					<input type="hidden" id="real_end" name="end_date" />
				</div>
			</div>
		</form>
	
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
			<c:if test="${list.room_class != null}">
				<p class="gTitle">${list.room_class}</p>
			</c:if>
			<!--
			<c:forEach items="${alreadyRoom}" var="alreadyRoom">
				<li>${alreadyRoom.r_name}</li>
				
				<c:forEach items="${kinds}" var="kind">
					<c:if test="${list.room_class == null}">
						<p class="gTitle">${kind.room_class}</p>
					</c:if>
					
					<div class="kindList">
						<c:forEach items="${allRooms}" var="lists">
							<c:if test="${kind.room_bno == lists.r_kind}">
							
								<c:if test="${empty alreadyRoom}">
									<c:forEach items="${alreadyRoom}" var="alreadyRoom">
										<ul class="list">
											<li>
												<a href="roomView?r_bno=${alreadyRoom.r_bno}">
													<img src="/resources/images/none.png" alt="images" width="230px" height="230px" />
												</a>
											</li>
											<li><a href="roomView?r_bno=${alreadyRoom.r_bno}">${alreadyRoom.r_name}호</a></li>
											<li><a href="roomView?r_bno=${alreadyRoom.r_bno}"><fmt:formatNumber value="${alreadyRoom.r_price}" />원</a></li>
										</ul>
									</c:forEach>
								</c:if>
								
								<c:if test="${not empty alreadyRoom}">
								
									<ul class="list">
										<li>
											<a href="roomView?r_bno=${lists.r_bno}">
												<img src="/resources/images/none.png" alt="images" width="230px" height="230px" />
											</a>
										</li>
										<li><a href="roomView?r_bno=${lists.r_bno}">${kind.room_class} ${lists.r_name}호</a></li>
										<li><a href="roomView?r_bno=${lists.r_bno}"><fmt:formatNumber value="${lists.r_price}" />원</a></li>
									</ul>
								</c:if>

							</c:if>
						</c:forEach>
					</div>
				</c:forEach>
			</c:forEach>
			
			<c:forEach items="${alreadyRoom}" var="alreadyRoom">
				<li>${alreadyRoom.r_name}</li>
			</c:forEach>
			-->
			<c:forEach items="${kinds}" var="kind">
				<c:if test="${list.room_class == null}">
					<p class="gTitle">${kind.room_class}</p>
				</c:if>
				
				<c:if test="${empty alreadyRoom}">
					<div class="kindList">
						<c:forEach items="${allRooms}" var="lists">
							<c:if test="${kind.room_bno == lists.r_kind}">
								<ul class="list">
									<li class="suntac">
										<a href="roomView?r_bno=${lists.r_bno}&start_date=<%=start_date%>&end_date=<%=end_date%>">
											<img src="/resources/images/none.png" alt="images" width="230px" height="230px" />
										</a>
									</li>
									<li><a href="roomView?r_bno=${lists.r_bno}">${kind.room_class} ${lists.r_name}호</a></li>
									<li><a href="roomView?r_bno=${lists.r_bno}"><fmt:formatNumber value="${lists.r_price}" />원</a></li>
								</ul>
							</c:if>
						</c:forEach>
					</div>
				</c:if>
				
				<c:if test="${not empty alreadyRoom}">
					<div class="kindList">
						<c:forEach items="${allRooms}" var="lists">
							<c:forEach items="${alreadyRoom}" var="alreadyRoom">
								<c:if test="${lists.r_bno != alreadyRoom.r_bno && kind.room_bno == lists.r_kind}">
									<ul class="list">
										<li>
											<form action="/main/roomView">
												<a href="roomView?r_bno=${lists.r_bno}&start_date=<%=start_date%>&end_date=<%=end_date%>">
													<img src="/resources/images/none.png" alt="images" width="230px" height="230px" />
													<input type="hidden" name="r_bno" value="${lists.r_bno}" />
													<input type="hidden" name="start_date" class="start" />
													<input type="hidden" name="end_date" class="end" />
												</a>
											</form>
										</li>
										<li><a href="roomView?r_bno=${lists.r_bno}">${kind.room_class} ${lists.r_name}호</a></li>
										<li><a href="roomView?r_bno=${lists.r_bno}"><fmt:formatNumber value="${lists.r_price}" />원</a></li>
									</ul>
								</c:if>
							</c:forEach>
						</c:forEach>
					</div>
				</c:if>
				
			</c:forEach>
			
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

$('.suntac').click(function(){
	if($('#start_Date').val() == "") {
		alert("입실 날을 먼저 선택해주세요.");
		return false;
	} 
	
	if($('#end_Date').val() == "") {
		alert("퇴실 날을 먼저 선택해주세요.");
		return false;
	}
});

$("#start_Date").datepicker({
	onClose : function( selectedDate ) {  // 날짜를 설정 후 달력이 닫힐 때 실행
		if( selectedDate != "" ) {
			// xxx의 maxDate를 yyy의 날짜로 설정
			$("#end_Date").datepicker("option", "minDate", selectedDate);
			
			var ar1 = selectedDate.split('-');
			var aaa = Number(ar1[2])+2;
			ar1[2] = aaa;
			var aar2 = ar1.join("-")
			
			$("#end_Date").datepicker("option", "maxDate", aar2);
			$("#end_Date").next().css({ display:"none", });
		}
	}
} );

var daysPay;

$("#end_Date").datepicker({
	onClose : function( selectedDate ) {  // 날짜를 설정 후 달력이 닫힐 때 실행
		if( selectedDate != "" ) {
			
			var b1 = selectedDate.split('-');
			var sdd = $('#start_Date').val();
		    var ar1 = sdd.split('-');
		    var da1 = new Date(ar1[0], ar1[1], ar1[2]);
		    var da2 = new Date(b1[0], b1[1], b1[2]);
		    var dif = da2 - da1;
		    var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
		    var cMonth = cDay * 30;// 월 만듬
		    var cYear = cMonth * 12; // 년 만듬
		    
			if(sdd && selectedDate) {
				daysPay = parseInt(dif/cDay);
			}
		    
			if(daysPay > 1) {
				var bb = Number(b1[2])-1;
				b1[2] = "0" + bb;
				var bb2 = b1.join("-")
				$('#real_end').val(bb2);
			} else {
				var bb = Number(b1[2]);
				b1[2] = "0" + bb;
				var bb2 = b1.join("-")
			}
			
			$('#roomDate').submit();
		}
	}
} );

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
        // haveBookDay();
	},
	// beforeShowDay : disableDay
});
/*
function haveBookDay() {
	
	$.ajax({
		type : "post",
		url : "/main/haveBookDay",
		data : {},
		success : function(result) {
			//for(var e in result){
				//exam[e] = result;
			//}
		},
		error : function() {
			alert("값없음");
		}
	});
}

var exam = ['2021-12-30', '2021-12-31'];

function disableDay(date) {	
    var m = date.getMonth(),
    	d = date.getDate(), 
    	y = date.getFullYear();
    
    for (i = 0; i < exam.length; i++) {
    	
        if($.inArray(y + '-' +(m+1) + '-' + d , exam) != -1) {
            return [false];
        }
    }
    return [true];
}
*/

</script>
</html>