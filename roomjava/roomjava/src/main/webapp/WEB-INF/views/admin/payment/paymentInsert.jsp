<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/includeFile.jsp" %>
</head>
<body>
<%@ include file="../../include/m_header.jsp" %>
		<form class="form-horizontal" method="post">
			<div class="form-group">
				<div style="text-align: center; margin: 50px 0;">
					<h5><b>결제수단 추가</b></h5>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">예 금 주</label>
				<div class="col-sm-1">
					<input type="text" class="form-control" name="pay_name" maxlength="20" placeholder="예 금 주"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">계 좌 번 호</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="pay_account" maxlength="50" placeholder="계 좌 번 호"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">은 행 명</label>
				<div class="col-sm-1">
					<input type="text" class="form-control" name="pay_bank" maxlength="50" placeholder="은 행 명"/>
				</div>
			</div>
			
			
			<div class="form-group">
				<div class="col-sm-offset-3">
					<button type="reset"  class="btn btn-warning btn-sm">다시 작성하기</button>
					<button type="submit" class="btn btn-primary btn-sm">결제 수단 등록</button>
				</div>
			</div>
		</form>
		
	

</body>
</html>