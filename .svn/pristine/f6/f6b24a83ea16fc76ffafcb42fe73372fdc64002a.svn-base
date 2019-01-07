<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp"%>
<link rel="stylesheet" href="/resources/css/paid/home.css?ver=1">
<script src="/resources/js/paid/home.js?ver=0"></script>

</head>
<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container">
	

	<c:choose>
		<c:when test="${param.lang == 'java'}">

			<div class="paid-home-courses-banner-java col-xs-12">
				<h1 id="paid-home-courses-category">JAVA COURSES</h1>
				<p id="paid-home-courses-description">전 세계에서 가장 많이 쓰이는 프로그래밍 언어, 자바</p>
			</div>

		</c:when>
		<c:when test="${param.lang == 'javascript'}">

			<div class="paid-home-courses-banner-javascript col-xs-12">
				<h1 id="paid-home-courses-category">JAVASCRIPT COURSES</h1>
				<p id="paid-home-courses-description">강력하고 유연한 웹의 NEXT GENERATION</p>
			</div>

		</c:when>
		<c:when test="${param.lang == 'spring'}">

			<div class="paid-home-courses-banner-spring col-xs-12">
				<h1 id="paid-home-courses-category">SPRING COURSES</h1>
				<p id="paid-home-courses-description">스프링을 안다면 당신은 OOP를 통달한 것이다</p>
			</div>

		</c:when>
	</c:choose>	



		<div class="paid-home-top-recommend col-xs-12">
			<ul>
				<li class="selected"><a href=#>NEW 4</a></li>
				<li><a href=#>TOP 4</a></li>
			</ul>
		</div>

		<div class="col-xs-12">
			<hr>
		</div>

		<div class="col-xs-12">
		
		<c:forEach var="result" items="${paidLectures }" varStatus="status">
			<div class="col-xs-3">
				<div class="panel panel-default paid-home-course-wrapper">
					<div class="panel-body">
						<div class="courses-photo">
						<a href="/paid/detail.do?no=${result.no }">
						
					<c:choose>
						<c:when test="${!empty result.thumbnail }">
							<img id="paid-home-courses-photo" src="/resources/img/paid/lectureimg/${result.thumbnail}" align="center" />
						</c:when>
						<c:otherwise>
							<img id="paid-home-courses-photo" src="/resources/img/paid/lectureimg/noimage.jpg" align="center" />
						</c:otherwise>
					</c:choose>
						
						
						</a>
						</div>
						<p id="paid-home-panel-top-title">${result.title }</p>
						<p id="paid-home-panel-top-instructor"><span>담당 마스터 : </span>${result.instructor.user.name}</p>
						<div>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							<span>4.5</span>
						</div>
						<div>
							<p id="paid-home-panel-top-price">
							<fmt:formatNumber value="${result.price }" pattern="#,###.##"/>
							<span> 원</span></p>
						</div>
					</div>
					
					<div class="paid-home-info-overlay">
						<div class="overlay-wrapper">
							<div class="overlay-date">
							   <span>UPDATED : </span>
							   <fmt:formatDate pattern = "yyyy-MM-dd" value = "${result.createDate }" />
							</div>
							<div class="overlay-title">
								<h4>${result.title }</h4>
							</div>
							<div class="overlay-level">
								<span>level : </span><span>${result.level }</span>
							</div>
							<div class="overlay-summary">
								${result.summary }
							</div>
							<div style="margin-left: 5px; font-size: 10px;">
								<a href="/paid/detail.do?no=${result.no }"> → 강좌 구경하기</a>
							</div>
							<div class="overlay-button">
								<c:choose>
									<c:when test="${LOGIN_USER eq null }">
									<a href="/user/signup.do">
										<button class="sg-btn-primary" id="home-nonLogin-btn">카트에 담기</button>
									</a>
									</c:when>
									<c:otherwise>
												<button class="sg-btn-primary home-cart-btn">카트에 담기</button>
												<input type="hidden" class="lectureNo" name="lectureNo" value="${result.no }">
									</c:otherwise>
																
								</c:choose>
							
							</div>

							
						</div>
					</div>
					
				</div>
			</div>
		</c:forEach>

		</div>


		<div class="paid-home-courses-contents-list col-xs-12">
			<h4>TOTAL <span style="font-size:25px; font-weight:700; color:red;"> ${countLectures } </span> COURSES</h4>
			
			<c:forEach var="result" items="${paidLectures }" varStatus="status">
					<a href="/paid/detail.do?no=${result.no }" id="paid-home-below-contents">
				<div class="col-xs-12 paid-courses-content">
					<div class="col-xs-2 courses-photo">
					
					<c:choose>
						<c:when test="${!empty result.thumbnail }">
							<img id="paid-home-courses-photo" src="/resources/img/paid/lectureimg/${result.thumbnail}" align="center" />
						</c:when>
						<c:otherwise>
							<img id="paid-home-courses-photo" src="/resources/img/paid/lectureimg/noimage.jpg" align="center" />
						</c:otherwise>
					</c:choose>
					
					</div>
					<div class="col-xs-7 paid-home-courseInfo-wrapper">
						<div>
							<h3 id="paid-home-courses-title">${result.title }</h3>
						</div>
						<div>
							<p id="paid-home-courses-content-description">${result.summary }</p>
						</div>
					</div>
					<div class="col-xs-2.5">
						<div>
							<p id="paid-home-courses-price">
							<fmt:formatNumber value="${result.price }" pattern="#,###.##"/>
							<span> 원</span>
							
							</p>
						</div>
					</div>
				</div>
					</a>					
			</c:forEach>

		</div>


	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>