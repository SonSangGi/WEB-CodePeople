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
  <style media="screen">
	.user-friends.active{
	background-color: #ffbaba;
	}
	input::placeholder{
	}
	.name-search{
	background: transparent;
	color: white;
	position: absolute;
	right: 20px;
	top: 10px;
	border: 1px solid #ffbaba;
	border-radius: 3px;
	padding: 5px;
	font-weight: 500;
	}
   .my-chat-my {
     border-radius: 15px;
     border-top-right-radius: 3px;
     display: inline-block;
     margin: 5px 10px 0px 150px;
     padding: 10px;
     text-align: left;
     background-color: lightgrey;
   }

   .my-chat-you {
     font-size: 17px;
     border-radius: 15px;
     border-top-left-radius: 3px;
     display: inline-block;
     margin: 5px 0px 10px 30px;
     padding: 10px;
     background-color: #600074;
     color: white;
     font-weight: bold;
     text-align: left;
   }
   .my-chat-box{
      width: 100%;
	}
  </style>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>


<div class="container">
     
     <%@include file="/WEB-INF/views/user/my_header.jsp" %>
     
       <div class="user-info-body" style="min-height:300px;padding-left:30px;">
        <div class="row">
          <div class="col-xs-4" style="background-color: #fff6f6;border-right:1px solid lightgray;padding:0px;overflow:auto;height:500px;">
            <div class="" style="background-color:white;border-bottom:1px solid #ffbaba;height:70px;">
               <input class="name-search" type="text" name="" value="" placeholder="이름 검색">
            </div>
            <c:forEach items="${friends }" var="friend">
            <c:if test="${friend.id != LOGIN_USER.id }">
	            <div class="user-friends" style="">
	              <img src="/resources/img/user/icon/${friend.avatar.image eq 'Default' ? 'icon.png' : friend.avatar.image}" alt="" style="width:50px;height:50px;border: 1px solid lightgray;border-radius:100px;margin:10px;">
	              <span class="friends-name">${friend.name }</span>
	              <input type="hidden" id="friends-id" value="${friend.id }">
	            </div>
            </c:if>
            </c:forEach>
            
            
          </div>
          <div class="col-xs-8" style="padding:0px;height:100%">
            <div class="" style="width:100%;margin:0px;padding:0px;background-color:#ffbaba">
              <img src="https://d81pi4yofp37g.cloudfront.net/wp-content/uploads/300.png" alt="" style="width:50px;height:50px;border: 1px solid lightgray;border-radius:100px;margin:10px;">
              <span class="chat-friends-name">손상기</span>
            </div>
            <div class="my-chat-body" style="height:380px;border-right:1px solid lightgray;overflow:auto;">
            </div>
            <input type="text" id="my-chat-msg" style="border:1px solid lightgray;width:100%;height: 50px;margin:0px;padding:10px;">
            <button type="button" class="my-chat-send" style="position:absolute;right:0px;bottom:0px;padding:10px;">전송</button>
          </div>
        </div>

      </div>
      
      
    </div>
    
   
<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>