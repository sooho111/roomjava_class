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
		<form class="form-horizontal" action="/member/memberUpdate" method="post">
			<div class="form-group">
				<div class="col-sm-2"></div>
				<div class="col-sm-6">
					<h2 align="center">회원 정보 수정</h2>
				</div>
			</div>

			<!-- 아이디 -->
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_id">아이디</label>
				<div class="col-sm-3">
				 <input type="text" class="form-control" name="m_id" value="${view.m_id}" readonly="readonly" required>
			</div>
			</div>
			<!-- 비밀번호 -->
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_pwd">비밀번호</label>
				<div class="col-sm-3">
				 <input type="password" class="form-control" id="m_pwd" name="m_pwd" value="${view.m_pwd}"placeholder="PASSWORD" >*비밀번호 변경가능(4~12자의 영문 대소문자와 숫자만)
			</div>
			</div>
			
			<!-- 이름 -->
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_name">이름</label> 
				<div class="col-sm-3">
				<input type="text" class="form-control" id="m_name" name="m_name" maxlength="20" value="${view.m_name}">
			</div>
			</div>
			<!-- 생년월일 -->
			<div class="form-group required">
				<label class="control-label col-sm-2" for="m_birth">생년월일</label>
				<div class="col-sm-3">
					 <input type="text" class="form-control" id="m_birth" name="m_birth" placeholder="ex) 970106" value="${view.m_birth}">*생년월일 6자 입력
				</div>
			</div>
				
			<!-- 휴대전화 -->
			<div class="form-group">
		        <label class="control-label col-sm-2" for="user_phone">전화번호</label> 
				<div class="col-sm-3">
					<input type="text" class="form-control" id="m_tel" name="m_tel" placeholder="휴대전화 ('-' 없이 번호만 입력해주세요)" value="${view.m_tel}" >*('-' 없이 번호만 입력해주세요)
				</div>
			</div>
				
				<!-- 본인확인 이메일 -->
				<div class="form-group">
					<label class="control-label col-sm-2" for="m_email">이메일</label> 
						<div class="col-sm-4">
						<input type="text" class="form-control" name="m_email" id="m_email" placeholder="E-mail" value="${view.m_email}" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">주 소</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="m_address" id="m_address"  value="${view.m_address}" readonly="readonly" />
					</div>
				</div>
					
				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-3 center">
						<button class="btn btn-success" type="submit" id="submit">수정</button>
						<input class="btn btn-primary" type="button" value="뒤로가기" onclick="history.go(-1);" /> 
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<%@ include file="../include/footer.jsp" %>
</body>
<script type="text/javascript">

$(document).ready(function() {
	//전송
	$("#submit").on("click", function() {
		// 정규 표현식
		var idd= RegExp(/^[a-zA-Z0-9]{4,12}$/)
		var pww= RegExp(/^[a-zA-Z0-9]{4,12}$/)
		var named= RegExp(/^[가-힣a-zA-Z]{2,20}$/)
		var email = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/)
	    var birth= RegExp(/^[0-9]{6}$/)
	    var phone= RegExp(/^0?[0-9]{11}$/)
	    
	    if($("#m_pwd").val() == "") {
			alert("비밀번호를 입력하십시오.");
			$("#m_pwd").focus();
			return false;
		}
	      //비밀번호 유효성검사
	      if(!pww.test($("#m_pwd").val())){
	          alert("비밀번호는 4~12자의 영문 대소문자와 숫자로만 입력하십시오.");
	          $("#m_pwd").val("");
	          $("#m_pwd").focus();
	           return false;
	     }

		if($("#m_name").val() == "") {
			alert("이름를 입력하십시오.");
			$("#m_name").focus();
			return false;
		}
		//이름 유효성 검사
        if(!named.test($("#m_name").val())){
             alert("이름형식에 맞게 입력해주세요")
             $("#m_name").val("");
             $("#m_name").focus();
             return false;
        }
		
		if($("#m_birth").val() == "") {
			alert("생년월일을 입력하십시오.");
			$("#m_birth").focus();
			return false;
		}
		//생년월일 유효성 검사
        if(!birth.test($("#m_birth").val())){
             alert("생년월일 6자리를 입력해주세요.")
             $("#m_birth").val("");
             $("#m_birth").focus();
             return false;
        }
		
		if($("#m_tel").val() == "") {
			alert("전화번호를 입력하십시오.");
			$("#m_tel").focus();
			return false;
		}
		//전화번호 유효성 검사
        if(!phone.test($("#m_tel").val())){
             alert("핸드폰 번호를 입력해주세요.")
             $("#m_tel").val("");
             $("#m_tel").focus();
             return false;
        }
		
		if($("#m_email").val() == "") {
			alert("이메일를 입력하십시오.");
			$("#m_email").focus();
			return false;
		}
		//이메일 유효성 검사
        if(!email.test($("#m_email").val())){
             alert("이메일형식에 맞게 입력해주세요")
             $("#m_email").val("");
             $("#m_email").focus();
             return false;
        }
	});
});

// 회원정보수정버튼을 눌렀을 경우 회원정보수정 페이지로 이동한다.
$("#memberUpdateBtn").on("click", function() {
	location.href = "/member/memberUpdate/" + $("#m_id").val();
});


</script>
</html>
