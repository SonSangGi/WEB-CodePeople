<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="col-xs-12">
    
            <div class="add-note-wrapper">
  
            <button class="sg-btn-3rd " id="btn-add-note" onclick="location.href='create-note.html'"><span class="glyphicon glyphicon-plus"> </span>새 노트 추가</button>
  	  </div>       
        <div class="col-xs-12 paid-note-list-wrapper">
            <div class="paid-each-note">
            <div class="paid-note-toparea">
                <span class="paid-section-info-wrapper"><span class="glyphicon glyphicon-pencil"> </span><span> section</span><span id="paid-each-section-no"> 2 : </span><span id="paid-each-section-name">enum class</span></span>
				
				<div class="paid-each-section-date">
					<span class="glyphicon glyphicon-time"></span><span>2017.09.12</span>
				</div>
				<h3 id="paid-each-note-title">이넘 클래스 요약</h3>
			</div>
			<div class="paid-note-content-wrapper">
				<div id="row paid-each-note-contents">
					sdfsaasdfsadfasdfasdfsadfasdfsadfsadfsadfsadfsdafdsdfsd
				</div>
				<div class="row modify-wrapper">
					<div class="col-xs-1 col-xs-offset-10" style="text-align: right;">
						<span><a href=# id="paid-each-note-modify">수정</a></span>
					</div>
                	<div class="col-xs-1">
						<span><a href=# id="paid-each-note-delete">삭제</a></span>
                	</div>
                </div>
			</div>
        	</div>
        	
        	<div class="paid-each-note">
            <div class="paid-note-toparea">
                <span class="paid-section-info-wrapper"><span class="glyphicon glyphicon-pencil"> </span><span> section</span><span id="paid-each-section-no"> 2 : </span><span id="paid-each-section-name">enum class</span></span>
				
				<div class="paid-each-section-date">
					<span class="glyphicon glyphicon-time"></span><span>2017.09.12</span>
				</div>
				<h3 id="paid-each-note-title">이넘 클래스 요약</h3>
			</div>
			<div class="paid-note-content-wrapper">
				<div id="row paid-each-note-contents">
					sdfsaasdfsadfasdfasdfsadfasdfsadfsadfsadfsadfsdafdsdfsd
				</div>
				<div class="row modify-wrapper">
					<div class="col-xs-1 col-xs-offset-10" style="text-align: right;">
						<span><a href=# id="paid-each-note-modify">수정</a></span>
					</div>
                	<div class="col-xs-1">
						<span><a href=# id="paid-each-note-delete">삭제</a></span>
                	</div>
                </div>
			</div>
        	</div>
        	
        	
    	</div>
    	
    	</div>
    	<script>
 	   $(".paid-note-toparea").on("click", function() {
	   		const flag = $(this).siblings(".paid-note-content-wrapper").css("display");
		           
	        if (flag === "none") {
	            $(this).siblings('.paid-note-content-wrapper').css('display', 'block');
				$(this).parent().css("background-color", "#ffeaec")
	        } else {
				$(this).parent().css("background", "")
				$(this).siblings('.paid-note-content-wrapper').css('display', 'none');
	        }
	   });
    	</script>