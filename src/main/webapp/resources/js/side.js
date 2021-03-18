$(function() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	$('.fa-chevron-left').click(function(){
		if($('.page__now').text()!=1){
			$('.side-vehicle__slide-box:eq(1)').removeClass('off');
			$('.page__now').text($('.page__now').text()-1);
			$('.side-vehicle__image:eq(0)').attr('src',$('.side_img:eq('+($('.page__now').text()*2-2)+')').val());
			$('.side_num:eq(0)').val($('.side_number:eq('+($('.page__now').text()*2-2)+')').val());
			$('.side-vehicle__link:eq(0)').attr('href','../all/salesDetail.do?num='+$('.side_number:eq('+($('.page__now').text()*2-2)+')').val());
			
			$('.side-vehicle__image:eq(1)').attr('src',$('.side_img:eq('+($('.page__now').text()*2-1)+')').val());
			$('.side_num:eq('+($('.page__now').text()*2-1)+')').val()
			$('.side_num:eq(1)').val($('.side_number:eq('+($('.page__now').text()*2-1)+')').val());
			$('.side-vehicle__link:eq(1)').attr('href','../all/salesDetail.do?num='+$('.side_number:eq('+($('.page__now').text()*2-1)+')').val());
			
		}
	})
	$('.fa-chevron-right').click(function(){
		if($('.page__end').text()!=$('.page__now').text()){
			
			$('.page__now').text(Number($('.page__now').text())+1);	
			$('.side-vehicle__image:eq(0)').attr('src',$('.side_img:eq('+($('.page__now').text()*2-2)+')').val());
			
			$('.side_num:eq(0)').val($('.side_number:eq('+($('.page__now').text()*2-2)+')').val());
			$('.side-vehicle__link:eq(0)').attr('href','../all/salesDetail.do?num='+$('.side_number:eq('+($('.page__now').text()*2-2)+')').val());
			if($('.page__end').text()==$('.page__now').text()){
				if($('.finish').val()!=$('.page__now').text()*2){
					$('.side-vehicle__slide-box:eq(1)').addClass('off');
				}else{
					$('.side-vehicle__image:eq(1)').attr('src',$('.side_img:eq('+($('.page__now').text()*2-1)+')').val());
					$('.side_num:eq(1)').val($('.side_number:eq('+($('.page__now').text()*2-1)+')').val());
				$('.side-vehicle__link:eq(1)').attr('href','../all/salesDetail.do?num='+$('.side_number:eq('+($('.page__now').text()*2-1)+')').val());				
				}
			}else{
				$('.side-vehicle__image:eq(1)').attr('src',$('.side_img:eq('+($('.page__now').text()*2-1)+')').val());
				$('.side_num:eq(1)').val($('.side_number:eq('+($('.page__now').text()*2-1)+')').val());
				$('.side-vehicle__link:eq(1)').attr('href','../all/salesDetail.do?num='+$('.side_number:eq('+($('.page__now').text()*2-1)+')').val());
			}
		}
	})
	$('._delete:eq(0)').click(function(){
		if($('.page__end').text()=='1'){
			if($('.finish').val()==1){
				$('.finish').val($('.finish').val()-1);
				$('.side-vehicle__head').text('최근 본 차량');
				$('.side_img:eq('+($('.page__now').text()*2-2)+')').remove();
				$('.side_number:eq('+($('.page__now').text()*2-2)+')').remove();
				$(this).parent().addClass('off');
				$('.side-vehicle__bottom').addClass('off');
				$('.side-vehicle__slide').prepend("<div class='nolistside'>최근 본 목록이 없습니다.</div>");
				$.ajax({
					type : 'post',
					async : true,
					url : '../all/side_null.do',
					data : {"number" : $(this).prev().prev().val()},
					beforeSend : function(xhr)
					{	
						xhr.setRequestHeader(header, token);
					},
					contentType: "application/x-www-form-urlencoded;charset=utf-8",
					success: function(){
		        	},
					error : function(err){ console.log(err)}  //실패했을때
				});
			}else{
				$('.finish').val($('.finish').val()-1);
				$('.side-vehicle__head').text('최근 본 차량 '+ $('.finish').val());
				$('.side_img:eq('+($('.page__now').text()*2-2)+')').remove();
				$('.side_number:eq('+($('.page__now').text()*2-2)+')').remove();
				side_del($(this).prev().prev().val());
				$('.side-vehicle__image:eq(0)').attr('src',$('.side_img:eq('+($('.page__now').text()*2-2)+')').val());
				$('.side_num:eq(0)').val($('.side_number:eq('+($('.page__now').text()*2-2)+')').val());
				$('.side-vehicle__link:eq(0)').attr('href','../all/salesDetail.do?num='+$('.side_number:eq('+($('.page__now').text()*2-2)+')').val());
				$(this).parent().next().addClass('off');
			}
		}else{
			if($('.page__end').text()!=$('.page__now').text()){
				$('.finish').val($('.finish').val()-1);
				$('.side-vehicle__head').text('최근 본 차량 '+ $('.finish').val());
				$('.side_img:eq('+($('.page__now').text()*2-2)+')').remove();
				$('.side_number:eq('+($('.page__now').text()*2-2)+')').remove();
				side_del($(this).prev().prev().val());
				$('.side-vehicle__image:eq(0)').attr('src',$('.side_img:eq('+($('.page__now').text()*2-2)+')').val());
				$('.side_num:eq(0)').val($('.side_number:eq('+($('.page__now').text()*2-2)+')').val());
				$('.side-vehicle__link:eq(0)').attr('href','../all/salesDetail.do?num='+$('.side_number:eq('+($('.page__now').text()*2-2)+')').val());
				$('.side-vehicle__image:eq(1)').attr('src',$('.side_img:eq('+($('.page__now').text()*2-1)+')').val());
				$('.side_num:eq(1)').val($('.side_number:eq('+($('.page__now').text()*2-1)+')').val());
				$('.side-vehicle__link:eq(1)').attr('href','../all/salesDetail.do?num='+$('.side_number:eq('+($('.page__now').text()*2-1)+')').val());
				if($('.page__now').text()*2==$('.finish').val()){
					$('.page__end').text($('.page__end').text()-1);
				}
			}else{
				
				
				if($('.page__now').text()*2==$('.finish').val()){
					$('.finish').val($('.finish').val()-1);
					$('.side-vehicle__head').text('최근 본 차량 '+ $('.finish').val());
					$('.side_img:eq('+($('.page__now').text()*2-2)+')').remove();
					$('.side_number:eq('+($('.page__now').text()*2-2)+')').remove();
					side_del($(this).prev().prev().val());
					$('.side-vehicle__image:eq(0)').attr('src',$('.side_img:eq('+($('.page__now').text()*2-2)+')').val());
					$('.side_num:eq(0)').val($('.side_number:eq('+($('.page__now').text()*2-2)+')').val());
					$('.side-vehicle__link:eq(0)').attr('href','../all/salesDetail.do?num='+$('.side_number:eq('+($('.page__now').text()*2-2)+')').val());
					$(this).parent().next().addClass('off');
				}else{
					$('.finish').val($('.finish').val()-1);
					$('.side-vehicle__head').text('최근 본 차량 '+ $('.finish').val());
					$('.side_img:eq('+($('.page__now').text()*2-2)+')').remove();
					$('.side_number:eq('+($('.page__now').text()*2-2)+')').remove();
					side_del($(this).prev().prev().val());
					$('.page__end').text($('.page__end').text()-1);
					$('.page__now').text($('.page__now').text()-1);
					$('.side-vehicle__image:eq(0)').attr('src',$('.side_img:eq('+($('.page__now').text()*2-2)+')').val());
					$('.side_num:eq(0)').val($('.side_number:eq('+($('.page__now').text()*2-2)+')').val());
					$('.side-vehicle__link:eq(0)').attr('href','../all/salesDetail.do?num='+$('.side_number:eq('+($('.page__now').text()*2-2)+')').val());
					$('.side-vehicle__image:eq(1)').attr('src',$('.side_img:eq('+($('.page__now').text()*2-1)+')').val());
					$('.side_num:eq(1)').val($('.side_number:eq('+($('.page__now').text()*2-1)+')').val());
					$('.side-vehicle__link:eq(1)').attr('href','../all/salesDetail.do?num='+$('.side_number:eq('+($('.page__now').text()*2-1)+')').val());
					$(this).parent().next().removeClass('off');
				}
			}
		}
	})
	$('._delete:eq(1)').click(function(){
		$('.finish').val($('.finish').val()-1);
		$('.side-vehicle__head').text('최근 본 차량 '+ $('.finish').val());
		if($('.page__end').text()==$('.page__now').text()){
			$(this).parent().addClass('off');
			side_del($(this).prev().prev().val());
		}else{
			$('.side_img:eq('+($('.page__now').text()*2-1)+')').remove();
			$('.side_number:eq('+($('.page__now').text()*2-1)+')').remove();
			side_del($(this).prev().prev().val());
			$('.side-vehicle__image:eq(1)').attr('src',$('.side_img:eq('+($('.page__now').text()*2-1)+')').val());
			$('.side_num:eq(1)').val($('.side_number:eq('+($('.page__now').text()*2-1)+')').val());
			$('.side-vehicle__link:eq(1)').attr('href','../all/salesDetail.do?num='+$('.side_number:eq('+($('.page__now').text()*2-1)+')').val());
			if($('.page__now').text()*2==$('.finish').val()){
				$('.page__end').text($('.page__end').text()-1);
			}
		}
	})
	
	$(window).scroll(function() {// 스크롤 이벤트가 발생할 때마다 인식
		var t = Math.floor(($(window).scrollTop() / ($(document).height() - $(window).height())) * 100);
    	if ( t>6){
    		$('.side_all').removeClass('off');
    	}
    	if(t<=6){
    		$('.side_all').addClass('off');
    	}
    })
    
    function side_del(number){
    	$.ajax({
			type : 'post',
			async : true,
			url : '../all/side_del.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			data : {"number" : number},
			success: function(){
									
        	},
			error : function(err){ console.log(err)}  //실패했을때
		});
 
	}


})