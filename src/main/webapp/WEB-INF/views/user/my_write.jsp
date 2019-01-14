<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp" %>
<link rel="stylesheet" href='/resources/css/user/my.css?ver=<%=new Date()%>'>
<style type="text/css">
	.sg-table{
	width:100%;
	}
	.sg-table td{
		display:block;
		width:100%;
		padding:5px;
		border-bottom:1px solid lightgray;
		font-size:16px;
	}
	.label{
	    padding: 0px 6px 0px 5px;
	    border-radius: 33.25em;
	}
	.label-primary{
		background-color:#33b7b1;
	}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>


	<div class="container">
     
     <%@include file="/WEB-INF/views/user/my_header.jsp" %>
    <div class="user-info-body" style="min-height:300px;margin-top:30px;padding-left:30px;">
            <div class="row">
               <div class="col-xs-6" style="border-right:1px solid lightgrey;">
                  <h3>나의 질문</h3>
                  <c:choose>
                  	  <c:when test="${fn:length(qnas) eq 0 }">
		                  <span style="font-size:17px;">아직 질문을 작성하지 않았습니다.</span>
		                  <a href="/qna/list.do">새로운 질문 하러가기</a>
	                  </c:when>
	                  <c:otherwise>
	                  <table class="sg-table">
	                  	<c:forEach items="${qnas }" var="qna">
	                  	<tr>
	                  		<td>
	                  			<a href="/qna/detail.do?qnaNo=${qna.no}">${fn:substring(qna.title,0,20)}${fn:length(qna.title) >= 20 ? '...':'' }</a>
	                  			<c:if test="${fn:length(qna.answers)> 0 }">
	                  				<label class="label label-primary">${fn:length(qna.answers) }</label>
	                  			</c:if>
	                  			<small style="float:right;">
	                  				<fmt:formatDate value="${qna.createDate }" pattern="yyyy-MM-dd HH:mm"/>
	                  			</small>
	                  		</td>
	                  		
	                  	</c:forEach>
	                  </table>
	                  </c:otherwise>
                  </c:choose>
               </div>
               <div class="col-xs-6">

				<div>
                  <h3>나의 답변</h3>
                  
                  
                  <c:choose>
                  	  <c:when test="${fn:length(answers) eq 0 }">
		                   <span style="font-size:17px;">아직 답변을 작성하지 않았습니다.</span>
                		   <a href="/qna/list.do">답변 하러가기</a>
	                  </c:when>
	                  <c:otherwise>
	                  <table class="sg-table">
	                  	<c:forEach items="${answers }" var="answer">
	                  		<tr>
	                  		<td>
		                  		<a href="/qna/detail.do?qnaNo=${answer.qnaNo}">
		                  			<c:out value='${fn:substring(answer.contents,0,20)}'/>${fn:length(answer.contents) >= 20 ? '...':'' }
		                  			<c:if test="${fn:length(answer.comments)>0 }">
		                  				<label class="label label-primary">${fn:length(answer.comments) }</label>
		                  			</c:if>
		                  		</a>
		                  		<small style="float:right;">
		                  			<fmt:formatDate value="${answer.createDate }" pattern="yyyy-MM-dd HH:mm"/>
		                  		</small>
		                  	</td>
		                  	</tr>
	                  	</c:forEach>
	                  	</table>
	                  </c:otherwise>
                  </c:choose>
                  </div>

               </div>
            </div>
         </div> 
      
    </div>


<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>