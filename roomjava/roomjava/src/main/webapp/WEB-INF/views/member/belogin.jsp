<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="../include/includeFile.jsp"%>
<style>
.container { margin-top:50px; margin-bottom:50px; }
.container .inner {	width:1000px; }
.jumbotron p.hi { font-size:20px; font-weight:500; }
.jumbotron .mi { font-size:18px; font-weight:300; margin:0; }
.no { font-size:15px; margin-top:15px; }
</style>
</head>

<body>
<%@ include file="../include/header.jsp"%>
<div class="container">
	<div class="inner">
		<form class="form-horizontal" action="/member/belogin" method="post" id="beloginform">
			<!-- 로그인을 하지 않고 들어온 경우 -->
		<c:if test="${member == null}">

			
			
			<div class="form-group">
				<label class="control-label col-sm-4">이름</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="book_name" name="book_name"
						maxlength="16" placeholder="Enter username" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-4">전화번호</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="book_tel"
						placeholder="Enter tel" name="book_tel">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-6">
					<button type="submit" class="btn btn-light" id="submit">예약 확인</button>
					<button class="btn btn-light" type="button" id="loginBtn">로그인 하러가기</button>
				</div>
			</div>
		</c:if>

		</form>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>
</body>

<script>
	// 로그아웃 버튼을 눌렀을 경우
	$("#logoutBtn").on("click", function() {
		location.href = "/member/logout";
	});

	// 예약확인 버튼을 눌렀을 경우
	$("#submit").on("click", function() {

		if ($("#book_name").val() == "") { // 이름를 입력하지 않았으면
			alert("이름를 입력하십시오.");
			$("#book_name").focus();
			return false;
		}
		if ($("#book_tel").val() == "") { // 번호를 입력하지 않았으면
			alert("전화번호를 입력하십시오.");
			$("#book_tel").focus();
			return false;
		}
		document.getElementById("beloginform").submit();
		return false;
	});


	// 로그인하러가기
	$("#loginBtn").on("click", function() {
		location.href = "/member/login";
	});


</script>
</html>