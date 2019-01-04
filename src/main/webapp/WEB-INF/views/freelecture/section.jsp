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
.yb_entry_area, aside {
	float: left;
}
#yb-section {
	width: 100%;
}

h3 {
	margin-bottom: 20px;
}

h4 {
	margin-top: 20px;
	margin-bottom: 10px;
	font-size: 19px;
}

iframe {
	width: 100%;
	height: 400px;
}

aside {
	width: 300px;
	text-align: left;
	padding: 10px;
	border: 1px solid;
	border-right: none;
}

.yb_entry_area {
	border: 1px solid;

}

article {
	padding: 20px 35px;
	margin-bottom: 40px;
}

.yb_social_group_bar li {
	display: inline-block;
	padding: 10px 25px 0px 20px;
}

.yb_social_group_bar li:first-child {
	border-left: none;
}

.yb_social_group_bar {
	float: right;
}

.yb_user_image img {
	margin-top: 15px;
	width: 50px;
	height: 50px;
	margin-bottom: 10px;
	border: 1px soild black;
	border-radius: 50px;
}

.yb_form textarea {
	margin-top: 25px;
	margin-left: -30px;
}

.yb_form_wrap button {
	float: right;
	margin-right: 46px;
	margin-top: 10px;
}

#yb_coment_new_form {
	width: 820px;
	height: 150px;
	margin-bottom: 10px;
	border-bottom: 1px solid;
}

#yb_coment_list {
	width: 730px;
}

#yb_coment_list li {
	width: 700px;
	height: 100px;
}

ol, ul {
	list-style: none;
	margin: 0px;
	padding: 0px;
}

.yb_name_time {
	margin-top: 10px;
	margin-bottom: 10px;
}

.yb_name_time time {
	color: darkgrey;
	font-size: 11px;
	margin-left: 5px;
}

#cnt_more {
	text-align: center;
}

hgroup {
	text-align: center;
}

hr {
	border: 0;
	height: 1px;
	background: black;
}

.yb_entry_content {
	margin-top: 50px;
	text-align: left;
	width: 750px;
	
}

#yb_topic_list_index {
	margin-top: 20px;
}
.yb-title:hover{
	background-color: #ff7373;
	color:white;
}
.yb-title.active{
    background-color: #40e0d0;
    border-radius: 3px;
    }
.yb-title.active a{
	color:white;
    }
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		<div id="yb-section">
			<aside>
				<div id="yb_topic_list_index" class="index">
					<div>
						<a href="section.do?freeLectureNo=${param.freeLectureNo}">커버 페이지</a>
					</div>
					<hr>
					<h4>토픽 목록</h4>
					<nav class="yb_sub_nav">
						<ol id="yb_topic_list_tree" class="">
						<c:forEach var="section" items="${freeLectureSections}">
							<li>						
								<div class="yb-title ${section.count eq param.count ? 'active':'' }" style="padding: 5px;">
									<a href="section.do?freeLectureNo=${param.freeLectureNo}&count=${section.count }" style="width: 100%;display: inline-block;"> <span class="title">${section.sectionTitles}</span>
									</a>
								</div>
							</li>
						</c:forEach>
						</ol>
					</nav>
				</div>
			</aside>
			<div class="yb_entry_area">
				<article class="hentry">
					<hgroup>
						<h3 class="yb_entry_title">${freeSection.sectionTitles }</h3>
						<fmt:formatDate value="${freeSection.createDate }" pattern="yyyy-MM-dd"/>
					</hgroup>
						<hr>
					<div class="yb_entry_content">
						${freeSection.sectionContents }						
					</div>
				</article>
				<div class="yb_social_group"
					style="height: 41px; background-color: lightgray;">
					<ul class="yb_social_group_bar">
						<li><a href="#"><i class="far fa-eye"></i>봤어요(${freeSection.views })</a></li>
						<li><a href=""><i class="fas fa-angle-left"></i> 이전</a></li>
						<li><a href="">다음 <i class="fas fa-angle-right"></i></a></li>
					</ul>
				</div>
				<div class="yb_section_coment" data-role="collapsible">
					<h3 style="display: none;">댓글</h3>
					<form id="yb_coment_new_form" method="post" action="#"
						data-ajax="true">
						<div class="yb_user_image col-xs-2">
							<img
								src="/resources/img/user/icon/icon.png">
						</div>
						<div class="yb_form_wrap">
							<div class="yb_form col-xs-10">
								<textarea name="yb_cmt_coment"
									style="height: 60px; width: 100%;" id="input-comment"></textarea>
							</div>
							<script>
                                    $("#input-comment").focus(function(){
                                        $(this).animate({height:70});
                                        $("#yb_coment_new_form").animate({height: 148})
                                        $("#comment-submit").show();
                                    })
                                    $("#input-comment").focusout(function(){
                                        $(this).animate({height:40});
                                        $("#yb_coment_new_form").animate({height: 130})
                                        
                                    })
                                </script>
							<div class="yb_buttons">
								<button type="submit" id="comment-submit" style="display: none;">댓글
									올리기</button>
							</div>
						</div>
					</form>
					<ol style="list-style: none" ; id="yb_coment_list">
					<c:forEach items="${freeSection.comments }" var="comment">
						<li>
							<div class="yb_user_image col-xs-2">
								<img src="/resources/img/user/icon/${comment.writer.avatar.image != 'Default' ?  comment.writer.avatar.image : 'icon.png'}">
							</div>
							<div class="yb_name_time col-xs-10">
								<strong>${comment.writer.name}</strong> <a href="#"><time>${comment.createDate }</time></a>
							</div>
							<div class="yb_coment_content col-xs-10">${comment.contents }</div>
						</li>
					</c:forEach>
					</ol>
					<div id="cnt_more">
						<a href="#">
							<button>더 보기</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>