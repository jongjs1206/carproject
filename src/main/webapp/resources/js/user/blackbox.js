$(function() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	$('.day_one').first().addClass('color-blue');
	
	$('.day_one').click(function(){
		$('.day_one').removeClass('color-blue');
		$(this).addClass('color-blue');
		
		
		$.ajax({
			type : 'post',
			async : true,
			url : '../user/select_day_img.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'text',
			data : {"day" : $(this).text()},
			success: function(path){
				$('.black_img').attr('src',path);				
        	},
			error : function(err){ console.log(err);}  //실패했을때
		});
	})
})

