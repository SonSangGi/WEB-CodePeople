<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <%@include file="/WEB-INF/views/include/style.jsp" %>
   
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR" rel="stylesheet">
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"/>
   <link rel="stylesheet" href="css/sg.css">
   <script src="js/sg.js"></script>
   <style>
          .body{
            transition: 2s;
          }
          .main-title>h1{
            display: inline-block;
          }
           .main-text {
            margin: 0px;
           }

           .instructorName>p {
             display: inline-block;
           }


           .main-sort {
             float: right;
             border:3px solid #ff7373;
             border-radius: 10px;
             width: 200px;
             font-size: 15px;
             text-align: center;
             background-color: #ff7373;
             color: white;
           }

           .lecture-search {
             float: right;
             margin: 20px 800px 20px 50px;
           }

          .sub-sort>.lecture-search {
            display: inline-block;
            float: right;
            margin: 0px 0px 500px 1000px;
          }

          .add-lecture {
            width: 500px;
            height: 80px;
            font-size: 50px;
            margin: 10px 400px 10px 320px;
          }

          .create-info {
            width: auto;
            height: 80px;
            text-align: center;
            font-size: 40px;
            background-color: lightgray;
            background-size: 100;
          }
   </style>
</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>
   <!--네비게이션 바~~-->
   <div class="wrapper">
      <div class="sg-header">
         <div class="col-sm-offset-2 col-sm-8 sg-menu-left" style="display:block">
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
      <div class="sg-user-header" style="background: url(img/basic-header.jpg) 0% 0% / cover !important;position:relative">

         <div class="text-center btn-close-header" style="opacity:0.3;background-color:grey;cursor:pointer;">
           <i class="fas fa-caret-up sg-size-lg sg-text-white" ></i>
         </div>
      </div>
      <!--유저 헤더 끝~~-->














      <!--컨테이너-->


      <div class="container" style="margin-top:30px;">
        <div class="main-title">
          <h1 class="main-text">수강생 현황</h1>
          <button class="main-sort">불량 수강생 신고</button>
        </div>
        <hr>

        <table class="table">
            <thead>
             <th>아이디</th>
             <th>이름</th>
             <th>이메일</th>
            </thead>
            <tbody>
              <tr>
                <td>yangjj</td>
                <td>양재준</td>
                <td>1246dks@naver.com</td>
              </tr>
              <tr>
                <td>kimsy</td>
                <td>김승용</td>
                <td>sad1245@naver.com</td>
              </tr>
              <tr>
                <td>sonsg</td>
                <td>손상기</td>
                <td>zxcv12344@naver.com</td>
              </tr>
              <tr>
                <td>kimyb</td>
                <td>김영범</td>
                <td>dsfko13@naver.com</td>
              </tr>
              <tr>
                <td>kimdw</td>
                <td>김동원</td>
                <td>sdk125@naver.com</td>
              </tr>
            </tbody>
        </table>
        </div>
      </div>


<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>
