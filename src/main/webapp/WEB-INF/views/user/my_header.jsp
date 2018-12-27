<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <div class="container">
      <div class="row text-center user-info-header" style="border-bottom:1px solid lightgray">

        <div class="home" style="margin-left:10px;padding: 10px 40px 10px 40px;display:inline-block;font-size:17px;border-top-right-radius: 10px;">
          <a href="home.do">HOME</a>
        </div>
        <div class="video" style="margin-left:10px;padding: 10px 40px 10px 40px;display:inline-block;font-size:17px;border-top-right-radius: 10px;">
          <a href="video.do">내 강좌</a>
        </div>
        <div class="dashboard" style="margin-left:10px;padding: 10px 40px 10px 40px;display:inline-block;font-size:17px;border-top-right-radius: 10px;">
          <a href="dashboard.do">학습현황</a>
        </div>
        <div class="stat" style="margin-left:10px;padding: 10px 40px 10px 40px;display:inline-block;font-size:17px;border-top-right-radius: 10px;">
          <a href="stat.do">나의 경험</a>
        </div>
        <div class="write" style="margin-left:10px;padding: 10px 40px 10px 40px;display:inline-block;font-size:17px;border-top-right-radius: 10px;">
          <a href="write.do" style="width:80px;">내 글</a>
        </div>
        <div class="info" style="margin-left:10px;padding: 10px 40px 10px 40px;display:inline-block;font-size:17px;border-top-right-radius: 10px;">
          <a href="info.do">내 정보</a>
        </div>
      </div>
    </div>
    <script>
    	var menu = location.pathname.split("/");
    	$("."+menu[3].replace(".do","")).addClass("sg-menu-select");
    </script>