<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room Java</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
.item { background-color:#000; }
.item img { opacity:0.7; }
</style>

</head>
<body>

<div id="visual">
	<%@ include file="../include/indexHeader.jsp" %>
	
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		
		<!-- Wrapper for slides : 사진에 대한 설정 -->
		<div class="carousel-inner">
			<div class="item active">
				<img class="img-responsive center-block" src="../resources/images/photo1.jpg" alt="image1.jpg" />
			</div>
			
			<div class="item">
				<img class="img-responsive center-block" src="../resources/images/photo2.jpg" alt="image2.jpg" />
			</div>
			
			<div class="item">
				<img class="img-responsive center-block" src="../resources/images/photo3.jpg" alt="image3.jpg" />
			</div>
			
			<div class="item">
				<img class="img-responsive center-block" src="../resources/images/photo4.jpg" alt="image4.jpg" />
			</div>
			
			<div class="item">
				<img class="img-responsive center-block" src="../resources/images/photo5.jpg" alt="image5.jpg" />
			</div>
		</div>
		
		<!-- controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
		</a>
		
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
		</ol>
	</div>
</div>

<div id="content">
</div>

<%@ include file="../include/footer.jsp" %>
</body>

<script>
$('.logout').click(function(){
	var result = confirm("로그아웃 하시겠습니까?");
	if(result){
		location.href="member/logout";
	}
});
// 회원탈퇴버튼을 눌렀을 경우 회원탈퇴 페이지로 이동한다.
$("#memberDeleteBtn").on("click", function() {
	var result = confirm("회원탈퇴 하시겠습니까?");
	if(result){
	location.href = "/member/memberDelete/" + $("#m_id").val();
	}
});

</script>
</html>