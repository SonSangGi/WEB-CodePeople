/**
 * 
 */

$(function() {
	
	$("#detail-overview").parent().css('background-color', '#ff7373');
	$("#detail-overview").css('color', 'white');

	$('.summernote').summernote({
	      height: 300,          // 기본 높이값
	      minHeight: null,      // 최소 높이값(null은 제한 없음)
 	      maxHeight: null,      // 최대 높이값(null은 제한 없음)
 	      focus: true,          // 페이지가 열릴때 포커스를 지정함
 	      lang: 'ko-KR'         // 한국어 지정(기본값은 en-US)
    });
	
	
	$(".section-top-box").on('click', function() {
		
		const flag = $(this).siblings('.section-lesson-list').css('display');
		
		if (flag === "none") {
			$(this).siblings('.section-lesson-list').css('display', 'block');
		} else {
			$(this).siblings('.section-lesson-list').css('display', 'none');
		}
	});
	
	  function ajaxOverview(){
	      $.ajax({
	        type : "GET",
	        url : "detail/overview.do",
	        dataType : "html",
	        error : function() {
	          alert('error!');
	        },
	        success : function(data) {
	          $('.paid-contents').html(data);
	        }
	      });
	    }
	 
	  ajaxOverview();
	
		$(".paid-default-menu > ul > li > a").click(function() {
		    $(this).parent().siblings().css('background-color', '');
		    $(this).parent().css('background-color', '#ff7373');
		    $(this).parent().siblings().children().css('color', 'black');
		    $(this).css('color', 'white');
		});
	  
		
	  function ajaxContents() {
	      $.ajax({
	        type : "GET",
	        url : "detail/contents.do",
	        dataType : "html",
	        error : function() {
	          alert('error!');
	        },
	        success : function(data) {
	          $('.paid-contents').html(data);
	        }
	      });
	    }
	  
	  function ajaxNote() {
	      $.ajax({
	        type : "GET",
	        url : "detail/note.do",
	        dataType : "html",
	        error : function() {
	          alert('error!');
	        },
	        success : function(data) {
	          $('.paid-contents').html(data);
	        }
	      });
	    }

	  
 	   $(".create-note-cancel").on("click", function(event) {
 			event.preventDefault();
 		    ajaxNote();
	   });
 	   
 	   
	  function ajaxQuestion() {
		  $.ajax({
			  type : "GET",
			  url : "detail/question.do",
			  dataType : "html",
			  error : function() {
				  alert('error!');
			  },
			  success : function(data) {
				  $('.paid-contents').html(data);
			  }
		  });
	  }


	
	$("#detail-overview").on("click", function(event) {
		event.preventDefault();
		ajaxOverview();
	});
	
	$("#detail-contents").on("click", function(event) {
		event.preventDefault();
		ajaxContents();
	});

	$("#detail-note").on("click", function(event) {
		event.preventDefault();
		ajaxNote();
	});

	$("#detail-question").on("click", function(event) {
		event.preventDefault();
		ajaxQuestion();
	});
	
	$(".nonlogin-paid-purchase-btn").on("click", function(event) {
		alert("로그인이 필요한 서비스입니다");
	});

	
	$(".nonlogin-paid-cart-btn").on("click", function(event) {
		alert("로그인이 필요한 서비스입니다");
	});

	
	$("#paid-cart-btn").on("click", function(event) {
		var lectureNo = $(this).siblings(".lectureNo").val();
		console.log(lectureNo);
		
		
		   $.ajax({
		        type : "POST",
		        url : "/paid/cart.do",
		        data : {"lectureNo" : lectureNo},
		        error : function() {
		          alert('error!');
		        },
		        success : function(data) {
		        	console.log(data);
		        	if (data == "P") {
		        		alert("이미 구매하신 강좌입니다");
		        	} else if (data == "N") {
		        		alert("이미 카트에 존재하는 강좌입니다");
		        	} else {
		        		alert("카트에 성공적으로 담았습니다");
		        		location.href="/paid/cart.do";
		        	}
		        }
		      });
		
	})

	
	$("#paid-purchase-btn").on("click", function() {
		var price = $(this).siblings(".lecturePrice").val();
		
			if (price === 0) {
				alert('상품을 선택해주세요');
				return;
			}
			
			
			IMP.init('imp10706386');	// 가맹점 식별코드 넣기
			
			IMP.request_pay({
			    pg : 'html5_inicis',		// 이니시스 웹 표준 결제 (html5) -- 변경 X, 결제 모듈을 이니시스로 등록함 ㅇㅇ
			    pay_method : 'card',		// 결제 종류 - 신용카드
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '결제테스트',	// 결제창에서 보여질 상품 이름
			    amount : price,			// 상품 가격
			    buyer_email : 'next.ux.creator@gmail.com', // 고객 이메일
			    buyer_name : '김동원(테스트)',				// 고객 이름
			    buyer_tel : '010-1234-5678',				// 고객 전화번호
			    buyer_addr : '서울특별시 강남구 삼성동',	// 고객 주소
			    buyer_postcode : '123-456'					// 고객 우편번호
			
			}, function(rsp) {
				console.log(rsp);
			    if (rsp.success) {
			    	var flag = "success";
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        
			    } else {
			    	var flag = "fail";
			        var msg = '결제 실패 : ';
			        msg += rsp.error_msg;
			    }
			    
			    alert(msg);
			    
			    if (flag === "success") {
			    	$.ajax({
			    		type : "POST",
			    		url : "/paid/payment.do",
			    		data : {"values": jsonData},
			    		error : function(error) {
			    			alert(msg);
			    			return false;
			    		},
			    		success : function(data) {
			    			console.log(data);
			    			location.href = "/paid/payment.do";
			    		}
			    	});
			    }
			    
			    return false;
			    
			});
		
		});

	
	
	
})