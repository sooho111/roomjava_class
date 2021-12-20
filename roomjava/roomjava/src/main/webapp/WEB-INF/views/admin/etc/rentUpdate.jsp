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

	<div class="container">
		<form class="form-horizontal" name ="updateForm" role="form" method="post" action="/admin/etc/rentUpdate?n=${update.rent_bno }">
			<input type="hidden" name="rent_bno" value="${update.rent_bno}" readonly="readonly"/>
			<div class="form-group">
				<div style="text-align: center; margin: 50px 0;">
					<h5><b>결제항목 수정</b></h5>
				</div>
			</div>
			
			
			<div class="form-group">
				<label class="control-label col-sm-2">대여 항목 이름</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="rent_name" value="${update.rent_name}" maxlength="50" placeholder="대여 항목 이름"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">대여 비용</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="rent_price" value="${update.rent_price}" maxlength="50" placeholder="대여 비용"/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-9">
					<button type="submit" class="btn btn-success update_btn">저장</button>&nbsp;
										<button type="button" class="btn btn-danger" onclick="location.href='rentDelete?n=${update.rent_bno}'" >삭제</button>
					<button type="submit" class="btn btn-warning cancel_btn">취소</button>
				</div>
			</div>
		</form>
		
	</div>
	
	<script type="text/javascript">
	$(document).ready(function(){
		
		$(".cancel_btn").on("click", function(){
			event.preventDefault();
			location.href = "/admin/etc/etcList";
		})
	})
</script>

<%@ include file="../../include/footer.jsp" %>
</body>
</html>