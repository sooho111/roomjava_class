<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="header">
	<div class="inner">
		<h1><a href="/"><img src="../resources/images/logo.png" alt="logo" width="200" /></a></h1>
		<c:if test="${member == null}">
			<ul>
				<li><a href="#">예약 확인 및 취소</a></li>
				<li><a href="../member/join">회원가입</a></li>
				<li><a href="../member/login">로그인</a></li>
			</ul>
		</c:if>
		
		<c:if test="${member != null}">
			<ul>
				<li><a href="#">내 정보</a></li>
				<li><a href="#">회원 탈퇴</a></li>
				<li class="logout"><a href="#">로그아웃</a></li>
			</ul>
		</c:if>
		
		<ul class="gnb">
		    <li><a href="#"><span class="glyphicon glyphicon-heart"></span> 시설 안내</a></li>
			<li><a href="#"><span class="glyphicon glyphicon-credit-card"></span> 예약 안내</a></li>
			<li><a href="#"><span class="glyphicon glyphicon-apple"></span> 커뮤니티</a></li>
			<li><a href="../room/story"><span class="glyphicon glyphicon-user"></span> 소개</a></li>
		</ul>
	</div>
</div>

<script>
$('.logout').click(function(){
	var result = confirm("로그아웃 하시겠습니까?");
	if(result){
		location.href="/mealkit/logout";
	} 
});
</script>