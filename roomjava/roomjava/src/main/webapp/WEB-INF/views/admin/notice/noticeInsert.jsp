<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<form class="form-horizontal" method="post">
			<div class="form-group">
				<div style="text-align: center; margin: 50px 0;">
					<h5><b>게시글 작성</b></h5>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">제  목</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="notice_title" maxlength="50" placeholder="Enter Title"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">내  용</label>
				<div class="col-sm-4">
					<textarea rows="15" cols="150" name="notice_content"></textarea>
				</div>
			</div>
			
			
			<div class="form-group">
				<div class="col-sm-offset-3">
					<button type="reset"  class="btn btn-warning btn-sm">다시 작성하기</button>
					<button type="submit" class="btn btn-primary btn-sm">글 올리기</button>
				</div>
			</div>
		</form>
		
	

</body>
</html>