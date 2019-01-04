<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<link rel="stylesheet" href="/resources/css/instructor/boxs.css?ver=1">
<link rel="stylesheet" href="/resources/css/instructor/buttons.css?ver=1">
<link rel="stylesheet" href="/resources/css/instructor/common.css?ver=1">
<link rel="stylesheet" href="/resources/css/instructor/image.css?ver=1">
<style>


.file-submit {
	width: 150px;
	height: 30px;
	border-radius: 10px;
	border: #40e0d0;
	background-color: #40e0d0;
	font-size: 20px;
	color: white;
	float: right;
}


</style>
</head>
<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<div class="wrapper">



		<div class="container" style="margin-top: 30px;">
			<div class="main-title" style="text-align: center;">
				<h1 class="main-text">동영상 업로드 완료</h1>

				<div class="upload-lending-tab">
					<img class="landing-view" src="/resources/img/instructor/landing-page.JPG">

					<div class="view-info">
						<h4>스프링 강의 테스트 동영상</h4>
						<p style="color: rgba(0, 0, 0, 0.25);">2018 12월27일</p>
					</div>
					<div class="test1">
						<input type="checkbox" class="feedback-checkbox" checked>
						<p style="margin: 0px 155px 0px 0px;">피드백 준비됨.</p>

					</div>
				</div>
			</div>



			<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
