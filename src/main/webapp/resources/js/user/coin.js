$(function(){

 	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	// 코인 수량 입력시 금액 계산
	$('input.coin-num').on('keyup', function(){
		var num = parseInt($('input.coin-num').val() || 1);
		var sum = num * 10000;
		$('#coin-price').val(sum);
		console.log(sum);
	})
	
	//////////////////////////////////////////////////////////////////////////////////
	
	// 결제하기 버튼 클릭시, 입력값을 결제창으로 전달 -> DB 입력 -> 페이지 리다이렉트
	$('.buy-coin').click(function(){
		var num = parseInt($('input.coin-num').val() || 1);
		pay(num);	
	})
	
	/////////////////////////////////////////////////////////////////////////////
	
	// 결제 시스템 구현 pay()
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp02909496'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	function pay(num) {
		IMP.request_pay({
		    pg : ' JTNet', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : num * 100,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;

			    update(num);			// DB에 반영

		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		    next_url = '../user/coin.do?m_id=' + $('.login_on').val()
		    window.location.href = next_url;
		});
	}
	
	/////////////////////////////////////////////////////////////////////////////

	// DB에 반영하는 함수 update()
	
	var update = function(num) {
	
		$.ajax({
			type: 'post',
			async: true,
			url: '../user/payUpdate.do',
			beforeSend : function(xhr) {	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType: 'json',
			data: {"num" : num },
			success: function(result) {
				console.log(result);
			},
			error: function(err) {
				console.log(err);
			}
		})
	
	}

	/////////////////////////////////////////////////////////////////////////////

		
	// 기간별내 코인 충전 내역 확인
	window.statusOn = function(obj) {
		//$('input[name=period]').removeClass('on');
		$('.input2').removeClass('on');
		$(obj).addClass('on');
		if($(obj).hasClass('on')) {
			search();
		}
	}
	
	var search = function() {
	
		var status = '';
		$('label.on').each(function() {
			status = $(this).text()
			

		});
				
		$.ajax({
			type : 'post',
			async : true,
			url : '../user/my_coin_ajax.do',
			beforeSend : function(xhr) {	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			data : {"period" : status,
					"m_id" : $('.login_on').val()
			},
		 	dataType : 'html',
			success : function(result) {
				console.log(result);
			 	var html = jQuery('<div>').html(result);
				$( '#indexListAjax' ).html(html);
		 	},			
			error : function(err) {
				console.log(err);
				alert('1');
			}
		});
			
	}
	
	//////////////////////////////////////////////////////////////////////////////
	
	
	
	
	


})