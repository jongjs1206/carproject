$(function() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	$('.btn_send').click(function(){
				
		$.ajax({
			type : 'post',
			async : true,
			url : '../user/insertsend.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			
			data : {"m_id" : $('.login_on').val(),
					"to_id" : $('.you_id').val(),
					"title" : $('.title').val(),
					"content": $('.content').val().replace('\n','<br>')
			},
			success: function(){
				window.close();						
        	},
			error : function(err){ console.log(err)}  //실패했을때
		});
		
	})
})

