$(function() {
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
	
	// 코인 페이지 접속시 코인 정보 가져오기
	
	
	// 코인 충전내역 탭 클릭시
	var m_id = $('.login_on').val();
/*	$("#tab2").click(function(){
		alert('확인');
		$.ajax({
			type: 'post',
			async: true,
			url : '../all/coinlist.do',
			beforeSend : function(xhr) {	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType: 'json',
			data: {"m_id" : m_id},
			success: function(list){
				console.log(m_id);
				console.log(list.length);
//				console.log(list[0].day);		
				if(list[cnt].m_id == null){ console.log(m_id, m_id); }		
				for (var cnt=0; cnt<list.length; cnt++){
					$('.coin-list').append('<div class=""><span>'
							+list[cnt].coin
							+'</span></div>');
					
				}

			},
			error : function(err){ 
				$('.coin-list').val('<div>충전이력이 없습니다. </div>');
			}
		});
	})
*/	
	
	// 코인 충전내역 탭의 "전체" 버튼 클릭시
	$('.total-period').click(function(){
		alert('전체');
	})
	
	// 코인 충전내역 탭의 "1주일" 버튼 클릭시
	$('.week-period').click(function(){
		alert('1주일');
	})
	
	// 코인 충전내역 탭의 "1개월" 버튼 클릭시
	$('.month-period').click(function(){
		alert('1개월');
	})
	
	
	
	
})