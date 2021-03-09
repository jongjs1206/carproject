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
	
	$('.form-control').click(function(){
		if($('.login_on').val()==''){
			alert('로그인시 사용 가능한 서비스 입니다.');
			$('.form-control').blur();
		}
	})
	$('.boxed-btn').click(function(){
		if($('.login_on').val()==''){
			alert('로그인시 사용 가능한 서비스 입니다.');
		}else{
			if($('.form-control').val()==''){
				alert('댓글을 입력해 주세요.');
			}else{
				$.ajax({
					type : 'post',
					async : true,
					url : '../all/review_insert.do',
					beforeSend : function(xhr)
					{	
						xhr.setRequestHeader(header, token);
					},
					contentType: "application/x-www-form-urlencoded;charset=utf-8",
					dataType : 'json',
					data : {"id" : $('.login_on').val(),
					"w_id":$('.news_num').val(),
					"content":$('.form-control').val()},
					success: function(){				
		        	},
					error : function(err){ console.log(err)}  //실패했을때
				});
				setTimeout(function(){
				$.ajax({
					type : 'post',
					async : true,
					url : '../all/reply_num.do',
					beforeSend : function(xhr)
					{	
						xhr.setRequestHeader(header, token);
					},
					contentType: "application/x-www-form-urlencoded;charset=utf-8",
					dataType : 'json',
					data : {"id" : $('.login_on').val(),
					"w_id":$('.news_num').val(),
					},
					success: function(num){				
							$('.reply_plus').prepend('<div class="reply_list">'
                  			+'<i class="fas fa-user-circle"></i>' 
                  			+'<div class="reply_name_content">'
                  				+'<div>'
                  					+$('.m_name').val()
                  					+'<span style="color:#909092; margin-left: 10px;">'
                  					+'방금전'
                  					+'<a class="reply_delete" style=" cursor:pointer; margin-left: 10px;">삭제</a>'
                  					+'<input type="hidden" value="'
                  					+num
                  					+'"/>' 
                  				+'</div>'
                  				+'<div class="context_reply">'
                  					+$('.form-control').val()
                  				+'</div>'
                  			+'</div>'
                  			+'</div>')				
						$('.form-control').val('');
		        	},
					error : function(err){ console.log(err)}  //실패했을때
				});
   			}, 500);
				
			}
		}
	})
	
	$(document).on("click",".reply_delete",function(){
		var result = confirm('삭제 하시겠습니까?');
		if(result){
			$(this).parent().parent().parent().remove();
			$('.delete_reply').val(Number($('.delete_reply').val())+Number(1))
			$.ajax({
					type : 'post',
					async : true,
					url : '../all/reply_delete.do',
					beforeSend : function(xhr)
					{	
						xhr.setRequestHeader(header, token);
					},
					contentType: "application/x-www-form-urlencoded;charset=utf-8",
					dataType : 'json',
					data : {"r_id" : $(this).next().val()},
					success: function(){				
							
		        	},
					error : function(err){ console.log(err)}  //실패했을때
				});
		}
	})
	
	
	$(window).scroll(function() {// 스크롤 이벤트가 발생할 때마다 인식
    	if ( Math.floor(($(window).scrollTop() / ($(document).height() - $(window).height())) * 100)>92 ) {// 스크롤이 끝에 닿는걸 인식
      		var re_page=$('.page').val()*15-$('.delete_reply').val();
      		$.ajax({
					type : 'post',
					async : true,
					url : '../all/review_add.do',
					beforeSend : function(xhr)
					{	
						xhr.setRequestHeader(header, token);
					},
					contentType: "application/x-www-form-urlencoded;charset=utf-8",
					dataType : 'json',
					data : {
					"w_id":$('.news_num').val(),
					"page":re_page},
					success: function(list){
						for ( var count = 0; count < list.length ; count++){	
						if($('.login_on').val()==list[count].writer){
						if(list[count].photo==null){
							$('.reply_plus').append('<div class="reply_list">'
                  			+'<i class="fas fa-user-circle"></i>' 
                  			+'<div class="reply_name_content">'
                  				+'<div>'
                  					+list[count].m_name 
                  					+'<span style="color:#909092; margin-left: 10px;">'
                  					+list[count].re_w_date
                  					+'<a class="reply_delete" style=" cursor:pointer; margin-left: 10px;">삭제</a>'
                  					+'<input type="hidden" value="'
                  					+list[count].r_id
                  					+'"/>' 
                  				+'</div>'
                  				+'<div class="context_reply">'
                  					+list[count].content
                  				+'</div>'
                  			+'</div>'
                  			+'</div>')
						
						}else{
							$('.reply_plus').append('<div class="reply_list">'
                  			+'<img style="width: 40px; height: 40px; border-radius: 70%; overflow: hidden;" src="https://storage.cloud.google.com/car_image_for_analysis/profile/'
                  			+list[count].m_id+'.jpg">' 
                  			+'<div class="reply_name_content">'
                  				+'<div>'
                  					+list[count].m_name 
                  					+'<span style="color:#909092; margin-left: 10px;">'
                  					+list[count].re_w_date
                  					+'<a class="reply_delete" style=" cursor:pointer; margin-left: 10px;">삭제</a>'
                  					+'<input type="hidden" value="'
                  					+list[count].r_id
                  					+'"/>' 
                  				+'</div>'
                  				+'<div class="context_reply">'
                  					+list[count].content
                  				+'</div>'
                  			+'</div>'
                  			+'</div>')
						}				
                  			}else{	
                  			
                  		if(list[count].photo==null){
							$('.reply_plus').append('<div class="reply_list">'
                  			+'<i class="fas fa-user-circle"></i>' 
                  			+'<div class="reply_name_content">'
                  				+'<div>'
                  					+list[count].m_name 
                  					+'<span style="color:#909092; margin-left: 10px;">'
                  					+list[count].re_w_date
                  					
                  					+'<input type="hidden" value="'
                  					+list[count].r_id
                  					+'"/>' 
                  				+'</div>'
                  				+'<div class="context_reply">'
                  					+list[count].content
                  				+'</div>'
                  			+'</div>'
                  			+'</div>')
                  		
                  		}else{
                  			$('.reply_plus').append('<div class="reply_list">'
                  			+'<img style="width: 40px; height: 40px; border-radius: 70%; overflow: hidden;" src="https://storage.cloud.google.com/car_image_for_analysis/profile/'
                  			+list[count].m_id+'.jpg">' 
                  			+'<div class="reply_name_content">'
                  				+'<div>'
                  					+list[count].m_name 
                  					+'<span style="color:#909092; margin-left: 10px;">'
                  					+list[count].re_w_date
                  					
                  					+'<input type="hidden" value="'
                  					+list[count].r_id
                  					+'"/>' 
                  				+'</div>'
                  				+'<div class="context_reply">'
                  					+list[count].content
                  				+'</div>'
                  			+'</div>'
                  			+'</div>')
                  		}				
                  			}
						}
		        	},
					error : function(err){ console.log(err)}  //실패했을때
				});
      		$('.page').val(Number($('.page').val())+Number(1));
   		}
	});//end of 무한스크롤

}); //end of function