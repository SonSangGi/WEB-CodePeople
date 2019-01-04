<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="/WEB-INF/views/manager/common/head.jsp" %>

<body>
<div class="wrapper">

	<%@include file="/WEB-INF/views/manager/common/sidebar.jsp" %>

    <div class="main-panel">
		<nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="rtchat.do">실시간 채팅</a>
                </div>
                <%@include file="/WEB-INF/views/manager/common/navbar.jsp" %>
            </div>
        </nav>
        
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card">
                            <div class="header">
                                <h4 class="title">채팅 요청 리스트</h4>
                                <p class="category">Here is a subtitle for this table</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                        <th>번호</th>
                                    	<th>이름</th>
                                    	<th>임시 강의 번호</th>
                                    	<th>요청 날짜</th>
                                    	<th>승인확인</th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                        	<td>1</td>
                                        	<td>Dakota Rice</td>
                                        	<td>1</td>
                                        	<td>Niger</td>
                                        	<td>Oud-Turnhout</td>
                                        </tr>
                                        <tr>
                                        	<td>2</td>
                                        	<td>Minerva Hooper</td>
                                        	<td>2</td>
                                        	<td>Curaçao</td>
                                        	<td>Sinaai-Waas</td>
                                        </tr>
                                        <tr>
                                        	<td>3</td>
                                        	<td>Sage Rodriguez</td>
                                        	<td>3</td>
                                        	<td>Netherlands</td>
                                        	<td>Baileux</td>
                                        </tr>
                                        <tr>
                                        	<td>4</td>
                                        	<td>Philip Chaney</td>
                                        	<td>4</td>
                                        	<td>Korea, South</td>
                                        	<td>Overland Park</td>
                                        </tr>
                                        <tr>
                                        	<td>5</td>
                                        	<td>Doris Greene</td>
                                        	<td>5</td>
                                        	<td>Malawi</td>
                                        	<td>Feldkirchen in Kärnten</td>
                                        </tr>
                                        <tr>
                                        	<td>6</td>
                                        	<td>Mason Porter</td>
                                        	<td>6</td>
                                        	<td>Chile</td>
                                        	<td>Gloucester</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="/WEB-INF/views/manager/common/footer.jsp" %>
        
    </div>
</div>

</body>

<%@include file="/WEB-INF/views/manager/common/commonjs.jsp" %>

</html>