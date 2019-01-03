/**
 * 
 */



$(function() {
	
	$("#detail-overview").parent().css('background-color', '#ff7373');
	$("#detail-overview").css('color', 'white');
	
	
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
	  
		
	  function ajaxContents(){
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
	  
	
	$("#detail-overview").on("click", function(event) {
		event.preventDefault();
		ajaxOverview();
	});
	
	$("#detail-contents").on("click", function(event) {
		event.preventDefault();
		ajaxContents();
	});
	
	
})