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
				<h1 class="main-text">강좌를 업로드해주세요.</h1>
				<br> <br>
				<p class="title-text">좋습니다! 이제 강좌를 업로드해주십시오. 완벽할 필요는 없다는 점을 기억하고
					촬영한 영상을 업로드해주십시오.</p>
				<br> <img src="/resources/img/instructor/upload.JPG" alt="">
			</div>

			<div>

				<div style="padding-top: 50px;" />

				<h4 style="text-align: center;">원하는 것에 대해 이야기하거나 Code people의
					리소스를 사용하십시오.</h4>

				<div style="margin: 20px 0px 0px 460px;">
					<p>○ 간단한 작업을 가르쳐보세요.</p>
					<p>○ 무언가에 열정을 갖게 된 이유를 설명해보세요.</p>
					<p>○ 사물 또는 기능과 그 사용법을 설명해보세요.</p>
				</div>
			</div>

			<div>
				<br>
				<h4 style="margin: 0px 0px 0px 400px;">동영상 업로드</h4>
				<br> <input class="file-uploader" type="file"></input>
				<div style="padding-top: 10px;" />
				<p style="text-align: center; font-size: 15px;">
					<b>참고</b>: 모든 파일은 720p 이상, 4.0GB 이하여야 합니다.
				</p>
			</div>
		</div>



		<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
