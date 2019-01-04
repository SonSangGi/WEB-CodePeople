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
                                        	<td>${answer.contents }</td>
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

</body>

<%@include file="/WEB-INF/views/manager/common/commonjs.jsp" %>

<script type="text/javascript">
	$('a[id*="post-info"]').click(function() {
		$('a[href^="/qna/detail.do"]').attr({'target' : '_blank'});
	});
</script>

</html>