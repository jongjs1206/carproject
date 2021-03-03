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
	
	// 결제하기 버튼 클릭시
	$('.buy-coin').click(function(){
		var sum = parseInt($('input#coin-price').val());
		alert(sum);
	})
	
	// 코인 충전내역 탭 클릭시
	var m_id = $('.login_on').val();
	$("#tab2").click(function(){
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
	
})