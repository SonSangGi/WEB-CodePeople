$(function() {
  // 채팅 로드
  var firstDiv = '<div class="chat-box t-d"><div class="chat-you"><span>';
  var lastDiv = '</span></div></div>';
  var icon = '<div class=""><img src="https://d81pi4yofp37g.cloudfront.net/wp-content/uploads/300.png" class="chat-icon"><div>';
  $(".chat-body").append(icon + firstDiv + "안녕하세요.관리자입니다.:)<br>문의사항을 입력해주세요^_^" + lastDiv);

  //채팅 입력/출력 기능
  function chatSubmit(){
    var chatbar = $("input[name=chat-msg]");
    var text = '<div class="chat-box t-r"><div class="chat-my"><span>' + chatbar.val() + '</span></div></div>';
    text += icon + '<div class="chat-box t-d"><div class="chat-you"><span>' + "서버와 연결할 수 없습니다." + '</span></div></div>';
    $(".chat-body").append(text);
    chatbar.val("");
    $(".chat-body").scrollTop(100000)
  }

  // 엔터키 누를시 표시
  $("input[name=chat-msg]").focus(function() {
    $(document).keydown(function(event) {
      if (event.keyCode == 13 && $("input[name=chat-msg]").val()) {
        chatSubmit();
      }
    });
  });

  // 클릭시 표시
  $(".chat-send").click(function() {
    chatSubmit();
  });

  // 문의하기 버튼 클릭
  $(".chat-btn,.chat-close").on("click",function() {
    $(".chat-container").slideToggle();
  });
});
