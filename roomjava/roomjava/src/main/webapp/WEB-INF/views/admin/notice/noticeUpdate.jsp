<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/includeFile.jsp" %>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

</style>
</head>
<body>
<%@ include file="../../include/m_header.jsp" %>

		<div>
		<form class="form-horizontal" name ="updateForm" role="form" method="post" action="/admin/notice/noticeUpdate">
			<input type="hidden" name="notice_bno" value="${update.notice_bno}" readonly="readonly"/>
			<div class="form-group">
				<div style="text-align: center; margin: 50px 0;">
					<h5><b>공지사항 수정</b></h5>
				</div>
			</div>
			
			<div class="form-group">
				<label for="title" class="control-label col-sm-2">제  목</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="notice_title" name="notice_title" style="background:#EEE;" value="${update.notice_title}"/>
				</div>
			</div>
			
			
			<div class="form-group">
				<label for="repDate" class="control-label col-sm-2">작성일자</label>
				<div class="col-sm-3">
					<input class="form-control" readonly="readonly" value="<fmt:formatDate value="${update.notice_date}" pattern="yyyy-MM-dd"/>"/>
				</div>
			</div>
			
			<div class="form-group">
				<label for="content" class="control-label col-sm-2">내  용</label>
				<div class="col-sm-4">
					<textarea rows="15" cols="140" id="notice_content" name="notice_content" style="background:#EEE; padding:5px; border-radius:4px;"><c:out value="${update.notice_content}" /></textarea>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-9">
					<button type="submit" class="btn btn-success update_btn">저장</button>&nbsp;
					<button type="submit" class="btn btn-warning cancel_btn">취소</button>
				</div>
			</div>
		</form>
		
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../../include/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>