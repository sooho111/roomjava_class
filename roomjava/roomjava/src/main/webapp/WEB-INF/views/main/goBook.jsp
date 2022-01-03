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
		
			<input type="hidden" id="start_Date" name="start_date" value="${start_date}" />
			<input type="hidden" id="end_Date" name="end_date" value="${end_date}" />
			<input type="hidden" id="days" name="days" />
			
			<div class="form-group">
				<label class="control-label col-sm-4">예약자 이름</label>
				<div class="col-sm-3">
					<c:if test="${member != null}">
						<input type="text" class="form-control" name="m_name" id="m_name" maxlength="50" value="${member.m_name}" />
					</c:if>
					<c:if test="${member == null}">
						<input type="text" class="form-control" name="m_bname" id="m_bname" maxlength="50" />
						<input type="text" name="m_name" id="m_name" value="master" />
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
						<input class="btn bFnc" type="checkbox" name="r_fnc" value="${fnc.fnc_name}" />
						<input type="hidden" value="${fnc.fnc_price}" />
						<span class="chFnc">${fnc.fnc_name} <fmt:formatNumber value="${fnc.fnc_price}" />원</span>
					</c:forEach>
					<input type="checkbox" value="없음" name="r_fnc" class="btn bFncNo" />
					<input type="hidden" value="0" /><span class="chFnc">없음</span>
				</div>
			</div>
			
			<input type="hidden" name="r_bno" value="${room.r_bno}" />
			<input type="hidden" name="r_name" value="${room.r_name}" />
			<input type="hidden" name="r_kind" value="${room.r_kind}" />
			<c:forEach items="${kinds}" var="kind">
				<c:if test="${kind.room_bno == room.r_kind}">
					<input type="hidden" name="room_class" value="${kind.room_class}" />
				</c:if>
			</c:forEach>
		
			<div class="form-group">
				<label class="control-label col-sm-4">렌트</label>
				<div class="col-sm-5 bang">
					<c:forEach var="rent" items="${rent}">
						<input class="btn bRent" type="checkbox" name="r_rent" value="${rent.rent_name}" />
						<input type="hidden" value="${rent.rent_price}" />
						<span class="chFnc">${rent.rent_name} <fmt:formatNumber value="${rent.rent_price}" />원</span>
					</c:forEach>
					<input type="checkbox" value="없음" name="r_rent" class="btn bRentNo" /> 
					<input type="hidden" value="0" /><span class="chFnc">없음</span>
				</div>
			</div>		
		
			<div class="form-group">
				<label class="control-label col-sm-4">결제 수단</label>
				<div class="col-sm-5">
					<select class="form-control" name="payment" id="payment">
						<c:forEach var="payment" items="${payment}">
							<option value="${payment.pay_name}, ${payment.pay_account}, ${payment.pay_bank}">${payment.pay_name}, ${payment.pay_account}, ${payment.pay_bank}</option>
						</c:forEach>
					</select>
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
	
	if($('#m_bname').val() == "" || $().val('#m_bname')=="") {
		alert("예약자를 입력해야합니다.");
		$('#m_name').focus();
		return false;
	}
	
	if($('#m_tel').val() == "") {
		alert("전화번호를 입력해야합니다.");
		$('#m_tel').focus();
		return false;
	}
	
	if($('.bFnc').is(":checked") == false && $('.bFncNo').is(":checked") == false) {
		alert("방 기능을 선택하세요.");
		return false;
	}
	
	if($('.bRent').is(":checked") == false && $('.bRentNo').is(":checked") == false) {
		alert("렌트 종류를 선택하세요.");
		return false;
	}

	$('#okBookForm').submit(); 
	
});

$('.back').click(function(){
	history.go(-1);
});

var daysPay;
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

if(daysPay >= 1) {
   	$('.allM').val((${room.r_price} * Number(daysPay)).toLocaleString()+"원");
   	$('.realM').val(${room.r_price} * Number(daysPay));
}
   
var dd;
var present;

var m = 0;
var c = 0;

