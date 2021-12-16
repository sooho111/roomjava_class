<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
p{
	color:#ffffff;
}
</style>
<div id="header">
	<div class="inner">
		<h1><a href="/"><img src="../resources/images/logo.png" alt="logo" width="200" /></a></h1>
		<c:if test="${member == null}">
			<ul class="log">
				<li><a href="#">예약 확인 및 취소</a></li>
				<li><a href="../member/memberInsert">회원가입</a></li>
				<li><a href="../member/login">로그인</a></li>
			</ul>
		</c:if>
		
		<c:if test="${member != null}">
			<ul class="log">
				<li><a href="../member/myPage">내 정보</a></li>
				<li class="logout"><a href="#">로그아웃</a></li>
				<c:if test="${member.m_power == 1}">
					<li><p class="mi" align="center"><a href="/admin/adminMain">관리자 페이지로</a></p></li>
				</c:if>
				<c:if test="${member.m_power != 1}">
					<li><p>${member.m_name}님 환영합니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></li>
				</c:if>
			</ul>
		</c:if>
		
		<ul class="gnb">
		    <li><a href="#"><span class="glyphicon glyphicon-heart"></span> 시설 안내</a>
		    	<ul class="infra">
			    	<c:forEach items="${roomKind}" var="room">
						<li><a href="#">${room.room_class}</a></li>
					</c:forEach>
		    	</ul>
		    </li>
		    
			<li><a href="#"><span class="glyphicon glyphicon-credit-card"></span> 예약 안내</a>
				<ul class="reservation">
					<li><a href="../main/calen">예약 하기</a></li>
					<li><a href="#">예약 확인 및 취소</a></li>
				</ul>
			</li>
			
			<li><a href="#"><span class="glyphicon glyphicon-apple"></span> 커뮤니티</a>
				<ul class="comunity">
					<li><a href="member/notice">공지 사항</a></li>
					<li><a href="#">후기</a></li>
					<li><a href="#">FAQ</a></li>
				</ul>
			</li>
			<li><a href="../main/introduce"><span class="glyphicon glyphicon-user"></span> 소개</a></li>
		</ul>
	</div>
</div>

<script>
/*
$('.logout').click(function(){
	var result = confirm("로그아웃 하시겠습니까?");
	
});
*/
</script>