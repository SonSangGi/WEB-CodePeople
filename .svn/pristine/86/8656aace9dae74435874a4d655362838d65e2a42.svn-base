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
			<h1 class="main-text">강좌 만들기</h1>
			<br> <br>
			<p class="sub-title">Step 1. 제목과 카테고리를 선택해주세요.</p>
		</div>
		<hr>

		<form action="create.do" method="post" id="">
		<div>
			<h2 style="text-align: center;">강좌 제목은 결정하셨나요?</h2>
			<p class="sub-title" style="font-size: 25px; text-align: center;">지금
				좋은 제목이 생각나지 않아도 괜찮습니다. 나중에 변경할 수 있습니다.</p>
			<br> <input class="title-inputbox" type="text"
				placeholder="   예 : 기초부터 배우는 JAVA"></input>
		</div>

		<div style="padding-top: 50px;" />

		<div>
			<h2 style="text-align: center;">강의하시려는 분야의 카테고리를 선택해주세요.</h2>
			<p class="sub-title" style="font-size: 25px; text-align: center;">선택한
				카테고리가 적절하지 않더라도 나중에 변경할 수 있습니다.</p>
			<br> <select class="category-select">
				<option value="java">Java</option>
				<option value="javascript">JavaScript</option>
				<option value="spring">Spring</option>
			</select>
		</div>

		<div style="padding-top: 50px;" />
		
		<div>
			<h2 style="text-align: center;">만드시려는 강좌의 난이도를 선택해주세요.</h2>
			<p class="sub-title" style="font-size: 25px; text-align: center;">선택한
				난이도가 적절하지 않더라도 나중에 변경할 수 있습니다.</p>
			<br> <select class="level-select-box">
				<option value="Beginner">입문</option>
				<option value="Low">초급</option>
				<option value="Middle">중급</option>
				<option value="High">고급</option>
			</select>
		</div>
	
		<div style="padding-top: 50px;" />
	
		<div>
			<h2 style="text-align: center;">만드시려는 강좌의 개요를 작성해주세요.</h2>
			<p class="sub-title" style="font-size: 25px; text-align: center;">수정은 언제든지 가능합니다.</p>
			<br> <textarea class="summary-box" rows="6	" cols="70" placeholder=
			"예: Java는 웹 서비스, 모바일 앱, 시스템 구축 등의 여러가지 산업 분야에서 활용하고 있는 프로그래밍 언어입니다. 실전 자바 강좌를 통해, Java 언어를 활용하기 위한 기본 지식 부터 차근차근 익혀보세요. 다른 언어를 경험해 보지 않은 초보자의 기준으로 제작된 강의이기 때문에 처음 프로그래밍에 입문한 분들도 어렵지 않게 들으실 수 있어요.">
</textarea>
		</div>
		

		
		</form>
		
		
		<div style="padding-top: 300px;" />
		<hr>
		
		<button class="btn-move-backward">이전</button>
		
		<input type="submit" class="btn-submit-lecture" value="등록">
		

		<div style="padding-bottom: 100px;" />
	</div>
	
	<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>
