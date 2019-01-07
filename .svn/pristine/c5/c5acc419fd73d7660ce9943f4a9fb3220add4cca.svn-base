<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="/WEB-INF/views/manager/common/head.jsp" %>

<body>
<div class="wrapper">

	<%@include file="/WEB-INF/views/manager/common/sidebar.jsp" %>

    <div class="main-panel">
		<nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="post.do">글/댓글 관리</a>
                </div>
                <%@include file="/WEB-INF/views/manager/common/navbar.jsp" %>
            </div>
        </nav>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Q&A 게시물</h4>
                                <p class="category">Here is a subtitle for this table</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
	                                    <tr>
	                                        <th style="width:10%">글 번호</th>
	                                    	<th style="width:20%">작성자</th>
	                                    	<th style="width:50%">제목</th>
	                                    	<th style="width:20%">처리</th>
	                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="post" items="${qnaPosts }">
                                        <tr>
                                        	<td>${post.no }</td>
                                        	<td>${post.writer.name }</td>
                                        	<td><a id="post-info-${post.no }" href="/qna/detail.do?qnaNo=${post.no }">${post.title }</a></td>
                                        	<td></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="card card">
                            <div class="header">
                                <h4 class="title">Q&A 댓글</h4>
                                <p class="category">Here is a subtitle for this table</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                    	<tr>
	                                        <th style="width:10%">글 번호</th>
	                                    	<th style="width:20%">작성자</th>
	                                    	<th style="width:50%">내용</th>
	                                    	<th style="width:20%">처리</th>
                                    	</tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="answer" items="${qnaAnswers }">
                                        <tr>
                                        	<td>${answer.no }</td>
                                        	<td>${answer.writer.name }</td>
                                        	<td><input type="hidden" id="qna-number-${answer.qnaNo }" value="${answer.qnaNo }"/><a id="qna-answer-modal-${answer.qnaNo }" data-toggle="modal" data-target="#qna-answer-info">${answer.contents }</a></td>
                                        	<td></td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">리뷰 게시물</h4>
                                <p class="category">Here is a subtitle for this table</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                        <th>글 번호</th>
                                    	<th>작성자</th>
                                    	<th>제목</th>
                                    	<th>신고여부</th>
                                    	<th>처리</th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                        	<td>1</td>
                                        	<td>Dakota Rice</td>
                                        	<td>$36,738</td>
                                        	<td>Niger</td>
                                        	<td>Oud-Turnhout</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">리뷰 댓글</h4>
                                <p class="category">Here is a subtitle for this table</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                        <th>글 번호</th>
                                    	<th>작성자</th>
                                    	<th>내용</th>
                                    	<th>신고여부</th>
                                    	<th>처리</th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                        	<td>1</td>
                                        	<td>Dakota Rice</td>
                                        	<td>$36,738</td>
                                        	<td>Niger</td>
                                        	<td>Oud-Turnhout</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="/WEB-INF/views/manager/common/footer.jsp" %>
        
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="qna-answer-info" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">세부 정보</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="content table-responsive table-full-width">
					<table class="table table-hover">
						<thead>
							<tr>
								<th style="width: 10%">번호</th>
								<th style="width: 20%">작성자</th>
								<th style="width: 30%">내용</th>
								<th style="width: 40%">답글이 달린 원글</th>
							</tr>
						</thead>
						<tbody>
							<tr id="qna-answer-info-ajax">
								
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>
<!--  -->

</body>

<%@include file="/WEB-INF/views/manager/common/commonjs.jsp" %>

<script type="text/javascript">
	
	$(document).on('click', 'a[id*="post-info"]', function() {
		$('a[href^="/qna/detail.do"]').attr({'target' : '_blank'});
	})
	
	$('a[id*="qna-answer-modal"]').click(function() {
		
		answerNo = $(this).closest('tr').children('td').first().text();
		postNo = $(this).closest('td').children('input').first().val();
		
		$.ajax({
			url:'post/ajax.do',
			method:'POST',
			traditional:true,
			data:{
				'functionName':'findQnaAnswerInfoByNo',
				'postNo':postNo
			},
			dataType:'json',
			success:function(qna) {
				// 해당 Qna 글에서 검색한 답글을 찾는 기능과, html 태그를 제거하는 기능
				for (i=0; i<qna.answers.length; i++) {
					if (qna.answers[i].no == answerNo) {
						var htmlLessContents = (qna.answers[i].contents).replace(/(<([^>]+)>)/ig,'');
						console.log(htmlLessContents);
					}
				}
				
				var html  = '<td>'+qna.no+'</td>'
               		html +=	'<td>'+qna.writer.name+'</td>'
               		html +=	'<td>'+htmlLessContents+'</td>'
               		html +=	'<td><a id="post-info-'+postNo+'" href="/qna/detail.do?qnaNo='+postNo+'">'+qna.title+'</a></td>'
               		html +=	'<td></td>';
               		
				$('#qna-answer-info-ajax').html(html);
			},
			error:function(request, status, error) {
				console.log('오류');
				$('#qna-answer-info-ajax').html('데이터를 불러오는데 실패했습니다');
			}
		});
	});
	
</script>

</html>