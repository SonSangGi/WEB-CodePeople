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

<c:if test="${LOGIN_USER != null }">
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
       <input type="text" style="height:100%;border:none;" placeholder="메세지를 입력해주세요." autocomplete="off" id="chat-msg">
       <a class="chat-send"><i class="far fa-comment" style="margin-left:20px;"></i></a>
     </div>
   </div>
  </chat>
<script type="text/javascript">
$(function(){

	var ws = new WebSocket("ws://127.0.0.1/chat.do");
	ws.onmessage = function(event) {
		console.log(event);
		var items = event.data.split("/");
		var protocol = items[0];
		var target = items[1];
		if("ANSWER"==protocol){
		//관리자
			if(target == "ADMIN"){
			var user = JSON.parse(items[2]);
			var text = '<div class=""><img src="https://d81pi4yofp37g.cloudfront.net/wp-content/uploads/300.png" class="chat-icon">'+user.name+"("+user.id+')<div>'
			text += '<div class="chat-box t-d"><div class="chat-you"><span>' + items[3] + '</span></div></div>';
			$(".chat-body").append(text);
		//유저
			}else if(target == "USER"){
				var user = JSON.parse(items[2]);
				var text = '<div class=""><img src="https://d81pi4yofp37g.cloudfront.net/wp-content/uploads/300.png" class="chat-icon">'+user.name+'<div>';
				text += '<div class="chat-box t-d"><div class="chat-you"><span>' + items[3] + '</span></div></div>';
				$(".my-chat-body").append(text);
			}
	    $(".chat-body").scrollTop(100000)
		}
	}
		
	///관리자용 채팅~!@!~@~!
	  // 채팅 로드
	  var firstDiv = '<div class="chat-box t-d"><div class="chat-you"><span>';
	  var lastDiv = '</span></div></div>';
	  var icon = '<div class=""><img src="https://d81pi4yofp37g.cloudfront.net/wp-content/uploads/300.png" class="chat-icon"><div>';
	  $(".chat-body").append(icon + firstDiv + "안녕하세요.관리자입니다.:)<br>문의사항을 입력해주세요^_^" + lastDiv);

	  //채팅 입력/출력 기능
	  function userChatSubmit(){
	    var $msg = $("#chat-msg");
		ws.send("QNA:"+$msg.val());
	    var text = '<div class="chat-box t-r"><div class="chat-my"><span>' + $msg.val() + '</span></div></div>';
	    $(".chat-body").append(text);
	    $msg.val("");
	    $(".chat-body").scrollTop(100000)
	  }
	  
	  //

	  // 엔터키 누를시 표시
	 $("#chat-msg").focus(function() {
	    $(this).keydown(function(event) {
	      if (event.keyCode == 13 && $("#chat-msg").val()) {
	    	userChatSubmit();
	      }
	    });
	  });

	  // 클릭시 표시
	  $(".chat-send").click(function() {
	    userChatSubmit();
	  });

	  // 문의하기 버튼 클릭
	  $(".chat-btn,.chat-close").on("click",function() {
	    $(".chat-container").slideToggle();
	  });
	  
	  
       ///#@!#@! 유저용 채팅 #@!#@!#@!
	
       // 유저 클릭시 채팅 불러오기
       $(".user-info-body").on("click",".user-friends",function() {
          $(".user-friends").removeClass("active");
          $(this).addClass("active");
          $('.chat-friends-name').text($(this).find(".friends-name").text());
          $(".my-chat-body").text("");
	    	var userId = $(this).find("#friends-id").val();
          $.ajax({
        	  type:"get",
        	  url:"chat/getAll.do",
        	  dataType:"json",
        	  data:{recvUserId:userId},
        	  success:function(result){
        		  result.forEach(function(item,index){
        			  var text = '';
        			  if(item.sendUser.id == '${LOGIN_USER.id}'){
        			  	text += '<div class="my-chat-box t-r"><div class="my-chat-my"><span>' + item.contents + '</span></div></div>';
        			  }else{
        				  text += '<div class=""><img src="/resources/img/user/icon/'+item.sendUser.avatar.image+'" class="chat-icon">'+item.sendUser.name+'<div>';
        				  text += firstDiv + item.contents + lastDiv;
        			  }
        			  
        	           $(".my-chat-body").append(text);
        	           $(".my-chat-body").scrollTop(1000000)
        		  })
        	  },
        	  beforeSend:function(){
        		  $("")
        	  },complate:function(){
        		  
        	  }
          })
       })

       
       // 채팅 로드

         function chatSubmit(userId){
           var chatbar = $("#my-chat-msg");
           ws.send("USER:"+userId+":"+chatbar.val());
           var text = '<div class="my-chat-box t-r"><div class="my-chat-my"><span>' + chatbar.val() + '</span></div></div>';
           $(".my-chat-body").append(text);
           chatbar.val("");
           $(".my-chat-body").scrollTop(100000)
         }

         // 엔터키 누를시 표시
         $("#my-chat-msg").focus(function() {
           $(document).keydown(function(event) {
             if (event.keyCode == 13 && $("#my-chat-msg").val()) {
     	    	var userId = $(".user-friends.active").find("#friends-id").val();
     	    	console.log(userId);
               chatSubmit(userId);
             }
           });
         });

         // 클릭시 표시
         $(".my-chat-send").click(function() {
 	    	var userId = $(".user-friends.active").find("#friends-id").val();
           chatSubmit(userId);
         });
})
</script>
</c:if>