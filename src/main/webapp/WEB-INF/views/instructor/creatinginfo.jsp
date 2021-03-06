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

</style>
</head>
<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>
		<div class="container" style="margin-top: 30px;">
			<div class="main-title" style="text-align: center;">
				<h1 class="main-text">프로처럼 보이게 하는 법</h1>
			</div>

			<div>
				<div style="padding-top: 100px;" />
				<p class="tip-message">동영상 : 촬영 유형에 대한 팁</p>
				<img src="\resources\img\instructor\tip-1.JPG" alt="" class="tip-clip">

				<div style="padding-top: 150px;" />
				<p class="tip-message">오디오 : 흔한 오디오 문제 해결</p>
				<img src="/resources/img/instructor/tip-2.JPG" alt="" class="tip-clip">

				<div style="padding-top: 150px;" />
				<p class="tip-message">어조 및 전달력 : 성격이 드러나게 하십시오</p>
				<img src="/resources/img/instructor/tip-3.JPG" alt="" class="tip-clip">
			</div>
		</div>
		


		<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
