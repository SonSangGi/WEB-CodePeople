<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--네비게이션 바~~-->
   <div class="wrapper">
      <div class="sg-header">
         <div class="col-sm-offset-2 col-sm-8 sg-menu-left" style="display:block">
            <a href="#" style="float:left"><img alt="" src="<c:url value='/resources/img/'/>cope_logo.png" style="width:150px;"></a>
            <div class="sg-menu" style="margin-left:30%;">
               <ul>
                  <li>
                     <a href="#">강의</a>
                     <ul>
                        <li><a>Java</a></li>
                        <li><a>javaScript</a></li>
                        <li><a>Spring</a></li>
                        <li><a>로드 맵</a></li>
                     </ul>
                  </li>
                  <li>
                     <a href="#">외부강의</a>
                     <ul>
                        <li><a>Java</a></li>
                        <li><a>javaScript</a></li>
                        <li><a>Spring</a></li>
                        <li><a>로드 맵</a></li>
                     </ul>
                  </li>
                  <li>
                     <a href="#">게시판</a>
                     <ul>
                        <li><a>공지사항</a></li>
                        <li><a>관리자문의</a></li>
                     </ul>
                  </li>
                  <li><a>질의응답</a></li>
                  <li>
                     <form style="padding-left:50px;"action="http:naver.com" id="sg-form-search">
                        <input type="text" name="" value="" placeholder="검색" style="text-align:center;border-radius:10px;border:none;height:30px;" name="keyword">
                        <button class="fas fa-search" style="border:none;background:none;color:white;font-size:20px;"></button>
                     </form>
                  </li>
               </ul>
            </div>
         </div>
         <div class="col-xs-2 sg-menu-right">
            <span class="sg-menu-login"style="font-size:15px;color:white;font-weight:bold">로그인 | 회원가입</span>
            <a class="glyphicon glyphicon-user" style="font-size:25px;"></a>
            <div class="sg-menu-info">
               <div class="sg-info-menu-box">
                  <div class="sg-info-header">
                     <div class="sg-user-img">
                        <img src="https://d81pi4yofp37g.cloudfront.net/wp-content/uploads/300.png" alt="" style="width:70px;height:70px;border-radius:100px;margin:10px;float:left;">
                     </div>
                     <div class="sg-user-info">
                        <p>손상기</p>
                        <p>100</p>
                        <p>로그아웃</p>
                     </div>
                  </div>
                  <div class="sg-info-body">
                     <ul>
                        <li>a</li>
                        <li>a</li>
                        <li>a</li>
                        <li>a</li>
                        <li>a</li>
                        <li>a</li>
                     </ul>

                  </div>

               </div>
            </div>
         </div>
      </div>
      <!--네비게이션바 끝~~-->
      <!--유저 헤더 시작~~-->
      <div class="sg-user-header" style="background: url(<c:url value='/resources/img/'/>basic-header.jpg) 0% 0% / cover !important;position:relative">
         <div class="container text-center sg-user-show">
            <div class="">
               <div class="text-center">
               <!-- 유저가 null 일 경우 -->
                  <img class="sg-profile-img" src="<c:url value='/resources/img/'/>icon.png" width="165px" height="165px" alt="">
               </div>
               <div class="col-xs-12 text-center" style="margin-top:20px;">
                  <a style="color:white;font-size:25px;font-weight:bold" href="#">홍길동</a>
                  <span class="sg-text-white">(hong0306)</span>
               </div>
            </div>
         </div>
         <div class="text-center btn-close-header" style="opacity:0.3;background-color:grey;cursor:pointer;">
           <i class="fas fa-caret-up sg-size-lg sg-text-white" ></i>
         </div>
      </div>
      <!--유저 헤더 끝~~-->
