<%@page import="com.jhta.cope.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<style>
.container {
	margin-top: 50px;
}

.yb_contents_title {
	margin-bottom: 20px;
}

.yb-contents {
	width: 75%;
}

.yb-contents-sidebar {
	width: 25%;
}

iframe {
	width: 800px;
	height: 400px;
}

.yb_contents_text p {
	font-size: 17px;
	line-height: 180%;
}

h2 {
	margin-top: 20px;
	margin-bottom: 20px;
}

h3 {
	margin-bottom: 30px;
}

h4 {
	margin-top: 20px;
	margin-bottom: 10px;
	font-size: 22px;
}

.fab.fa-java {
	color: #ff7373;
}

.yb_contents_sub ul {
	margin-left: 20px;
	list-style-type: disc;
	font-size: 16px;
	line-height: 250%;
}

.yb_reiview_score {
	text-align: center;
	margin-bottom: 30px;
}

.yb_reiview_score p:first-child {
	font-size: 120px;
	font-weight: 600;
	margin: 0px;
}

.yb_coment_score {
	margin-bottom: 10px;
}

.yb_comment-avatar {
	float: left;
}

.yb_comment-avatar img {
	width: 70px;
	height: 70px;
	margin-bottom: 10px;
	border: 1px soild black;
	border-radius: 100px;
	margin-right: 50px;
	margin-top: 35px;
}

.yb_reviewlist_commentlist {
	list-style-type: none;
	padding: 0px;
}

.yb_comment-body {
	display: inline-block;
}

.yb_comment-body p:nth-child(2) {
	margin-top: 10px;
	font-weight: bold;
	line-height: 100%;
}

.yb-course-img img {
	width: 100%;
	height: 195px;
}

.fas.fa-star, .fa-star-half-alt {
	color: #ad8d00;
}

.yb-contents-sidebar {
	border: 1px solid black;
	margin-top: 79px;
}

.yb_sidebar_admin img {
	margin-top: 10px;
	width: 150px;
	height: 150px;
	margin-bottom: 10px;
	border: 1px soild black;
	border-radius: 50px;
}

.yb_sidebar_admin {
	text-align: center;
	margin-bottom: 20px;
}

.yb-contents-sidebar p:last-child {
	text-align: center;
	margin-bottom: 10px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		<div class="yb-contents col-md-9">
			<div class="yb_contents_title">
				<h1>${freeLecture.lectureTitle}</h1>
			</div>
			<div class="yb_course_video">
				${freeLecture.lectureContent }
			</div>
			<div class="yb_course_reviews" id="">
				<h4>강좌 평가</h4>
				<hr>
				<div class="yb_review_breakup row">
					<div class="col-md-6">
						<div class="yb_reiview_score">
							<p>4.8</p>
							<div class="">
								<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star-half-alt"></i>
							</div>
							<p>13개의 수강평</p>
						</div>
					</div>

				</div>
				<div class="yb_show_course_reviews">
					<ol class="yb_reviewlist_commentlist">

						<li class="">
							<div id="" class="yb_comment-body">
								<div class="yb_comment-body-inner">
									<div class="yb_comment-avatar">
										<img
											src="http://optimal.inven.co.kr/upload/2017/10/09/bbs/i15099200313.jpg">
									</div>
									<div class="yb_comment-body">
										<div>
											<a>2018년 12월 26일</a>
										</div>
										<p>강의 잘 들었습니다</p>
										<div class="yb_coment_score">
											<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star-half-alt"></i>
										</div>
										<p>감사합니다</p>
										<hr>
									</div>
								</div>
							</div>
						</li>
						<li class="">
							<div id="" class="yb_comment-body">
								<div class="yb_comment-body-inner">
									<div class="yb_comment-avatar">
										<img
											src="http://optimal.inven.co.kr/upload/2017/10/09/bbs/i15099200313.jpg">
									</div>
									<div class="yb_comment-body">
										<div>
											<a>2018년 12월 26일</a>
										</div>
										<p>강의 잘 들었습니다</p>
										<div class="yb_coment_score">
											<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star-half-alt"></i>
										</div>
										<p>감사합니다</p>
										<hr>
									</div>
								</div>
							</div>
						</li>
						<li class="">
							<div id="" class="yb_comment-body">
								<div class="yb_comment-body-inner">
									<div class="yb_comment-avatar">
										<img
											src="http://optimal.inven.co.kr/upload/2017/10/09/bbs/i15099200313.jpg">
									</div>
									<div class="yb_comment-body">
										<div>
											<a>2018년 12월 26일</a>
										</div>
										<p>강의 잘 들었습니다</p>
										<div class="yb_coment_score">
											<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star-half-alt"></i>
										</div>
										<p>감사합니다</p>
										<hr>
									</div>
								</div>
							</div>
						</li>
					</ol>
				</div>
			</div>
		</div>
		<div class="yb-contents-sidebar col-md-3">
			<div class="yb_sidebar_admin">
				<img
					src="http://optimal.inven.co.kr/upload/2017/10/09/bbs/i15099200313.jpg">
				<p>관리자</p>
				<hr>
			</div>
			<div class="">
				<div class="row">
					<div class="col-md-4">
						<p class="text-left">평생</p>
					</div>
					<div class="col-md-3 col-md-offset-5">
						<i class="far fa-clock"> </i>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-4">
						<p class="text-left">초급</p>
					</div>
					<div class="col-md-3 col-md-offset-5">
						<i class="fas fa-signal"></i>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-4">
						<p class="text-left">12시간</p>
					</div>
					<div class="col-md-3 col-md-offset-5">
						<i class="far fa-calendar-alt"></i>
					</div>
				</div>
				<hr>
			</div>
			<p>
				<a class="button" href="">배우러 가기</a>
			</p>
		</div>
	</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>