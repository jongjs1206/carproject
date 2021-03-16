$(function() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	$('.btn_send').click(function(){
		if($('.content').val()==''){
			$('.no').removeClass('off');
		}else{
			$('.no').addClass('off');
			$('.backblack').removeClass('off');
			$('.pop').removeClass('off');
		}
	})
	$('.pop_no').click(function(){
		$('.backblack').addClass('off');
		$('.pop').addClass('off');
	})
	$('.pop_yes').click(function(){
		$.ajax({
			type : 'post',
			async : true,
			url : '../user/declaration_insert.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			data : {"m_id" : $('.login_on').val(),
			"to_id":$('.to_id').val(),
			"content":$('.content').val().replace('\n','<br/>')},
			success: function(){
				$('.pop_title').text('신고가 완료 되었습니다.');
				$('.pop_yes').addClass('off');
				$('.pop_no').addClass('off');
				$('.pop_ok').removeClass('off');
        	},
				error : function(err){ console.log(err)}  //실패했을때
		});
	})
	
	$('.pop_ok').click(function(){
		window.close();
	})
})	// end of 전체 function()
