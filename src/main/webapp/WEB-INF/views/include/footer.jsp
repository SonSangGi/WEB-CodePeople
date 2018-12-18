<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--네비게이션 바~~-->
        <!--푸터 시작-->
      <div class="sg-footer">
         <div class="container">
            <div class="col-sm-8">
               <span>
                  (JHTA)FinalProject | 조장:손상기 | 부조장:김동원 | 조원:| 김영범 | 김승용 | 양재준 | <br>
                  손상기: 로그인,회원가입,마이페이지,채팅,화면 구성 및 퍼블리싱 <br>
                  김동원:<br>
                  김영범:<br>
                  김승용:<br>
                  양재준:<br>
               </span>
            </div>
            <div class="" style="font-weight:bold">
               <a href="#">모두들</a>
               <a href="#">파이팅</a>
               <a href="#">합시다</a>
            </div>
         </div>
      </div>
   </div>

   <chat>
   <a class="sg-none chat-btn"><i class="fas fa-comment" style="font-size:20px;background-color:#c9545c;border-radius:100px;padding:20px;cursor:pointer"><small class="sg-text-white">문의하기</small></i></a>
   <div class="chat-container">
     <div class="chat-header">
       <img src="https://d81pi4yofp37g.cloudfront.net/wp-content/uploads/300.png" class="chat-icon">
       <span style="color:white;">손상기</span>
       <a style="width:20px;height:20px;display:inline-block;color:white;float:right;font-size:20px;cursor:pointer" class="chat-close">x</a>
     </div>
     <div class="chat-body"></div>
     <div class="chat-footer">
       <label class="fas fa-paperclip" for="chat-file"></label><input type="file" id="chat-file" />
       <input type="text" name="chat-msg" value="" style="height:100%;border:none;" placeholder="메세지를 입력해주세요." autocomplete="off">
       <a class="chat-send"><i class="far fa-comment" style="margin-left:20px;"></i></a>
     </div>
   </div>
  </chat>