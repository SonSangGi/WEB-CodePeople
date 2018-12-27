<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>



    <!--컨테이너-->
    <div class="" style="max-width:70%;padding:50px 0px 50px 20%;">
      <div class="" style="">
        <h4 style="font-size:20px;padding-bottom:20px;"><i class="fab fa-quora" style="font-size:44px;color:rgb(69, 196, 171)"></i>약정 휴일이 뭔가요</h4>
        <p style="font-size:16px;">정부에서 내년 최저임금에서 약정휴일은 제외하고 준다는데 이게 무슨말인지 이해가 안가네요.. 약정휴일이 무엇인가요??</p>
        <div class="">
          손상기 <small>2018.12.25</small><i class="far fa-comment-dots" style="float:right;font-size:20px;"></i>
        </div>
      </div>
    </div>

    <div class="" style="background-color:#f5f5f5;padding:20px 0px 50px 20%;">
      <div class="" style="max-width:70%;background-color:white;padding:30px;border-radius:10px;margin-top:30px;">
        <h3>손상기님의 답변</h3>
        <hr>

        <div class="컨텐츠">
          <p>안녕하세요. 로시컴-네이버 지식iN 상담 공인노무사 신제철 입니다.</p>
          <p><br></p>
          <p>질문에 대한 답변입니다.</p>
          <p><br></p>
          <p>회사에서 지정한 휴일이라고 보면 됩니다.</p>
          <p><br></p>
          <p>일반적으로 월~금까지 근로하는 경우 주휴일이 주1회 부여(주로 일요일)되며, 남은 토요일을 회사에서 유급휴일로 부여할 경우가 있을 수 있고, (아무런 규정이 없다면) 무급휴무로 보게 됩니다.</p>
          <p><br></p>
          <p>여기서 토요일을 유급휴일로 볼 경우에 최저임금액에 포함시키게 된다면 243시간*8350원=2,029,050원이 최저임금이 되게 되며, 포함시키지 않을 경우에는 209시간이 적용되어 1,745,150원이 최저임금이 됩니다.</p>
          <p><br></p>
          <p>회사에서 정한 이러한 유급약정휴일은 최저임금액에 포함시키지 않겠다는 것이 오늘 기사의 내용이 됩니다.</p>
          <p><br></p>
          <p>무급휴무로 보는 많은 사업장은&#160;약정휴일에 대한 영향은 없습니다.</p>
          <p><br></p>
          <p>참고하시기 바랍니다.</p>
          <p><br></p>
          <p>감사합니다.&#160;<br></p>
        </div>

        <hr>
        <div class="qna-footer" style="padding:0px 20px 0px 20px;">
          <div class="comment-top" style="padding:10px;">
            <button class="sg-none" >
              <i class="fas fa-heart" style="font-size:20px;  "></i>
            </button>
            <button class="sg-none btn-comment-show">
              <i class="far fa-comment-dots" style="font-size:20px;"></i>
            </button>
          </div>

          <div class="comment-container" style="display:none;">

            <div class="댓글입력">
              <textarea class="board-comment" placeholder="댓글을 입력하세요." style="resize: none;width:100%;height:100px;margin-bottom:30px;"></textarea>
              <div class="board-comment-footer" style="position:absolute;bottom:0px;border:1px solid gray;border-top: none;width:100%;">
                <div style="color:gray;padding:10px;"><span class="char-count">0</span>/1000 <small>댓글은 1000자 이내로 작성해주세요.</small>
                </div>
              </div>
              <button style="position:absolute;bottom:0px;right:0px;height:35px;width:80px;">등록</button>
            </div>


            <div class="댓글하나" style="margin-top:20px;">
              <a href="#">손상기</a>
              <p>댓글내용</p>
              <small>2018.12.25 14:45:15</small>
            </div>

          </div>

        </div>
      </div>

    </div>

    <!--컨테이너 끝-->



<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
<script type="text/javascript">
$('.board-comment').keyup(function (event) {
  $(this).next().find('.char-count').text($(this).val().length);
  if ($(this).val().length>999) {
    $(this).val($(this).val().substr(0,999));
  }
})
$('.btn-comment-show').on('click',function(event) {
  $(this).parents('.comment-top').next().slideToggle();
})
</script>
</html>