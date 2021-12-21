<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>방 상세 정보</title>
	<%@ include file="../include/includeFile.jsp" %>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<h1>방 상세 정보</h1>


<div class="container">
	<form class="form-horizontal" method="post" enctype="multipart/form-data" action="/main/goBook">
		<div class="inner">


	<div id="showRooms">
		<ul class="list">
			<li><img src="/resources/images/none.png" alt="images" width="230px" height="230px" /></li>	
			<li>${room.r_name}</li>
			<li class="r_price">${room.r_price}원</li>
		</ul>
		<ul class="roomPeopleCnt">
			<li>${room.r_people}인원</li>
			<li><button type="button" class="btn btn-sm minus">─</button> <span>1</span> <button type="button" class="btn btn-sm plus">┼</button></li>
		</ul><hr>
	</div>
		<ul class="btns">
			<li><button class="btn btn-info">이전단계</button></li>
			<li><button type="submit" class="btn btn-primary goBook" id="submit">다음단계</button></li>
		</ul>
		
			<input type="hidden" name="r_name" value="${list.r_name} + " />
			<input type="hidden" name="r_kind" value="${list.r_kind}" />
			<input type="hidden" name="r_people" value="${list.r_people}" />
			<input type="hidden" name="r_price" value="${list.r_price}" />
			<input type="hidden" name="r_base" value="${list.r_base}" />
			<input type="hidden" name="r_rent" value="${list.r_rent}" />
	
		<h1>시설 상세 정보 보기</h1>
			<div id="detail">
				<img src="/resources/images/photo1.jpg" alt="사진1" width="800px" />
				<br /><br />
				<img src="/resources/images/photo4.jpg" alt="사진2" width="800px" />
			</div>
		</div>
	</form>	
</div>

<%@ include file="../include/footer.jsp" %>
</body>
<script>

var i=1;
// 최소인원

$('.minus').click(function(){
	
	if(i<2) {
		alert("최소 인원은 1명입니다.");
	} else {
		i--;
		$('.roomPeopleCnt li:eq(1) span').text(i);
		// 최대인원 이하이면 정상가, 최대인원 이상이면 10,000원씩 빼주기
		// var price = Math.ceil(${mealkit.mk_price * (100- mealkit.mk_discount_rate) / 100});
		$('.roomPeopleCnt li:eq(1) span').text(Number(price * i).toLocaleString());
	}
});

$('.plus').click(function(){
	
	$.ajax({
		type:"POST",
        url :"/shop/goods_count",
        data:{ "cnt" : $('.goodsCnt li:eq(1) span').text(), "mk_id" : ${mealkit.mk_id} },
        success:function(result){
        	if(result <= $('.goodsCnt li:eq(1) span').text()) {
        		alert("밀키트 재고 수량을 초과했습니다.");
        	} else {
        		i++;
        		$('.goodsCnt li:eq(1) span').text(i);
				// 최소인원 1인에 방원래인원까지 정상가, 최대인원보다 많아지면 10,000원씩 추가
        		var price = Math.ceil(${mealkit.mk_price * (100- mealkit.mk_discount_rate) / 100});
        		$('.goodsPrice li:eq(1) span').text(Number(price * i).toLocaleString());
        	}
		}
	}); 
			
});



</script>
</html>