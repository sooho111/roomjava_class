<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/includeFile.jsp" %>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

	<div class="container">
		<form class="form-horizontal" name ="updateForm" role="form" method="post" action="/member/qnaUpdate?qna_bno=${update.qna_bno }">
			<input type="hidden" name="qna_bno" value="${update.qna_bno}" readonly="readonly"/>
			<div class="form-group">
				<div style="text-align: center; margin: 50px 0;">
					<h5><b>QnA 수정</b></h5>
				</div>
			</div>
			
			<div class="form-group">
				<label for="title" class="control-label col-sm-2">제  목</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="qna_title" name="qna_title" value="${update.qna_title}"/>
				</div>
			</div>
			
			
			<div class="form-group">
				<label for="repDate" class="control-label col-sm-2">작성일자</label>
				<div class="col-sm-3">
					<input class="form-control" readonly="readonly" value="<fmt:formatDate value="${update.qna_date}" pattern="yyyy년 MM월 dd일 HH:mm:ss" />"/>
				</div>
			</div>
			
			<div class="form-group">
				<label for="content" class="control-label col-sm-2">내  용</label>
				<div class="col-sm-4">
					<textarea rows="15" cols="140" id="qna_content" name="qna_content"  padding:5px; border-radius:4px;"><c:out value="${update.qna_content}" /></textarea>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-9">
					<button type="submit" class="btn btn-success update_btn">저장</button>&nbsp;
					<button type="submit" class="btn btn-warning cancel_btn">취소</button>
				</div>
			</div>
		</form>
		
	</div>
	
	<script type="text/javascript">
	$(document).ready(function(){
		
		$(".cancel_btn").on("click", function(){
			event.preventDefault();
			location.href = "/member/qnaDetail";
		})
	})
</script>

<%@ include file="../include/footer.jsp" %>
</body>
</html>