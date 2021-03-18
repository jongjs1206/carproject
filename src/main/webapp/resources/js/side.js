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
	$('._delete').click(function(){
		alert($(this).prev().prev().val());
	})
	var t = Math.floor(($(window).scrollTop() / ($(document).height() - $(window).height())) * 100);
	
	$(window).scroll(function() {// 스크롤 이벤트가 발생할 때마다 인식
		var t = Math.floor(($(window).scrollTop() / ($(document).height() - $(window).height())) * 100);
    	if ( t>6){
    		$('.side_all').removeClass('off');
    	}
    	if(t<=6){
    		$('.side_all').addClass('off');
    	}
    })
})