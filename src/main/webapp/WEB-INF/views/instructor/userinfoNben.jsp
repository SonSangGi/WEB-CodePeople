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
	<!--네비게이션 바~~-->
		<div class="container" style="margin-top: 30px;">
			<div class="main-title">
				<h1 class="main-text">수강생 현황</h1>
				<button class="btn-ben-user">불량 수강생 일괄신고</button>
			</div>
			<hr>

			<table class="table">
				<thead>
					<th><input type="checkbox" /></th>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>불량 수강생 신고 <i class="fas fa-angry"
						style="font-size: 15px; color: #ff7373;"></i></th>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" /></td>
						<td>yangjj</td>
						<td>양재준</td>
						<td>1246dks@naver.com</td>
						<td>
							<button class="btn-ben-user">신고</button>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>kimsy</td>
						<td>김승용</td>
						<td>sad1245@naver.com</td>
						<td>
							<button class="btn-ben-user">신고</button>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>sonsg</td>
						<td>손상기</td>
						<td>zxcv12344@naver.com</td>
						<td>
							<button class="btn-ben-user">신고</button>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>kimyb</td>
						<td>김영범</td>
						<td>dsfko13@naver.com</td>
						<td>
							<button class="btn-ben-user">신고</button>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>kimdw</td>
						<td>김동원</td>
						<td>sdk125@naver.com</td>
						<td>
							<button class="btn-ben-user">신고</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>


	<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>
