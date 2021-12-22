<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div class="container">
		
		<form class="form-horizontal" method="post">
			<div class="form-group">
				<header>
					<h5><b>문의사항</b></h5>
				</header>
			</div>
			
			
			<div class="form-group">
				<label class="control-label col-sm-2">제  목</label>
				<div class="col-sm-4">
					<input type="text" id="ti" name="qna_title" maxlength="50" placeholder="Enter Title"/>
				</div>
			</div> 
			
			
			<div class="form-group">
				<label class="control-label col-sm-2">내  용</label>
				<div class="col-sm-4">
					<textarea rows="10" cols="118" name="qna_content" style="padding:5px;"></textarea>
				</div>
			</div>
			
			
			<div class="secret">
			    <label><input type="radio" name="qna_seceret" value="0" />공개</label>
			    <label><input type="radio" name="qna_seceret" value="1" />비공개</label>
			</div>
			
			<div class="form-group btm">
				<div class="col-sm-offset bt">
					<button type="submit">작성완료</button>
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>