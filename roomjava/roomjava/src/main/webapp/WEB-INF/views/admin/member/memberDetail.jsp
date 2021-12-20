<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 상세 정보</title>
<%@ include file="../../include/includeFile.jsp" %>
</head>
<body>
<%@ include file="../../include/m_header.jsp" %>

<div class="container"style="padding-left:15%; padding-top:5%;">
	<h3>회원 상세 정보</h3>
	
	<form class="form-horizontal" action="/admin/member/update" method="post">
		<div class="form-group">
			<label class="control-label col-sm-2">회원번호</label>
			<div class="col-sm-5">
				<input class="form-control" value="${detail.m_bno}" readonly="readonly" name="m_bno" />
			</div>		
		</div>
				<div class="form-group">
			<label class="control-label col-sm-2">아이디</label>
			<div class="col-sm-5">
				<input class="form-control" value="${detail.m_id}" readonly="readonly" name="m_id"/>
			</div>		
		</div>
		<div class="form-group">
			<label class="control-label col-xs-2">비밀번호</label>
			<div class="col-sm-2">
				<input type="text"class="form-control" value="${detail.m_pwd}" name="m_pwd" />
			</div>		
		</div>
		<div class="form-group">
			<label class="control-label col-xs-2">이름</label>
			<div class="col-sm-3">
				<input class="form-control" readonly value="${detail.m_name}"name="m_name" />
			</div>		
		</div>
		<div class="form-group">
			<label class="control-label col-xs-2">휴대폰</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" value="${detail.m_tel}" name="m_tel"/>
			</div>		
		</div>
		<div class="form-group">
			<label class="control-label col-xs-2">이메일</label>
			<div class="col-sm-3">
				<input type="text"class="form-control" value="${detail.m_email}" name="m_email"/>
			</div>		
		</div>
				<div class="form-group">
			<label class="control-label col-xs-2">주소</label>
			<div class="col-sm-6">
				<input type="text"class="form-control" readonly value="${detail.m_address}" name="m_address"/>
			</div>		
		</div>

		<div class="form-group">
			<label class="control-label col-xs-2">생년월일</label>
			<div class="col-sm-3">
				<input type="text"class="form-control" value="${detail.m_birth}" name="m_birth"/>
			</div>		
		</div>

		<c:if test="${m_power == 1 }">
		<div class="form-group">
			<label class="control-label col-xs-2">권한 부여</label>
			<div class="col-sm-3">
				<input type="text"class="form-control" id="m_power" value="${detail.m_power}" name="m_power"/>
			</div>		
		</div>
		</c:if>
		<c:if test="${m_power != 1 }">
			<div class="form-group">
			<label class="control-label col-xs-2">권한 부여</label>
			<div class="col-sm-3">
				<input type="text"class="form-control" id="m_power" readonly value="${detail.m_power}" name="m_power"/>
			</div>		
		</div>
		</c:if>
		<div class="form-group">
			<div class="col-xs-offset-4 col-xs-3">
				<button type="button" class="btn btn-primary" onclick="location.href='/admin/member/memberList'">회원목록</button>
				<button type="submit" class="btn btn-primary" id="submit">수정</button>
				<button type="button" class="btn btn-primary" onclick="location.href='/admin/member/delete/${detail.m_bno}'">삭제</button>
				
			</div>
		</div>
	</form>
	
</div>
<script>
$(document).ready(function() {
	//전송
	$("#submit").on("click", function() {
		var power= RegExp(/^[2-3]{1}$/)
		if(!power.test($("#m_power").val())){
     		alert("권한 설정 2: 관리자 3: 일반회원")
     		$("#m_power").val("");
     		$("#m_power").focus();
     	return false;
		}
	});
});
	
</script>
</body>
</html>



































