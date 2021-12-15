<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form class="form-horizontal" name="readForm" method="post">
		<input type="hidden" id="brdNum" name="brdNum" value="${view.brdNum}" />
			
			<div class="form-group">
				<label class="control-label col-sm-2">제  목</label>
				<div class="col-sm-8">
					<input type="text" name="brd_Title" maxlength="50" style="cursor:text;" value="${view.brd_Title}" readonly="readonly" style="cursor:text" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">글쓴이</label>
				<div class="col-sm-8">
					<input type="text" name="userName" maxlength="30" style="cursor:text;" value="${view.userName}" readonly="readonly" style="cursor:text" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">작성일자</label>
				<div class="col-sm-8">
					<input type="text" name="repDate" style="cursor:text;" value="<fmt:formatDate value="${view.repDate}" pattern="yyyy년 MM월 dd일"/>" readonly="readonly" style="cursor:text" />
				</div>
			</div>
			
			<div id="form-group" class="form-group">
				<label class="control-label col-sm-2">내  용</label>
				<div class="col-sm-4">
					<textarea id="content" rows="20" cols="120" name="brd_Content" readonly="readonly" >${view.brd_Content}</textarea>
				</div>
			</div>
		</form>
	</div>

</body>
</html>