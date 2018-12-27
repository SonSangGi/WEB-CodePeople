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
            <div class="row">
               <div class="col-xs-6" style="border-right:1px solid lightgrey;">
                  <h3>나의 질문</h3>
                  <span style="font-size:17px;">아직 질문을 작성하지 않았습니다.</span>
                  <a href="#">새로운 질문 하러가기</a>
                  <h3>나의 답변</h3>
                  <span style="font-size:17px;">아직 답변을 작성하지 않았습니다.</span>
                  <a href="#">답변 하러가기</a>
               </div>
               <div class="col-xs-6">
                  <div class="my-review-item">
                     <h3>내 리뷰</h3>
                     <ul>
                        <li>
                           <img src="img/java.jpg" alt="" style="width:30px;border-radius:100px;float:left;">
                           <a style="font-size:17px;margin-right:10px;color:black;width:150px;display:inline-block" href="#">자바를 자바</a><a href="#">정말 쓰레기같은 강좌네요.</a>
                        </li>

                           <li>
                              <img src="img/spring.png" alt="" style="width:30px;border-radius:100px;float:left;">
                              <a style="font-size:17px;margin-right:10px;color:black;width:150px;display:inline-block" href="#">스프링으로 부트!</a><a href="#">들을만해요.</a>
                           </li>
                     </ul>
                  </div>
               </div>
            </div>
         </div> 
      
    </div>


<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>