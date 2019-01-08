<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
			<div class="col-xs-12" style="padding: 0px;">
				 <div class="search-container">
					<form action="#">
						<input type="text" placeholder="질문을 검색하세요" name="search" id="search-box" >
						<span style="color: white; margin-left: 50px;">OR</span>
						<button class="sg-btn-primary" id="paid-question-add">새 질문하기</button>
					</form>
				</div>
			</div>
			<div class="paid-whole-questions">
					<div class="col-xs-12 each-question-wrapper">
						<div class="each-question-top-wrapper">
							<div class="col-xs-1" style="padding: 0px">
								<img id="each-question-profphoto" src="resources/img/johndoe.jpg">
							</div>
							<div class="col-xs-10" style="padding: 0px;">
								<div>
									<p id="each-question-profname">JOHN DOE</p>
								</div>
								<div>
									<h3 id="each-question-title">Why doesn't this work with my computer?</h3>
								</div>
								<div class="each-question-dateform">
									<span class="glyphicon glyphicon-time"> </span><span id="each-question-date"> 2017.09.12</span>
								</div>
							</div>
							<div class="col-xs-1 each-question-top-reply">
								<span class="label label-info" style="float: right;">답변 <span id="each-question-replyNo">1</span></span>
							</div>
						</div>
						<div class="col-xs-12 each-question-contentsWrapper">
							<p id="each-question-contents">
								create an empty modal box on the current page and below is the ajax call you can see how to fetch the content in result from another html page.
								$.ajax({url: "registration.html", success: function(result){
								//alert("success"+result);
								  $("#contentBody").html(result);
									$("#myModal").modal('show'); 
									}});

								once the call is done you will get the content of the page by the result to then you can insert the code in you modal's content id using. 

								You can call controller and get the page content and you can show that in your modal.

								below is the example of Bootstrap 3 modal in that we are loading content from registration.html page...

								index.html
							</p>
							<div class="each-question-replyform">
								<form action="#" class="replyform">
								<textarea rows="4" cols="156" name="comment" form="replyform" style="resize:none;">댓글을 입력하세요</textarea>
									<button id="each-question-reply-submit" class="sg-btn-primary" type="submit">답변</button>
								</form>
								<br>
							</div>
							<div class="row each-question-list">
								<div class="col-xs-1">
									<img id="each-question-replyphoto" src="resources/img/johndoe.jpg">
								</div>
								<div class="col-xs-11">
									<span id="each-question-replyName">JOHN DOE</span><span id="each-question-replyDate">하루 전</span>
									<p id="each-question-replyContents">create an empty modal box on the current page and below is the ajax call you can see how to fetch the content in result from another html	asdfasdfsadfdsf</p>
									<div class="each-question-manipulate">
										<span><span class="each-question-btn-modify">수정</span><span class="each-question-btn-delete">삭제</span></span>
									</div>
									<div class="each-question-replyform">
										<form action="#" class="replyform">
											<textarea rows="4" cols="140" name="comment" form="replyform" style="resize:none;">hello</textarea>
											<button id="each-question-reply-modify-submit" class="sg-btn-primary" type="submit">수정</button>
											<button id="each-question-reply-modify-cancel" >취소</button>
										</form>
										<br>
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>
			
			
			<script>
			$("#search-box").on("click", function () {
				$(this).css("border", "3px solid #ff7373");
			});

			$(".each-question-top-wrapper").on("click", function () {
				const flag = $(this).siblings(".each-question-contentsWrapper").css("display");
				console.log(flag);

				if (flag === "none") {
					$(this).siblings('.each-question-contentsWrapper').css('display', 'block');
					$(this).parent().css("background-color", "#ffeaec")

				} else {
					$(this).siblings('.each-question-contentsWrapper').css('display', 'none');
				}
			});

			$(".each-question-btn-modify").on("click", function () {

				let replyForm = $(this).parent().parent().siblings('.each-question-replyform');
				replyForm.css('display', 'block');
				let preContents = $(this).parent().parent().siblings('#each-question-replyContents').text();
				console.log(replyForm.children('.replyform').children('textarea').text(preContents));
				
			});
			
			$("#each-question-reply-modify-cancel").on("click", function (event) {
				event.preventDefault();
				let replyForm = $(this).parent().parent();
				replyForm.css('display', 'none');
			});

			</script>