<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <div class="paid-contentslist">
                    <div class="col-xs-8 col-xs-offset-2 section-whole-box">
                       <div class="row section-top-box">
                            <div class="row" style="margin-top: 20px;">
                               <div class="col-xs-10">
                                    <span class="section-no-box"><span style="color: white;">SECTION</span><span id="section-no"> 1</span></span>
                               </div>
                               <div class="col-xs-2">
                                   <div id="section-complete-box">
                                       <span id="section-lesson-complete"> 1 </span><span> / </span><span id="section-lesson-list"> 2 </span>
                                   </div>
                               </div>
                            </div>
                            <div class="row">
                                <h3 id="section-name">COURSE INTRODUCTION</h3>
                            </div>
                       </div>
                        <div class="row section-lesson-list">
                            <div class="col-xs-1"></div>
                            <div class="col-xs-10 section-lessonbox">
                                <div class="lesson-per-one">
                                   <div class="col-xs-10">
                                        <span id="lesson-no">1</span><span>.</span><span id="lesson-name">INTRODUCTION</span>
                                   </div>
                                   <div class="col-xs-2" style="text-align: right;">
                                        <span id="complete-symbol">●</span>
                                   </div>
                                </div>
                                <div class="lesson-per-one">
                                   <div class="col-xs-10">
                                        <span id="lesson-no">1</span><span>.</span><span id="lesson-name">INTRODUCTION</span>
                                   </div>
                                   <div class="col-xs-2" style="text-align: right;">
                                        <span id="complete-symbol">○</span>
                                   </div>
                                </div>
                            </div>
                            <div class="col-xs-1"></div>
                        </div>
                    </div>

            </div>
            
            
			<script>
			
			$(".section-top-box").on('click', function() {
				
				const flag = $(this).siblings('.section-lesson-list').css('display');
				
				if (flag === "none") {
					$(this).siblings('.section-lesson-list').css('display', 'block');
				} else {
					$(this).siblings('.section-lesson-list').css('display', 'none');
				}
			});

			</script>