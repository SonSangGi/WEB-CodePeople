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
			<div class="main-title">
				<h1 class="main-text">성과</h1>

				<select class="main-sort">
					<option value="new-create" selected style="display: none">새로
						작성</option>
					<option value="notice">공지사항</option>
					<option value="lecture">강좌</option>
				</select>
			</div>
			<hr>

			<div style="float: left;">
				<h4>
					<b>개요 ◁</b>
				</h4>
				<br>
				<h4>수강생</h4>
				<br>
				<h4>유망주제</h4>
			</div>

			<div class="result-tab">
				<p class="result-category" style="padding-right: 80px;">총 수익</p>
				<p class="result-category" style="padding-right: 10px;">총 등록</p>
				<p class="result-category">강사 평점</p>

				<div style="padding-top: 50px;" />

				<h2 class="result-outcome" style="padding-right: 60px;">20,000
					KRW</h2>
				<h2 class="result-outcome" style="padding-right: 75px;">4건</h2>
				<h2 class="result-outcome">4.5</h2>
				<button class="moment">This month</button>
			</div>

			<br>
			<hr>

			<img src="/resources/img/instructor/graph.JPG" alt=""
				style="width: 600px; height: 400px; margin: 20px 0px 0px 40px;">

			<select class="moment-sort">
				<option value="year" selected>지난 12개월</option>
				<option value="month">지난 30일</option>
				<option value="week">지난 7일</option>
				<option value="all-profit">전체 수익</option>
			</select>

			<button class="btn-move-report">수익보고서 출력</button>


			<div style="padding-top: 80px;" />
			<button class="btn-move-backward">이전</button>
		</div>



	<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>
