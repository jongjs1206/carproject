$(function() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	$('.good_btn').click(function(){
		if($('.login_on').val()==''){
			alert('로그인시 사용할 수 있는 기능입니다.');
		}else{
			if($('.good_me').val()=='off'){
				$('.good_me').val('on');
				$('.fa-thumbs-up').addClass('color-red');
				$('.love_cnt').text(Number($('.love_cnt').text())+Number(1));
				$.ajax({
				
					type : 'post',
					async : true,
					url : '../all/good_news.do',
					beforeSend : function(xhr)
					{	
						xhr.setRequestHeader(header, token);
					},
					contentType: "application/x-www-form-urlencoded;charset=utf-8",
					dataType : 'json',
					data : {"id" : $('.login_on').val(),
					"news_num":$('.news_num').val()},
					success: function(){
												
		        	},
					error : function(err){ console.log(err)}  //실패했을때
				});
			}else{
				$('.good_me').val('off');				
				$('.fa-thumbs-up').removeClass('color-red');
				$('.love_cnt').text(Number($('.love_cnt').text())-Number(1));
				$.ajax({
				
					type : 'post',
					async : true,
					url : '../all/nogood_news.do',
					beforeSend : function(xhr)
					{	
						xhr.setRequestHeader(header, token);
					},
					contentType: "application/x-www-form-urlencoded;charset=utf-8",
					dataType : 'json',
					data : {"id" : $('.login_on').val(),
					"news_num":$('.news_num').val()},
					success: function(){
												
		        	},
					error : function(err){ console.log(err)}  //실패했을때
				});
			}	
		}
	})
}); //end of function