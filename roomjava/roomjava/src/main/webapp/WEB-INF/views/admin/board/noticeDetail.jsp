<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<%@ include file="../../include/includeFile.jsp" %>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

</style>
</head>
<body>
<%@ include file="../../include/m_header.jsp" %>

<div class="container">
	<form class="form-horizontal" name="readForm" method="post">
		<input type="hidden" id="notice_bno" name="notice_bno" value="${detail.notice_bno}" />
			
		<div class="form-group">
			<div style="text-align: center; margin: 50px 0;">
				<h5><b>공지사항</b></h5>
			</div>
		</div>			
		
		<div class="form-group">
			<label for="title" class="control-label col-sm-2">제  목</label>
			<div class="col-sm-5">
				<input class="form-control" type="text" id="notice_title" name="notice_title" style="background:#EEE;" maxlength="50"  value="${detail.notice_title}" readonly="readonly"  />
			</div>
		</div>
		
		
		<div class="form-group">
			<label for="repDate" class="control-label col-sm-2">작성일자</label>
			<div class="col-sm-3">
				<input class="form-control" type="text" name="notice_date"  value="<fmt:formatDate  value="${detail.notice_date}"  pattern="yyyy년MM월dd일 hh:mm:ss"/>" readonly="readonly" style="cursor:text" />
			</div>
		</div>
		
		<div id="form-group" class="form-group">
			<label for="content" class="control-label col-sm-2">내  용</label>
			<div class="col-sm-4">
				<textarea rows="15" cols="140" id="notice_content" name="notice_content" style="background:#EEE; padding:5px; border-radius:4px;" readonly="readonly" >${detail.notice_content}</textarea>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-9">
				<button type ="button" class="btn btn-primary" onclick="location.href='noticeUpdate?n=${detail.notice_bno}'" >수정</button>&nbsp;
				<button type="button" class="btn btn-danger" onclick="location.href='noticeDelete?n=${detail.notice_bno}'" >삭제</button>
			</div>
		</div>
	</form>
</div>
				<%@ include file="../../include/footer.jsp" %>
</body>
</html>