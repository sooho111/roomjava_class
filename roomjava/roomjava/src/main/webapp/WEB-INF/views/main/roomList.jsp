<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%! SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); %>

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
.list { float:left; width:230px; margin-right:20px; margin-bottom:30px; }
.list li { color:#777; font-size:15px; }
.list li:nth-child(2) { color:#333; font-size:23px; font-weight:500; }
.list li:first-child { margin-bottom:15px; }

.kindList:after { content:""; display:block; clear:both; }

#start_Date, #end_Date { cursor:pointer; }

</style>

</head>
<body>
<%@ include file="../include/header.jsp" %>

<div id="container">
	<div class="inner">
	
		<form class="form form-horizontal" action="/main/roomView" id="roomDate">
		
			<div class="form-group">
				<label class="control-label col-sm-4">예약 시작날짜</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="start_Date" name="start_date" readonly />
					<input type="hidden" id="start" value="N" />
				</div>
				
				<label class="control-label col-sm-1">예약 종료날짜</label>
				<div class="col-sm-2">
					<input type="hidden" id="real_end" name="end_date" />
					<input type="text" class="form-control" id="end_Date" readonly />
					<input type="hidden" id="end" value="N" />
				</div>
			</div>
			
			<div id="allRooms">
				<p class="gTitle">모든 방</p>
	
				<ul class="Rooms">
					<c:forEach items="${kinds}" var="kind">
						<li><a href="/main/roomList?room_bno=${kind.room_bno}">${kind.room_class}</a></li>
					</c:forEach>
				</ul>
			</div>
			
			<div id="showRooms">
				<c:if test="${list.room_class != null}">
					<p class="gTitle">${list.room_class}</p>
				</c:if>
				
				<c:forEach items="${kinds}" var="kind">
					<c:if test="${list.room_class == null}">
						<p class="gTitle">${kind.room_class}</p>
					</c:if>
					
					<div class="kindList">
						<c:forEach items="${allRooms}" var="lists">
							<c:if test="${kind.room_bno == lists.r_kind}">
								<ul class="list">
									<li>
										<a class="suntac" href="#">
											<img src="/resources/images/none.png" alt="images" width="230px" height="230px" />
										</a>
										<input type="hidden" value="${lists.r_bno}" id="r_bno" name="r_bno" />
									</li>
									<li>${kind.room_class} ${lists.r_name}호</li>
									<li><fmt:formatNumber value="${lists.r_price}" />원</li>
								</ul>
							</c:if>
						</c:forEach>
						
					</div>
				</c:forEach>
			</div>
		</form>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>

<script>

$('.suntac').click(function(){
	if($('#start').val() == "N") {
		alert("입실 날을 먼저 선택해주세요.");
		return false;
	} 
	
	if($('#end').val() == "N") {
		alert("퇴실 날을 먼저 선택해주세요.");
		//alert("^^" + $('#real_end').val());
		return false;
	}
	
	var r_bno = $(this).next().val();
	
	$.ajax({
		type : "post",
		url : "/main/haveBookDay",
		data : { "r_bno" : r_bno, "start_date" : $('#start_Date').val(), "end_date" : $('#real_end').val() } ,
		success : function(result) {
			if(result >= 1) {
				alert("이미 예약된 방입니다.");
			} else {
				$('#r_bno').val(r_bno);
				$('#roomDate').submit();
			}
		},
		error : function() {
			alert("값없음");
		}
	});
	
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
			$('#start').val("Y");
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
		    
			if(daysPay >= 1) {
				var bb = Number(b1[2])-1;
				if(bb < 10) {
					b1[2] = "0" + bb;					
				} else {
					b1[2] = bb;
				}
				var bb2 = b1.join("-")
				$('#real_end').val(bb2);
			} else {
				var bb = Number(b1[2]);
				if(bb < 10) {
					b1[2] = "0" + bb;					
				} else {
					b1[2] = bb;
				}
				var bb2 = b1.join("-")
				$('#real_end').val(bb2);
			}
			$('#end').val("Y");
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
});

</script>
</html>