$(function() {
   
    $(".close").on('click', function(event) {
        let totalPrice = parseInt($("#paid-cart-totalprice").text());
        const removePrice = parseInt($(this).siblings().children().children('#paid-cart-price').text());
        totalPrice -= removePrice;
        $("#paid-cart-totalprice").text(totalPrice);
        $(this).parent().remove();
    });
    
    
    function getAllPrice() {
        $("#paid-cart-price").each(function() {
            let price = parseInt($(this).text());
            price += price;
            $("#paid-cart-totalprice").text(price);
        });
    };

    getAllPrice();
	
	$("#paid-cart-btn").click(function() {
		var price = parseInt($("#paid-cart-totalprice").text());

		if (price === 0) {
			alert('상품을 선택해주세요');
			return;
		}
		
		var IMP = window.IMP;
		
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
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제 실패 : ';
		        msg += rsp.error_msg;
		    }
	
		    alert(msg);
		});
		return false;
	});
	
});