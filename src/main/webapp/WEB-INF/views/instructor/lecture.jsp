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
		<div class="naaaaame">
			<div class="">
				<span style="padding-right: 30px;">강사명 : 아이유</span> <input
					class="sg-input-text" type="text" name="" value="" placeholder="검색"
					name="keyword" style="width: 300px; height: 32px;">
				<button class="sg-btn sg-btn-primary sg-btn-sm">
					<i class="fas fa-search"></i>
				</button>
				<select class="main-sort">
					<option value="new-create" selected>정렬</option>
					<option value="notice">이름순</option>
					<option value="lecture">조회순</option>
				</select>
			</div>
			<p>개설 된 강좌명 : 스티브 잡스의 스피치</p>
			<!-- <form action="http:naver.com"  class="lecture-search">
          </form> -->
		</div>

		<div style="padding-top: 30px" />

		<div class="small-viewBox">
			<img src="/resources/img/instructor/detail-01.JPG" alt="">
			<p class="sub-text">No.1 입에 쓴 약이 몸에도 좋다.</p>
		</div>
		<div class="small-viewBox">
			<img src="/resources/img/instructor/detail-02.JPG" alt="">
			<p class="sub-text">No.2 성공하고 싶으면 보시오.</p>
		</div>
		<div class="small-viewBox">
			<img src="/resources/img/instructor/detail-03.JPG" alt="">
			<p class="sub-text">No.3 나는 스티브 잡스다.</p>
		</div>
		<div class="small-viewBox">
			<img src="/resources/img/instructor/detail-04.JPG" alt="">
			<p class="sub-text">No.4 아이폰 사세요.</p>
		</div>

		<div style="padding-top: 200px" />


		<div class="small-viewBox">
			<img src="/resources/img/instructor/detail-01.JPG" alt="">
			<p class="sub-text">No.5 입에 쓴 약이 몸에도 좋다.</p>
		</div>
		<div class="small-viewBox">
			<img src="/resources/img/instructor/detail-02.JPG" alt="">
			<p class="sub-text">No.6 성공하고 싶으면 보시오.</p>
		</div>
		<div class="small-viewBox">
			<img src="/resources/img/instructor/detail-03.JPG" alt="">
			<p class="sub-text">No.7 나는 스티브 잡스다.</p>
		</div>
		<div class="small-viewBox">
			<img src="/resources/img/instructor/detail-04.JPG" alt="">
			<p class="sub-text">No.8 아이폰 사세요.</p>
		</div>

		<div style="padding-top: 200px" />

		<div class="small-viewBox">
			<img src="/resources/img/instructor/detail-01.JPG" alt="">
			<p class="sub-text">No.9 입에 쓴 약이 몸에도 좋다.</p>
		</div>
		<div class="small-viewBox">
			<img src="/resources/img/instructor/detail-02.JPG" alt="">
			<p class="sub-text">No.10 성공하고 싶으면 보시오.</p>
		</div>
		<div class="small-viewBox">
			<img src="/resources/img/instructor/detail-03.JPG" alt="">
			<p class="sub-text">No.11 나는 스티브 잡스다.</p>
		</div>
		<div class="small-viewBox">
			<img src="/resources/img/instructor/detail-04.JPG" alt="">
			<p class="sub-text">No.12 아이폰 사세요.</p>
		</div>



		<div style="padding-top: 200px" />

		<div class="small-viewBox">
			<img src="/resources/img/instructor/detail-01.JPG" alt="">
			<p class="sub-text">No.13 입에 쓴 약이 몸에도 좋다.</p>
		</div>
		<div class="small-viewBox">
			<img src="/resources/img/instructor/detail-02.JPG" alt="">
			<p class="sub-text">No.14 성공하고 싶으면 보시오.</p>
		</div>
		<div class="small-viewBox">
			<img src="/resources/img/instructor/detail-03.JPG" alt="">
			<p class="sub-text">No.15 나는 스티브 잡스다.</p>
		</div>
		<div class="small-viewBox">
			<img src="/resources/img/instructor/detail-04.JPG" alt="">
			<p class="sub-text">No.16 아이폰 사세요.</p>
		</div>

		<div style="padding-bottom: 200px" />
	</div>




	<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>
