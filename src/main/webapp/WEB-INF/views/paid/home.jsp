<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp" %>
<link rel="stylesheet" href="/resources/css/paid/home.css">
<script src="/resources/js/paid/home.js"></script>

</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div class="container">

	   <div class="paid-top-default">
          <div class='col-xs-12 paid-top-menu'>
              <div class='col-xs-10' id='paid-info-topleft'>
                  <!-- 강좌 제목 -->
                  <h1 class='paid-title'>
                      JAVA
                  </h1>
                  <h1 class='paid-title'>
                      PROGRAMMING
                  </h1>
                  <h1 class='paid-title'>
                      MASTER
                  </h1>
                  <h3 id='paid-level'>
                      For Intermediate
                  </h3>
                  <div>
                      <button class="sg-btn-primary" id="paid-continue-btn">continue to LECTURE 24</button>
                  </div>

              </div>
              <div class='col-xs-2' id='paid-info-topright'>
                  <p style='font-weight: bold;'>언어</p>
                  <p id='paid-language-top'>
                      JAVA
                  </p>
                  <hr/>
                  <p style='font-weight: bold;'>수강시작일</p>
                  <p id='paid-date-top'>
                      2018.10.11
                  </p>
                  <hr/>
                  <p style='font-weight: bold;'>담당 마스터</p>
                  <p id='paid-instructor-top'>
                      이응수
                  </p>
              </div>
          </div>
          <div class="col-xs-12 paid-progress">
              <div class='top-icon'>
                 <span class="paid-top-icon left"><img src="/resources/img/paid-start.png" class='paid-top-icon'></img></span>
                  <span class="paid-top-icon right"><img src="/resources/img/flag.png"  class='paid-top-icon'></img></span>
              </div>

              <div id='paid-bar-total'>
                  <div id="paid-bar-progress">
                  </div>
              </div>
          </div>
      </div>
      
      
      <div class="col-xs-12 paid-default-menu">
         <ul>
             <li><a href=#>OVERVIEW</a></li>
             <li><a href=#>COURSE CONTENTS</a></li>
             <li><a href=#>MY NOTE</a></li>
             <li><a href=#>Q&A</a></li>
             <li><a href=#>BOOKMARK</a></li>
             <li><a href=#>공지사항</a></li>
         </ul>
      </div>
      
      <div class="col-xs-12">
      <hr/>
     </div>
      
       
       
      <div class="col-xs-12 paid-overview-features">
             <div class="col-xs-12 course-features" style="padding: 0px;">
            
              <h5 style="margin-bottom: 20px;">COURSE FEATURES</h5>

                  <div class="col-xs-12" id="lang-box">
                      <p>LANGUAGE</p>
                      <h3 id="paid-content-lang">JAVA</h3>
                  </div>
                  <div class="col-xs-6" id="level-box">
                      <p>LEVEL</p>
                      <h3 id="paid-content-level">INTERMEDIATE</h3>
                  </div>
                  <div class="col-xs-6" id="hours-box">
                      <p>HOURS</p>
                      <h3 id="paid-content-hours">70 HOURS</h3>
                  </div>
                  <div class="col-xs-12" id="special-box">
                      <p>SPECIALIZED</p>
                      <h3 id="paid-content-special">#예제풍부 #실전위주 #JAVA8 포함</h3>
                  </div>
             </div>

              <div class="col-xs-12" style="padding:0px;">
                    <hr/>
               </div>
              <h5>ABOUT THIS COURSE</h5>
              <p id="paid-content-about">
                  Learn Java In This Course And Become a Computer Programmer. Obtain valuable Core Java Skills And Java Certification
              </p>
              
                 <hr/>
              
              <h5>DESCRIPTION</h5>
              <p id="paid-content-description">
                    *** The #1 bestselling JavaScript course on Udemy! ***

                    "Excellent course. Jonas explains the core concepts in javascript that are usually glossed over in other courses. And he does it in a manner that is clear and concise." — John Collins

                    ...

                    Do you want to learn the number #1 programming language that powers the internet?

                    Are you tired of wasting your time and money on random youtube videos or JavaScript courses that are either too simple, or too difficult to follow?

                    Or are you struggling to deeply understand and apply JavaScript to real projects?
              </p>
            
              <hr/>
            
              <h5>INSTRUCTOR</h5>
              <div id="paid-content-instructor">
                  <div class="col-xs-1" style='padding: 0px;'>
                      <img id="paid-instructor-photo" src='/resources/img/johndoe.jpg'>
                  </div>
                  <div class="col-xs-11">
                      <div>
                          <h3 id="paid-instructor-name">JOHN DOE</h3>
                      </div>
                      <div>
                          <p id="paid-instructor-about">JAVA and Android expert developer</p>
                      </div>
                  </div>
              </div>
              <div class="col-xs-12" style="padding: 0px;">
            <p id="paid-instructor-description">
                              Tim's been a professional software developer for over 35 years.  During his career he has worked for major companies such as Fujitsu, Mitsubishi and Saab. His video courses are used to train developers in major companies such as Mercedes-Benz, Paypal, VW, Pitney Bowes, IBM and T-Mobile just to name a few (via the Udemy for Business program).
            </p>
          </div>
        </div>
      </div>       

</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>