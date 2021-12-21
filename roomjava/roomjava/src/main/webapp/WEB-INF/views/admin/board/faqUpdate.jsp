<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 기능 수정</title>
<%@ include file="../../include/includeFile.jsp" %>

<style>
.won { margin-top:5px; font-size:16px; }
</style>
</head>
<body>
<%@ include file="../../include/m_header.jsp" %>

	<div class="container">
		<form class="form-horizontal" name ="updateForm" role="form" method="post" action="/admin/board/faqUpdate?n=${update.faq_bno }">
			<input type="hidden" name="faq_bno" value="${update.faq_bno}" readonly="readonly"/>
			<div class="form-group">
				<div style="text-align: center; margin: 50px 0;">
					<h5><b>기본 기능 수정</b></h5>
				</div>
			</div>
			
			<div class="form-group">
			<label class="control-label col-sm-2">질문 종류</label>
			<div class="col-sm-2">					
				 				
				<select class="form-control" name="faq_class" id="faq_class">
					<c:forEach items="${selectFaqType}" var="list">
						<option value="${list.faq_class}">${list.faq_name}</option>						
					</c:forEach>				
				</select>					
					
			</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">자주 받는 질문</label>
		<div class="col-sm-8">
			<input type="text" class="form-control" maxlength="100" id="faq_title" name="faq_title" value="${update.faq_title }" onkeydown="nextFocus(faq_content)" placeholder="자주 받는 질문"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">답변</label>
		<div class="col-sm-7">
			<textarea class="form-control" rows="10" cols="100" id="faq_content" name="faq_content"  placeholder="답변">${update.faq_content }</textarea>
		</div>
	</div>
			<div class="form-group">
				<div class="col-sm-offset-9">
					<button type="submit" class="btn btn-success update_btn">저장</button>&nbsp;
					<button type="button" class="btn btn-danger" onclick="location.href='faqDelete?n=${update.faq_bno}'" >삭제</button>
					<button type="submit" class="btn btn-warning cancel_btn">취소</button>
				</div>
			</div>
		</form>
		
	</div>
	
	<script type="text/javascript">
	$(document).ready(function(){
		
		$(".cancel_btn").on("click", function(){
			event.preventDefault();
			location.href = "/admin/board/boardList";
		})
	})
</script>

<%@ include file="../../include/footer.jsp" %>
</body>
</html>