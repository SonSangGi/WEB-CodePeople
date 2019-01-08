$(function() {
  //유저 메뉴 클릭
  $(".sg-menu-right>a").click(function() {
    $(".sg-menu-info").slideToggle();
  })
  //헤더
  $(document).scroll(function() {
    if ($(document).scrollTop() >= 200) {
      $(".sg-header").addClass("sg-fixed");
      $(".sg-header").css("border-bottom", "1px solid #d5d5d5");
      $(".sg-menu>ul>li>a,.sg-header div>a,.sg-menu-login>*").css("color", "black");
      $("#cart-menu").attr("src","/resources/img/paid/cart-black.png");
      $(".sg-header input").css("border", "2px solid #92e879")
    } else {
      $(".sg-header").removeClass("sg-fixed");
      $(".sg-header").css("border-bottom", "none");
      $(".sg-menu>ul>li>a,.sg-header div>a,.sg-menu-login>*").css("color", "white");
      $("#cart-menu").attr("src","/resources/img/paid/cart-white.png");
      $(".sg-header input").css("border", "none")
    }
  })

  $(".btn-close-header").click(function() {
		$(".sg-user-show").slideToggle();
  });
  
  $(".f-i").hover(
	  function(){
		  var x = event.pageX;
		  var y = event.pageY;
		  $('#fllowAlert').show();
		  $('#fllowAlert').css({'left':x-100,'top':y-100})
	  },function(){
		  $('#fllowAlert').hide();
	  }
  )
});