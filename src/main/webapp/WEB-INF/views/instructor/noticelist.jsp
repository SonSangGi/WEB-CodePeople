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
			<h1 class="main-text">김유신 강사 님의 공지사항 게시판</h1>
		</div>
		<hr>
		
		<div style="height: 37px;"line-height: 37px; margin-left: 27px;">
			<form action="noticelist.do" id="notice-search-form">
				<div style="display: inline-block">
					<button class="btn-link-sort ${param.sort eq 'new' ? 'active':'' }" value="new">최신순</button>
					<button class="btn-link-sort ${param.sort eq 'rep' ? 'active':'' }" value="rep">답변순</button>
					<button class="btn-link-sort ${param.sort eq 'view' ? 'active':'' }" value="view">조회순</button>
					<input type="hidden" name="sort" id="sort-value" vlaue="${param.sort }">
					<input type="hidden" name="cp" id="cp-value" value="${param.cp }">
				</div>			
			</form>
		</div>
	

	</div>




	<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>
