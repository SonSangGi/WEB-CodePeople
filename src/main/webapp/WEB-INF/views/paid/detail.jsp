<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp" %>
<link rel="stylesheet" href="/resources/css/paid/detail.css?ver=1">
<link rel="stylesheet" href="/resources/css/paid/contents.css?ver=1">


<script src="/resources/js/paid/detail.js?ver=2"></script>
<script src="/resources/js/paid/contents.js?ver=3"></script>

</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div class="container">

            <div class="paid-top-default">
                <div class='col-xs-12 paid-top-menu'>
                    <div class='col-xs-10' id='paid-info-topleft'>
                    
                   		<c:forEach var="result" items="${title }">
	                        <h1 class='paid-title'>
	                            ${result }
	                        </h1>
                   		</c:forEach>
                   		
                        <h3 id='paid-level'>
                            <span>For </span> ${lectureDetails[0].paidLecture.level }
                        </h3>
                        <div>
                            <button class="sg-btn-primary" id="paid-continue-btn">continue to LECTURE 24</button>
                        </div>

                    </div>
                    <div class='col-xs-2' id='paid-info-topright'>
                        <p style='font-weight: bold;'>언어</p>
                        <p id='paid-language-top'>
                            ${lectureDetails[0].paidLecture.lang }
                        </p>
                        <hr />
                        <p style='font-weight: bold;'>수강시작일</p>
                        <p id='paid-date-top'>
                            2018.10.11
                        </p>
                        <hr />
                        <p style='font-weight: bold;'>담당 마스터</p>
                        <p id='paid-instructor-top'>
                            ${lectureDetails[0].paidLecture.instructor.user.name}
                        </p>
                    </div>
                </div>
                <div class="col-xs-12 paid-progress">
                    <div class='top-icon'>
                        <span class="paid-top-icon left"><img src="/resources/img/paid/paid-start.png" class='paid-top-icon'></img></span>
                        <span class="paid-top-icon right"><img src="/resources/img/paid/flag.png" class='paid-top-icon'></img></span>
                    </div>

                    <div id='paid-bar-total'>
                        <div id="paid-bar-progress">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 paid-default-menu">
                <ul>
                    <li><a href=# id="detail-overview">OVERVIEW</a></li>
                    <li><a href=# id="detail-contents">COURSE CONTENTS</a></li>
                    <li><a href=#>MY NOTE</a></li>
                    <li><a href=#>Q&A</a></li>
                    <li><a href=#>BOOKMARK</a></li>
                    <li><a href=#>공지사항</a></li>
                </ul>
            </div>
            <div class="col-xs-12">
                <hr />
            </div>
           

				<div class="paid-contents">
				
					<!-- ajax 페이지 갱신 -->
				
				</div>

</div>       


<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>