$('.plusM').change(function(){
	
	if($('.plusM option:selected').val() != ${room.r_people}){
		
		if($('.plusM option:selected').val() == ${room.r_people+1}) {
			
			if(c == 2) {
				m -= Number(daysPay) * 10000;
				
			} else {				
				m += Number(daysPay) * 10000;
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
				c=1;
			}

		} else if($('.plusM option:selected').val() == ${room.r_people+2}) {
			
			if(c == 1) {
				m += Number(daysPay) * 10000;
				
			} else {
				m += Number(daysPay) * 20000;
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
				c=2;
			}
		}
		
	} else {
		
		if(c == 1) {
			m -= Number(daysPay) * 10000;
			
		} else if(c==2) {
			m -= Number(daysPay) * 20000;	
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

$('.bFncNo').change(function(){
	
	if($(this).is(":checked") == true) {
		
		if($('.bFnc').is(":checked") == true && c == 2) {
			m=0;
			m = Number(daysPay) * 20000;
			$('.allM').val(((${room.r_price} * Number(daysPay))+m).toLocaleString()+"원");
		   	$('.realM').val((${room.r_price} * Number(daysPay))+m);
		   	m=0;
		   	
		} else if($('.bFnc').is(":checked") == true && c == 0) {
			$('.allM').val((${room.r_price} * Number(daysPay)).toLocaleString()+"원");
		   	$('.realM').val(${room.r_price} * Number(daysPay));
		}
		
		$('.bFnc').prop('checked', false);
		$('.bFnc').attr('disabled', true);
		
	} else if($(this).is(":checked") == false) {
		$('.bFnc').removeAttr('disabled');
	}
	
});

$('.bFnc').change(function(){
	
	if($(this).is(":checked") == true){
		
		if(daysPay >= 1) {
			$('.allM').val((Number($('.realM').val()) + Number($(this).next().val())*Number(daysPay)).toLocaleString()+"원");
			$('.realM').val(Number($('.realM').val()) + Number($(this).next().val())*Number(daysPay));
			
		} else {
			$('.allM').val((Number($('.realM').val()) + Number($(this).next().val())).toLocaleString()+"원");
			$('.realM').val(Number($('.realM').val()) + Number($(this).next().val()));
		}
		
	} else if($(this).is(":checked") == false) {
		
		if($(this).val() == "없음") {
			$('.bFnc').removeAttr('disabled');
		}
		
		if(daysPay >= 1) {
			$('.allM').val((Number($('.realM').val()) - Number($(this).next().val())*Number(daysPay)).toLocaleString()+"원");
			$('.realM').val(Number($('.realM').val()) - Number($(this).next().val())*Number(daysPay));
			
		} else {
			$('.allM').val((Number($('.realM').val()) - Number($(this).next().val())).toLocaleString()+"원");
			$('.realM').val(Number($('.realM').val()) - Number($(this).next().val()));
		}
		
	}
	
});

$('.bRentNo').change(function(){
	
	if($(this).is(":checked") == true) {
		
		if($('.bRent').is(":checked") == true && c == 1) {
			m=0;
			m += Number(daysPay) * 10000;
			
			$('.allM').val(((${room.r_price} * Number(daysPay))+m).toLocaleString()+"원");
		   	$('.realM').val((${room.r_price} * Number(daysPay))+m);
		   	m=0;
		   	
		} else if($('.bRent').is(":checked") == true && c == 0) {
			$('.allM').val((${room.r_price} * Number(daysPay)).toLocaleString()+"원");
		   	$('.realM').val(${room.r_price} * Number(daysPay));
		}
	   	
		$('.bRent').prop('checked', false);
		$('.bRent').attr('disabled', true);
		
	} else if($(this).is(":checked") == false) {
		$('.bRent').removeAttr('disabled');
	}
	
});

$('.bRent').change(function(){
	
	if($(this).is(":checked") == true){
		
		if($(this).val() == "없음") {
			$('.bRent').attr('disabled', true);
			$(this).removeAttr('disabled');
		}
		
		if(daysPay >= 1) {
			$('.allM').val((Number($('.realM').val()) + Number($(this).next().val())*Number(daysPay)).toLocaleString()+"원");
			$('.realM').val(Number($('.realM').val()) + Number($(this).next().val())*Number(daysPay));
			
		} else {
			$('.allM').val((Number($('.realM').val()) + Number($(this).next().val())).toLocaleString()+"원");
			$('.realM').val(Number($('.realM').val()) + Number($(this).next().val()));
		}
		
	} else if($(this).is(":checked") == false) {
		
		if($(this).val() == "없음") {
			$('.bRent').removeAttr('disabled');
		}
		
		if(daysPay >= 1) {
			$('.allM').val((Number($('.realM').val()) - Number($(this).next().val())*Number(daysPay)).toLocaleString()+"원");
			$('.realM').val(Number($('.realM').val()) - Number($(this).next().val())*Number(daysPay));
			
		} else {
			$('.allM').val((Number($('.realM').val()) - Number($(this).next().val())).toLocaleString()+"원");
			$('.realM').val(Number($('.realM').val()) - Number($(this).next().val()));
		}
	}
	
});


</script>
</html>