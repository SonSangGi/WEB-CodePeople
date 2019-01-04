<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<link rel="stylesheet" href="/resources/css/instructor/boxs.css?ver=1">
<link rel="stylesheet"
	href="/resources/css/instructor/buttons.css?ver=1">
<link rel="stylesheet" href="/resources/css/instructor/common.css?ver=1">
<link rel="stylesheet" href="/resources/css/instructor/image.css?ver=1">
<style>
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container" style="margin-top: 30px;">
		<div class="main-title">
			<h1 class="main-text">수익보고서</h1>
		</div>
		<hr>
		<div>
			<i class="fab fa-reddit"
				style="font-size: 100px; color: #afeeee; margin: 0px 0px 10px 530px;"></i>
			<h4 style="text-align: center;">곧 여기에서 강좌 등록을 통해 창출 된 수익을 확인 할 수
				있습니다!</h4>

			<button class="btn-download-excelform"
				style="margin: 30px 0px 0px 390px;">수익보고서 다운로드(Excel)</button>
		</div>

		<div style="padding-top: 400px;" />


		<button class="btn-move-backward">이전</button>

	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>
