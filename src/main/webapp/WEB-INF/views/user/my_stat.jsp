<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp" %>
<link rel="stylesheet" href='<c:url value="/resources/css/user/my.css?ver=0"/>'>
</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>


<div class="container">
     
     <%@include file="/WEB-INF/views/user/my_header.jsp" %>
     
     <div class="user-info-body" style="min-height:300px;margin-top:30px;padding-left:30px;">
         <div class="badge-top">
            <h3 class="text-center" style="margin:30px">현재 홍길동님의 티어는 브론즈 입니다.</h3>
            <div class="sg-badge-tier">
               <div class="sg-active">
                  <img src="/resources/img/user/bronze.png" alt="">
                  <span style="font-size:16px;margin:3px;font-weight:bold">브론즈</span>
               </div>
               <div class="">
                  <img src="/resources/img/user/silver.png" alt="">
               </div>
               <div class="">
                  <img src="/resources/img/user/gold.png" alt="">
               </div>
               <div class="">
                  <img src="/resources/img/user/platinum.png" alt="">
               </div>
               <div class="">
                  <img src="/resources/img/user/diamond.png" alt="">
               </div>
               <div class="">
                  <img src="/resources/img/user/challenger.png" alt="">
               </div>
            </div>
            <hr>
         </div>
         <div class="sg-badge-container">
            <div class="sg-badge-success">
               <h3>현재까지 ${fn:length(have)}개의 뱃지를 획득하셨습니다!</h3>
               <br>
               
            <c:forEach items="${have }" var="badge">
            <div class="sg-badge-sub">
               <i class="fas ${badge.icon }"></i>
               <div class="sg-badge-contents" style="">
                  <h3>${badge.name }</h3>
                  <p>${badge.condition }</p>
               </div>
               <span>${badge.exp }</span>
            </div>
            </c:forEach>
            
         </div>
         <hr>
         <h3>아직 ${fn:length(notHave) }개의 뱃지가 남았습니다..</h3>
         <br>
         <div class="sg-badge-default">
         
         	<c:forEach items="${notHave }" var="badge">
         	
            <div class="sg-badge-sub">
               <i class="fas ${badge.icon }"></i>
               <div class="sg-badge-contents" style="">
                  <h3>${badge.name }</h3>
                  <p>${badge.condition }</p>
               </div>
               <span>${badge.exp }</span>
            </div>
            
            </c:forEach>

         </div>
	</div>


<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>