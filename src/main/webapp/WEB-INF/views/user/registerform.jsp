<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form:form action="register.do" method="POST" style="padding:30px;" modelAttribute="userform">
			<div>
				아이디:
				<form:input type="text" path="id" class="form-control"/>
				<form:errors path="id" id="xxxxxxxxxxxxxx"></form:errors>
			</div>
			<div>
				비밀번호:
				<form:input type="password" path="password" class="form-control" />
				<form:errors path="password"></form:errors>
			</div>	
			<div>
				이름:
				<form:input type="text" path="name" class="form-control"/>
				<form:errors path="name"></form:errors>
			</div>
			<div>
				이메일:
				<form:input type="email" path="email" class="form-control"/>
				<form:errors path="email"></form:errors>
			</div>
				<button>전송</button>
			</form:form>
</body>
</html>