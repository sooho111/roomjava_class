<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 기능 추가</title>
<%@ include file="../../include/includeFile.jsp" %>
<style>
.won { margin-top:5px; font-size:16px; }
body { overflow-x:hidden; }
</style>

</head>
<body>
<%@ include file="../../include/m_header.jsp" %>

<form class="form-horizontal" method="post">
	<div class="form-group">
		<div style="text-align: center; margin: 50px 0;">
			<h2 align="center">FAQ 등록</h2>
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
			<input type="text" class="form-control" maxlength="100" id="faq_title" name="faq_title" onkeydown="nextFocus(faq_content)" placeholder="자주 받는 질문"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">답변</label>
		<div class="col-sm-7">
			<textarea class="form-control" rows="10" cols="100" id="faq_content" name="faq_content" placeholder="답변"></textarea>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-3">
			<button type="reset"  class="btn btn-warning btn-sm">다시 작성하기</button>
			<input type="button" class="btn btn-primary" name="btn_OK" onclick="checkInsertForm(this.form)" value="등록"/>
		</div>
	</div>
</form>
</body>
<script>
//포커스를 이동시키는 함수
function nextFocus(where) {
	//alert("포커스를 이동시키는 함수");
	if(event.keyCode == 13) {//Enter Key를 눌렀으면
		where.focus();
	}
}
</script>

<script>
function checkInsertForm(faqInsert) {
		
	if(!faqInsert.faq_class.value) {
		alert("질문종류를 선택하십시오.");
		faqInsert.faq_class.focus();
		return false;
	}
	if(!faqInsert.faq_title.value) {
		alert("질문 제목을 입력하십시오.");
		faqInsert.faq_title.focus();
		return false;
	}
	if(!faqInsert.faq_content.value) {
		alert("답변을 입력하십시오.");
		faqInsert.faq_content.focus();
		return false;
	}
	
	
	faqInsert.submit();
	
}
</script>
</html>