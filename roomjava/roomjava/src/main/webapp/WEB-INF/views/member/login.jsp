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
		<form class="form-horizontal" action="/member/login" method="post" id="loginform">
			<!-- 로그인을 하지 않고 들어온 경우 -->
		<c:if test="${member == null}">

			<div class="form-group">
				<label class="control-label col-sm-4">아이디</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="m_id" name="m_id"
						maxlength="16" placeholder="Enter username" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-4">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" class="form-control" id="password"
						placeholder="Enter password" name="m_pwd">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-6">
					<button type="submit" class="btn btn-primary btn-sm" id="submit">로그인</button>
					<button class="btn btn-danger btn-sm" type="button" id="registerBtn">회원가입</button>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-6">
					<button class="btn btn-light" type="button" id="findidBtn">아이디찾기</button>
					<button class="btn btn-light" type="button" id="findpwBtn">비밀번호찾기</button>
				</div>
			</div>
		</c:if>

		<!-- 로그인을 하고 들어온 경우 -->
		<!-- 세션을 체크하기 위해서는 상단에 page session값을 true로 설정해야 한다. -->
		<c:if test="${member != null}">

			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-6">
					<div class="jumbotron">
						<p class="hi" align="center">${member.m_name}님 &nbsp;환영합니다.</p>
						<c:if test="${member.m_power == 1}">
							<p class="mi" align="center">
								<a href="/admin/adminMain">관리자 페이지로</a>
							</p>
						</c:if>
					</div>
				</div>
			</div>

			<input type="hidden" id="m_id" name="id" value="${member.m_id}" />
		</c:if>
		
		<c:if test="${msg == false}">
			<div class="col-sm-offset-2 col-sm-7" align="center">
				<p class="no">로그인을 실패하였습니다.</p>
				<p class="no">아이디와 비밀번호를 확인하신 후에 다시 하십시오.</p>
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

	// 로그인 버튼을 눌렀을 경우
	$("#submit").on("click", function() {

		if ($("#m_id").val() == "") { // 아이디를 입력하지 않았으면
			alert("아이디를 입력하십시오.");
			$("#m_id").focus();
			return false;
		}
		if ($("#password").val() == "") { // 비밀번호를 입력하지 않았으면
			alert("비밀번호를 입력하십시오.");
			$("#password").focus();
			return false;
		}
		document.getElementById("loginForm").submit();
		return false;
	});
	// 회원탈퇴버튼을 눌렀을 경우 회원탈퇴 페이지로 이동한다.
	$("#memberDeleteBtn").on("click", function() {
		location.href = "/member/memberDelete/" + $("#m_id").val();
	});


	// 아이디찾기
	$("#findidBtn").on("click", function() {
		location.href = "/member/findidpage";
	});

	// 비밀번호찾기
	$("#findpwBtn").on("click", function() {
		location.href = "/member/findpwpage";
	});
</script>
</html>