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
			<h5><b>기본 기능 추가</b></h5>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2">기능 이름</label>
		<div class="col-sm-2">
			<input type="text" class="form-control" name="fnc_name" maxlength="50" placeholder="기능 이름"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">기능 비용</label>
		<div class="col-sm-1">
			<input type="text" class="form-control" name="fnc_price" maxlength="50" placeholder="기능 비용"/>
		</div>
		<p class="won">원</p>
	</div>
	
	<div class="form-group">
		<div class="col-sm-offset-3">
			<button type="reset"  class="btn btn-warning btn-sm">다시 작성하기</button>
			<button type="submit" class="btn btn-primary btn-sm">등록</button>
		</div>
	</div>
</form>
</body>
</html>