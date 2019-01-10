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
  
  $(".sg-alert").on('click','.follow-btn',function(){
	  var followerId = $(this).val();
		  if($(this).hasClass('add')){
		  $.get("/user/my/following.do",{followerId:followerId});
	  }else if($(this).hasClass('del')){
		  $.get("/user/my/delFollow.do",{followingId:followerId});
	  }
	  $(this).parents('.sg-alert-box').remove();
  })
  
  $('[data-toggle="tooltip"]').tooltip(); 

  $('.sg-modal-box a').click(function(){
	  $('.sg-loading-fade').fadeIn();
  })
  
});