$(function() {

        const video = document.getElementById('media-video');
        

        // 플레이어 구성 콘텐츠 나타내기

        function addBlockCss() {
            $('.video-header').css("display", "block");
            $('.video-footer').css("display", "block");
        };

        function fadeOutBlock() {
            $('.video-header').fadeOut(2000);
            $('.video-footer').fadeOut(2000);
        };

        function fadeInBlock() {
            $('.video-header').fadeIn(1000);
            $('.video-footer').fadeIn(1000);
        };

        function displayNone() {
            $('.video-header').css("display", "none");
            $('.video-footer').css("display", "none");
        };

        $("#media-player").on("mouseenter", () => {
            addBlockCss();
        });
        
        $("#media-player").on("mousemove", () => {
            addBlockCss();
        });

        $("#media-player").on("mouseleave", () => {
            displayNone();
        });

        // 5초 빠르게, 5초 느리게 버튼
        $("#plusCurrentTime").on("click", () => {
            video.currentTime += 10;
        });
        $("#minusCurrentTime").on("click", () => {
            video.currentTime -= 10;
        });


        // 플레이 속도 0.5배 빠르게, 느리게 버튼
        $(".speed-option a").click(function() {
            $(".speed-option a").css('background-color', '');
            $(this).css('background-color', '#afeeee');
            let speed = $(this).attr('id');
            $("#speedSetting").text("speed x" + speed);
            video.playbackRate = speed;
            $(".speed-dropup").css('display', 'none');
        })

        $("#speedDown").on("click", () => {
            video.playbackRate -= 0.5;
        });

        // 볼륨 0.1 up, 볼륨 0.1 down
        $("#volumeUp").on("click", () => {
            video.volume += 0.1;
        });

        $("#volumeDown").on("click", () => {
            video.volume -= 0.1;
        });

        // mute, unmute
        $("#mute").on("click", () => {
            if (!video.muted) {
                $("#mute").attr('class','glyphicon glyphicon-volume-off');
                video.muted = true;
            } else {
                $("#mute").attr('class','glyphicon glyphicon-volume-up');
                video.muted = false;
            }
        });

        // Picture in Picture (PIP) 모드
        $("#pip").on("click", (event) => {
            video.requestPictureInPicture();
            displayNone();
        });
       
       // time range 숫자 자릿수 맞추기 util
       function pad(n, width) {
            n = n + '';
            return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
        }

       

       video.onloadedmetadata = function() {
    	   
    	   // 영상 시간 가져오기
    	   const duration = Math.round(video.duration);
           const minutes = pad(Math.floor(duration / 60), 2);
           const seconds = pad(duration % 60, 2);
           $("#duration").text(`${minutes}:${seconds}`);
           
       };

       
       // canvas 획득
       var canvas = document.getElementById("myCanvas");
       var context = canvas.getContext("2d");
       var width = 400;
       var height = 240;
       
       
       // canvas에 그리기 함수
		function snap() {
		    context.fillRect(20, 20, 150, 100);
		    context.drawImage(video, 0, 0, width, height);
		    console.log(context);
		    
		    canvas.crossOrigin="anonymous"
			canvas.toDataURL("image/png");

		}
      
		// button attach
		$("#video-smart-copy").on("click", function() {
			snap();
		});
		
		
      
       
       
       function currenttime() {
           let currenttime = Math.round(video.currentTime);
           let minutes = pad(Math.floor(currenttime / 60), 2);
           let seconds = pad(currenttime % 60, 2);
           $("#currenttime").text(`${minutes}:${seconds}`);
        };

        setInterval(currenttime,500);

        // fullscreen 모드
        $("#fullscreen").on("click", () => {
            video.requestFullscreen();
        });

       let barsize = $('#media-video').width() * 0.988;
       console.log(barsize);
       
       function getBarSize() {
            $('#backBar').css('width', barsize + 'px');
       }
       
       getBarSize();

        function update() {
            if (!video.ended) {
                let size = parseInt(video.currentTime * (barsize / video.duration));
                $("#progressBar").css("width", size + 'px');
            } else {
                $("#progressBar").css("width", "0px");
                window.clearInterval(updateBar);
            }
        };

        function updateBar() {
            let updateBar = setInterval(update, 100);
        };
       
        updateBar();
        
        
        
        function playOrPause() {
            if (!video.paused && !video.ended) {
                video.pause();
                window.clearInterval(updateBar());
            } else {
                video.play();
                updateBar();
            }
        };

        $("#playPause").on("click", () => {
            if (!video.paused) {
                $('#playPause').attr('class','glyphicon glyphicon-play');
            } else {
                $('#playPause').attr('class','glyphicon glyphicon-pause');
            }
            playOrPause();
        });

        function clickedBar(event) {
            if (!video.ended) {
                let mouseX = event.pageX - $("#backBar").offset().left;
                let newtime = mouseX * video.duration / barsize;
                console.log('시간 :', newtime);
                video.currentTime = newtime;
                $("progressBar").css("width", mouseX + 'px');
            }
        };


        $('#backBar').on('click', (event) => {
            addBlockCss();
            clickedBar(event);
        });

        $('#media-video').on('click', () => {
            if (!video.paused) {
                $('#playPause').attr('class','glyphicon glyphicon-play');
            } else {
                 $('#playPause').attr('class','glyphicon glyphicon-pause');
            }
            playOrPause();
        });

        $('#media-player').on('dblclick', () => {
            if (!video.fullscreen) {
                video.requestFullscreen();
            } else {
                video.exitFullScreen();
            }
        });


        $("#speedSetting").on('click', () => {
            $(".speed-dropup").toggle();
        });
	
		$("#video-lesson-menu").on("click", function() {
			$(this).css("display", "none");
			$("#mySidenav").css("width","30%");
			$(".video-footer").css("width","70%");
			$(".video-footer").css("margin-left", "30%");
			$(".video-header").css("width", "70%");
			$(".video-header").css("margin-left", "30%");
			$(".speed-dropup").css("margin-left", "30%");
			$("#media-video").css("width", "70%");
			$(".footer-center-buttons").css("margin-left", "20%");
			barsize = $('#media-video').width() * 0.988;
			getBarSize();
			updateBar();

		});
	
		$(".closebtn").on("click", function() {
			$("#video-lesson-menu").css("display", "block");
			$("#mySidenav").css("width","");
			$(".video-footer").css("width","100%");
			$(".video-footer").css("margin-left", "");
			$(".video-header").css("margin-left", "");
			$(".video-header").css("width", "100%");
			$("#media-video").css("width", "100%");
			$(".footer-center-buttons").css("margin-left", "28%");

			barsize = $('#media-video').width() * 0.988;
			getBarSize();
			updateBar();
		});

		$(".video-section-top-box").on('click', function(event) {
        
			const flag = $(this).siblings('.video-section-lesson-list').css('display');

			if (flag === "none") {
				$(this).siblings('.video-section-lesson-list').css('display', 'block');
			} else {
				$(this).siblings('.video-section-lesson-list').css('display', 'none');
			}
    	
		});
	
		$("#video-myNote").on("click", function() {
			
			$("#media-player").css("display", "none");
			$(".video-note-page").css("display", "block");
			$(".video-note-page").css("z-index", "1");
			$(".nse_content").css("display", "block");
			$("#pip").click();
		});
	
		$(".video-create-note-cancel").on("click", function() {
			if (document.pictureInPictureElement) {
				document.exitPictureInPicture()
				  .then(() => {$(".video-note-page").css("display", "none")})
				  .then(() => {$("#media-player").css("display", "block")})
				  .then(() => {$(".video-note-page").css("z-index", "-1")})
				  .catch(() => { /**/ });
			} else {
				return;
			}
		});


});
