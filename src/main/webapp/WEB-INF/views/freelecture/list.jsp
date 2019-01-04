<%@page import="com.jhta.cope.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드피플 - 메인페이지</title>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<style>
.yb-course-container {
	width: 320px;
	padding: 10px;
	margin-right: 50px;
	margin-bottom: 30px;
	margin-top: 50px;
	float: left;
	text-align: center;
}

.yb-course-container>p {
	font-size: 17px;
	line-height: 180%;
}

.yb-text-red {
	color: red;
	font-weight: bold
}

.yb-course-container a {
	background-color: white;
	text-align: center;
	border: 2px solid #00a0d2;
	font-size: 13px;
	padding: 10px 20px 10px 20px;
	border-radius: 3px;
	font-weight: bold;
	transition: 0.7s;
}

.yb-course-container p:last-child {
	margin-top: 20px;
}

.yb-course-container a:hover {
	background-color: #00a0d2;
	color: white;
}

h3 {
	margin-bottom: 30px;
}

h4 {
	margin-top: 20px;
	margin-bottom: 10px;
	font-size: 19px;
}

.yb-course-img img {
	width: 100%;
	height: 195px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		<c:forEach var="freeLecture" items="${freeLectures }">
			<div class="yb-course-container">
				<h3>${freeLecture.lectureTitle}</h3>
				<div class="yb-course-img">
					<img
						src="/resources/img/free/${freeLecture.lectureImg }"
						alt="">
				</div>
				<h4>백지 상태에서 만들 수 있도록!!</h4>
				<p>
					${freeLecture.lectureSummary }
				</p>
				<p>
					<a id="yb-course-button21" class="button" href="/free/detail.do?freeLectureNo=${freeLecture.no }">
						배우러 가기 </a>
				</p>
			</div>
		</c:forEach>
		<div class="yb-course-container">
			<h3>게임을 만들어 보자!</h3>
			<div class="yb-course-img">
				<img
					src="https://d81pi4yofp37g.cloudfront.net/wp-content/uploads/unitycourse-460x299.png"
					alt="">
			</div>
			<h4>백지 상태에서 만들 수 있도록!!</h4>
			<p>
				등하교, 출퇴근 할때 폰으로 매일같이 즐기는 게임! <br> <span class="yb-text-red">아무것도
					모르는 입문자</span>를 대상으로 알려주는 게임 개발 강좌들 입니다. <br> 직접 꿈꾸던 게임들을 만들어 보세요!
			</p>
			<p>
				<a id="yb-course-button21" class="button" href="">
					배우러 가기 </a>
			</p>
		</div>
	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>