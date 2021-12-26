<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 게시판</title>
<%@ include file="../include/includeFile.jsp"%>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
textarea{border:1px solid #000; }
section.replyForm { padding:30px 0; }
section.replyForm div.input_area { margin:10px 0; }
section.replyForm textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px;; height:100px; }
section.replyForm button { font-size:15px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
section.replyList { margin:0 150px 0 125px; padding:30px 0; }
section.replyList ol { padding:0; margin:0; }
section.replyList ol li { padding:10px 0; border-bottom:2px solid #eee; }
section.replyList div.userInfo { }
section.replyList div.userInfo .m_id { font-size:15px; font-weight:bold; }
section.replyList div.userInfo .date { color:#999; display:inline-block; margin-left:84%; }
section.replyList div.rep_content { padding:10px; margin:20px 0 10px 0; }
section.replyList div.replyFooter { margin-bottom:10px; text-align:right; }
section.replyList div.replyFooter button { font-size:14px; border: 1px solid #000; background:none; margin-right:10px; }
div.replyModal { position:relative; z-index:1; display:none; }
div.answerModal  { position:relative; z-index:1; display:none; }
div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:520px; height:300px; padding:20px 10px; background:#fff; border:2px solid #666; }
div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
div.modalContent button.modal_cancel { margin-left:20px; }
#modifyBtn {margin-left:70px; }
#rep_content{width: 805px; height: 100px; margin-left: 195px; background: rgba(0,0,0,0.03); }
#QnAreply_btn{border: 1px solid #000; margin-left: 900px; background:#E3E3E3; transition: background .3s ease-in-out; }
#QnAreply_btn:hover{background:#F5F5F5; transition: background .3s ease-in-out; }
</style>

<script>
function QnAreplyList() {
	
 	var qna_bno = ${Detail.qna_bno};
 	$.getJSON("/member/qnaDetail/QnAreplyList" + "?qna_bno=" + qna_bno, function(data){
    	var str="";
    	
    	$(data).each(function(){
       		console.log(data);
       		
       		var rep_date = new Date(this.rep_date);
       		rep_date = rep_date.toLocaleDateString("ko-US")
       		
       		str 
       			+= "<li data-rep_bno='" + this.rep_bno + "'>"
          		+ "<div class='userInfo'>"
              	+ "<span class='m_id'>" + this.m_id + "</span>"
              	+ "<span class='date'>" + rep_date + "</span>"
          		+ "</div>"
          		+ "<div class='rep_content'>" + this.rep_content + "</div>"
          		
          		+ "<c:if test = '${m_id != null}'>"
          		
               	+ "<div class='replyFooter'>"
                + "<button type='button' class='modify' data-rep_bno='" + this.rep_bno +"'>수정</button>"
                + "<button type='button' class='delete' data-rep_bno='" + this.rep_bno +"'>삭제</button>"
              
               	+ "</div>"
      			
          		+ "</c:if>"
          		
          		+ "</li>"
          		
    	});
    	
    	$("section.replyList ol").html(str);
 	});
 
	}
</script>
</head>
<body>
	<%@ include file="../include/header.jsp"%>

	<div class="container">
		<form class="form-horizontal" name="readForm" method="post">
			<input type="hidden" id="qna_bno" name="qna_bno" value="${Detail.qna_bno}" />
				
			&nbsp;
			&nbsp;
		
				
			<div class="form-group">
				<div class="col-sm-offset-9">
					<button type="button" class="btn btn-primary" id="modifyBtn"
						onclick="location.href='qnaUpdate?qna_bno=${Detail.qna_bno}'">수정</button>
					&nbsp;
					<button type="button" class="btn btn-danger" id="deleteBtn"
						onclick="location.href='qnaDelete?qna_bno=${Detail.qna_bno}'">삭제</button>
				</div>
			</div>	

			<div class="form-group">
				<label for="title" class="control-label col-sm-2">제 목</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="qna_title"
						name="qna_title" style="background: #EEE;" maxlength="50"
						value="${Detail.qna_title}" readonly="readonly" />
				</div>
			</div>


			<div class="form-group">
				<label for="repDate" class="control-label col-sm-2">작성일자</label>
				<div class="col-sm-3">
					<input class="form-control" type="text" name="qna_date"
						value="<fmt:formatDate  value="${Detail.qna_date}"  pattern="yyyy년MM월dd일 HH:mm:ss"/>"
						readonly="readonly" style="cursor: text" />
				</div>
			</div>

			<div id="form-group" class="form-group">
				<label for="content" class="control-label col-sm-2">내 용</label>
				<div class="col-sm-4">
					<textarea rows="15" cols="140" id="qna_content" name="qna_content"
						style="background: #EEE; padding: 5px; border-radius: 4px;"
						readonly="readonly">${Detail.qna_content}</textarea>
				</div>
			</div>

		</form>
		
		<div id="reply">

			<section class="QnAreplyList">
				<script>
					QnAreplyList();
				</script>
			</section>
			<hr />

			<section class="replyForm">
				<form role="form" method="post">
					<input type="hidden" name="qna_bno" id="qna_bno"
						value="${Detail.qna_bno }">
					<div class="input_area">
						<textarea name="rep_content" id="rep_content"></textarea>
					</div>

					<div class="input_area bt">
						<button type="button" id="QnAreply_btn">답변작성</button>
					</div>
				</form>
			</section>


			<section class="replyList">
				<ol>
					<li>댓글목록</li>
				</ol>
			</section>
		</div>
	</div>

	<div class="replyModal">
		<div class="modalContent">
			<div>
				<textarea class="modal_rep_content" name="modal_rep_content"></textarea>
			</div>

			<div>
				<button type="button" class="modal_modify_btn">수정</button>
				<button type="button" class="modal_cancle">취소</button>
			</div>
		</div>

		<div class="modalBackground"></div>

	</div>
	
		<div class="answerModal">
		<div class="modalContent">
			<div>
				<textarea class="modal_rep_content" name="modal_rep_content"></textarea>
			</div>

			<div>
				<button type="button" class="modal_answer_btn">답변달기</button>
				<button type="button" class="modal_cancle">취소</button>
			</div>
		</div>

		<div class="modalBackground"></div>

	</div>
	<%@ include file="../include/footer.jsp"%>

	<script>
		$('#deleteBtn').click(function() {
			var result = confirm("게시글을 삭제하시겠습니까?");
			if (result) {
				location.href = "/member/qnaDelete/" + $("#qna_bno").val();
			}
		});

		$(document).on("click", ".modify", function() {
					$(".replyModal").fadeIn(200);
					var rep_bno = $(this).attr("data-rep_bno");
					var rep_content = $(this).parent().parent().children(".rep_content").text();
					$(".modal_rep_content").val(rep_content);
					$(".modal_modify_btn").attr("data-rep_bno", rep_bno);
				});
		
		$(document).on("click", ".answer", function() {
			$(".answerModal").fadeIn(200);
			var rep_bno = $(this).attr("data-rep_bno");
			$(".modal_answer_btn").attr("data-rep_bno", rep_bno);
		});

		$(document).on("click", ".delete", function() {

			var deleteConfirm = confirm("정말로 삭제하시겠습니까?");

			if (deleteConfirm) {

				var data = {rep_bno : $(this).attr("data-rep_bno") };

				$.ajax({
					url : "/member/qnaDetail/deleteReply",
					type : "post",
					data : data,
					success : function(result) {
							QnAreplyList();
					}
				});
			}
		});

		$("#QnAreply_btn").click(function() {

			var formObj = $(".replyForm form[role='form']");
			var qna_bno = $("#qna_bno").val();
			var rep_content = $("#rep_content").val()

			var data = {
				qna_bno : qna_bno,
				rep_content : rep_content

			};
			$.ajax({
				url : "/member/qnaDetail/QnAregistReply",
				type : "post",
				data : data,
				success : function() {
					QnAreplyList();
					$("#rep_content").val("");
					
				}
			});
		});

		$(".modal_modify_btn").click(function() {
			var modifyConfirm = confirm("정말로 수정하시겠습니까?");

			if (modifyConfirm) {
				var data = {
					rep_bno : $(this).attr("data-rep_bno"),
					rep_content : $(".modal_rep_content").val()
				}; 

				$.ajax({
					url : "/member/qnaDetail/modifyReply",
					type : "post",
					data : data,
					success : function(result) {
					
						QnAreplyList(); 
						$(".replyModal").fadeOut(200);
					}
				});
			}
		});

		$(".modal_cancle").click(function() {
		
			$(".replyModal").fadeOut(200);
		});
		

	</script>


</body>
</html>