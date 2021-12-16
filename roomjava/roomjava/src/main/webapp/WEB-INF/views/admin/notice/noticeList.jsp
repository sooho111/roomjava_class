<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice List</title>
<%@ include file="../../include/includeFile.jsp"%>
</head>
<body>

<div class="container">
<%@ include file="../../include/m_header.jsp"%>
	<nav>
		<button type="button" onclick="location.href='notice'">글작성</button>
	</nav>
	<hr />

	<form role="form" method="get">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>
			</thead>

			<c:forEach items="${list}" var="list">
				<tr>
					<td><c:out value="${list.notice_bno}" /></td>
					<td><c:out value="${list.notice_title}" /></td>
					<td>관리자</td>
					<td><fmt:formatDate value="${list.notice_date}"
							pattern="yyyy년MM월dd일" /></td>
				</tr>
			</c:forEach>
		</table>

		<div class="search row">
			<div class="col-xs-2 col-sm-2" style="margin-left: 170px;">
				<select name="searchType" class="form-control">
					<option value="n"
						<c:out value = "$(scri.seachType == null ? 'selected' : '')"/>>---선택---</option>
					<option value="title"
						<c:out value = "$(scri.seachType eq 't' ? 'selected' : '')"/>>제목</option>
					<option value="content"
						<c:out value = "$(scri.seachType eq 'c' ? 'selected' : '')"/>>내용</option>
				</select>
			</div>

			<div class="col-xs-10 col-sm-5">
				<div class="input-group">
					<input type="text" name="keyword" id="keywordInput"
						value="${scri.keyword}" class="form-control" /> <span
						class="input-group-btn">
						<button id="searchBtn" type="button" class="btn btn-default">검색</button>
					</span>
				</div>
			</div>
		</div>

		<div class="col-md-offset-3">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li><a
						href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}" var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }" />>
						<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</form>
</div>
</body>

<script>
$('#searchBtn').click(
	function() {
		self.location = "list" + '${pageMaker.makeQuery(1)}' + "$searchType=" + $("select option:selected").val()
	}
});
</script>

</html>