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
                    <a class="navbar-brand" href="acknowledge.do">강사/강의 승인</a>
                </div>
                <%@include file="/WEB-INF/views/manager/common/navbar.jsp" %>
            </div>
        </nav>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card">
                            <div class="header">
                                <h4 class="title">강의 신청</h4>
                                <p class="category">Here is a subtitle for this table</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
	                                        <th>요청 번호</th>
	                                    	<th>이름</th>
	                                    	<th>임시 강의 번호</th>
	                                    	<th>요청 날짜</th>
	                                    	<th>승인확인</th>
                                    	</tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                        	<td>1</td>
                                        	<td>Dakota Rice</td>
                                        	<td>1</td>
                                        	<td>Niger</td>
                                        	<td>Oud-Turnhout</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- 무료강의 -->
                    <div class="col-md-12">
                        <div class="card card">
                            <div class="header">
                                <h4 class="title">등록된 무료 강의</h4>
                                <p class="category">Here is a subtitle for this table</p>
                            </div>
                            <div style="text-align: center;">
                            	<button class="btn btn-primary" type="button" onclick="window.open('/free/form.do')">무료강의 등록</button>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                    	<tr>
	                                        <th>강의 번호</th>
	                                    	<th>제목</th>
	                                    	<th>재생시간</th>
	                                    	<th>난이도</th>
	                                    	<th>기능</th>
                                    	</tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="freeLecture" items="${freeLectures }">
                                        <tr>
                                        	<td>${freeLecture.no }</td>
                                        	<td>${freeLecture.lectureTitle }</td>
                                        	<td>${freeLecture.lectureTime }</td>
                                        	<td>${freeLecture.lectureLevel }</td>
                                        	<td><button type="button" class="btn btn-danger btn-xs" onclick="location.href='/free/delete.do?freeLectureNo=${freeLecture.no }'">삭제</button></td>
                                        </tr>
									</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- 무료강의 -->
                </div>
            </div>
        </div>

        <%@include file="/WEB-INF/views/manager/common/footer.jsp" %>
        
    </div>
</div>

</body>

<%@include file="/WEB-INF/views/manager/common/commonjs.jsp" %>

</html>