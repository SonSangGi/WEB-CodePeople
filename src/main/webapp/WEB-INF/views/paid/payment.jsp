<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<link rel="stylesheet" href="/resources/css/paid/cart.css?ver=1">
<!-- 아임포트 결제모듈 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="/resources/js/paid/cart.js?ver=1"></script>

</head>
<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container">

		결제 성공!
		내 강좌 목록 보러 가기

	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>