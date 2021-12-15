<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
</head>
<body>
	<div class="container">
		<form class="form-horizontal" name="readForm" method="post">
		<input type="hidden" id="notice_bno" name="notice_bno" value="${detail.notice_bno}" />
			
			<div class="form-group">
				<label class="control-label col-sm-2">제  목</label>
				<div class="col-sm-8">
					<input type="text" name="notice_title" maxlength="50"  value="${detail.notice_title}" readonly="readonly"  />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">작성일자</label>
				<div class="col-sm-8">
					<input type="text" name="notice_date"  value="<fmt:formatDate value="${detail.notice_date}" pattern="yyyy년 MM월 dd일"/>" readonly="readonly" style="cursor:text" />
				</div>
			</div>
			
			<div id="form-group" class="form-group">
				<label class="control-label col-sm-2">내  용</label>
				<div class="col-sm-4">
					<textarea id="notice_content" rows="20" cols="120" name="notice_content" readonly="readonly" >${detail.notice_content}</textarea>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-9">
					<button type ="button" class="btn btn-primary" onclick="location.href='#'" >수정</button>&nbsp;
					<button type="button" class="btn btn-danger" onclick="location.href'#'" >삭제</button>
				</div>
			</div>
			
		</form>
	</div>

</body>
</html>