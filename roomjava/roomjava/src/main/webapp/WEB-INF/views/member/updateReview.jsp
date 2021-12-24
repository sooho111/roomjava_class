<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${member.m_id}님의 정보</title>
<%@ include file="../include/includeFile.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@400;800&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

/* visual */
.t_visual { height:300px; width:100%; background:url("/resources/images/photo4.jpg") no-repeat top center; position:relative; margin-bottom:70px; }
.t_visual .inner { width:960px; position:relative; }
.t_visual_black { height:300px; width:100%; background:rgba(0,0,0,0.5); position:absolute; }

.me { position:absolute; left:0; top:0; margin-top:90px; }
.me p { color:#fff; font-family:'Nanum Myeongjo',serif; }
.me p:first-child { font-weight:800; font-size:40px; margin-bottom:15px; }
.me p:last-child { font-size:20px; }

/* myContent */
#myContent { height:750px; }
#myContent .inner { width:960px; }
#myContent .inner:after { content:""; clear:both; display:block; }

.left_bar { float:left; }
.left_bar .myShopping { width:200px; border-bottom:1px solid #888; margin-bottom:20px; }
.left_bar .myShopping:last-child { border:0; }
.left_bar .myShopping li { margin-bottom:20px; position:relative; }
.left_bar .myShopping li:first-child { color:#333; font-weight:700; font-size:20px; } 
.left_bar .myShopping li a { color:#666; font-weight:300; font-size:15px; }
.glyphicon-chevron-right { color:#666; position:absolute; right:0; top:4px; }

.m_content { float:right; width:700px; }
.m_content .order { font-size:20px; }

th { text-align:center; }

.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="t_visual">
	<div class="t_visual_black"></div>
	
	<div class="inner">
		<div class="me">
			<p>${member.m_name}</p>
			<p>${member.m_id}님 환영합니다.</p>
		</div>
	</div>
</div>

<div id="myContent">
	<div class="inner">
		<div class="left_bar">
			<ul class="myShopping">
				<li></li>
				<li><a href="/member/myPage">예약 확인</a><span class="glyphicon glyphicon-chevron-right"></span></li>
				<li><a href="/member/memberUpdate/${member.m_id}">회원 정보 수정</a><span class="glyphicon glyphicon-chevron-right"></span></li>
				<li><a href="/member/memberDelete/${member.m_id}">회원 탈퇴</a><span class="glyphicon glyphicon-chevron-right"></span></li>
			</ul>
		</div>


	<div class="m_content">
		<form class="form-horizontal" method="post" action="updateReview">
			<div class="form-group">
				<label class="control-label col-sm-2">후  기</label>
				<div class="col-sm-7">
					<textarea class="form-control" rows="10" cols="100" id="r_content" name="r_content" placeholder="답변" >${review.r_content}</textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3">
					<div class="star-rating space-x-4 mx-auto">
						<input type="radio" id="5-stars" name="review_star" value="5"checked="checked" />
						<label for="5-stars" class="review_star">★</label>
						<input type="radio" id="4-stars" name="review_star" value="4"/>
						<label for="4-stars" class="review_star">★</label>
						<input type="radio" id="3-stars" name="review_star" value="3"/>
						<label for="3-stars" class="review_star">★</label>
						<input type="radio" id="2-stars" name="review_star" value="2"/>
						<label for="2-stars" class="review_star">★</label>
						<input type="radio" id="1-star" name="review_star" value="1" />
						<label for="1-star" class="review_star">★</label>
					</div>
					<input type="hidden" id="r_bno" name="r_bno" value="${review.r_bno}">
					<input type="hidden" id="r_name" name="r_name" value="${review.r_name}">
					<input type="hidden" id="r_kind" name="r_kind" value="${review.r_kind}">
					<input type="hidden" id="book_order" name="book_order" value="${review.book_order }">
					<input type="hidden" id="m_id"	name="m_id" value="${member.m_id}">
					<button type="reset"  class="btn btn-warning btn-sm">다시 작성하기</button>
					<input type="submit" class="btn btn-primary" id="r_detail" name="btn_OK" value="등록"/>
				</div>
			</div>
				 	
		 	
		</form>
	</div>

	</div>
</div>
		
<%@ include file="../include/footer.jsp" %>
</body>
<script type="text/javascript">
function r_detail(){
	
	
	
$('inpvar review_star = $('input[name=review_star]:checked').val();
	
	$.ajax({
		type : "post",
		url : "/member/updateReview",
		data :  {review_star : review_star}, //변수이름 :실제값
		success:function(){
			alert("리뷰가 등록되었습니다.");
		}
	});
}
</script>
</html>