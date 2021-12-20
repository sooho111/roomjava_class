<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="bheader">
	<div class="inner">
		<h1><a href="/"><img src="../../../resources/images/logo2.png" alt="logo" width="200" /></a></h1>

			<ul>
				<li class="logout"><a href="#">로그아웃</a></li>
			</ul>

			<ul class="gnb">
				<li><a href="/admin/payment/paymentList"><span class="glyphicon glyphicon-barcode"></span> 결제 수단</a></li>
           		<li><a href="#"><span class="glyphicon glyphicon-plane"></span> 저쩌구</a></li>
           		<li><a href="/admin/member/memberList"><span class="glyphicon glyphicon-user"></span> 회원 목록 </a></li>
           		<li><a href="/admin/notice/noticeList"><span class="glyphicon glyphicon-volume-up"></span> 공지사항</a></li>
			</ul>
	</div>
</div>

<script>
$('.logout').click(function(){
	var result = confirm("로그아웃 하시겠습니까?");
	if(result){
		location.href="/member/logout";
	} 
});
</script>