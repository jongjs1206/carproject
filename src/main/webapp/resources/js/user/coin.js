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
	
	// 결제하기 버튼 클릭시 팝업창 쿼리스트링을 통해 코인갯수, 코인 가격을 buycoin.jsp로 넘겨줌
	$('.buy-coin').click(function(){
		var num = parseInt($('input.coin-num').val() || 1);
		var sum = num * 10000;
		url = 'buycoin.do?coinnum=' + num + '&coinprice=' + sum;
		window.open(url, '코인결제', 'width=500, height=500, toolbar=no, scrollbars=no, left=200,top=100');
	})
	
		
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
	//	 	dataType : 'html',
		 	data : {"status" : status},
 			success : function(result) {
 				console.log(status);
 				alert('2');;
			},
			error : function(err) {
				console.log(err);
				alert('1');
			}
		});
			
	}


})