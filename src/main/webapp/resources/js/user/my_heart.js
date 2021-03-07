$(function() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	$('.fa-heart').click(function(){
		var result = confirm('찜 목록에서 제거 하시겠습니까?');
		if(result){
			$.ajax({
				type : 'post',
				async : true,
				url : '../all/heart_off.do',
				beforeSend : function(xhr)
				{	
					xhr.setRequestHeader(header, token);
				},
				contentType: "application/x-www-form-urlencoded;charset=utf-8",
				dataType : 'json',
				data : {"id" : $('.login_on').val(),
				"sell_id":$(this).next().next().val()},
				success: function(){
					
	        	},
				error : function(err){ console.log(err)}  //실패했을때
			});
			
			setTimeout(function(){
				if($('.product_count').text().slice(0,-3)!=1){
					if($('.product_count').text().slice(0,-3)%15==1){
						$('.page').val($('.page').val()-1);
					}
					$('.product_count').text(uncomma($('.product_count').text().slice(0,-3))-1+"대 찜");	        	
					button_page($('.page').val());
				}else{
					$('.product_count').text("0대 찜"); 
					$('.page_choice').remove(); 
					$('.page_number').append('<li class="page-item choice page_choice"><a href="#" class="page-link">1</a></li>');
					$('.no_carlist').removeClass('off');
					$('.product_all').addClass('off');
				}
   			}, 500);
		}
	})
	
	$('.delete_heart').click(function(){
		if($('.product_count').text().slice(0,-3)%15==0){
			alert('삭제할 목록이 없습니다.');
		}else{
			var result = confirm('전체 삭제 하시겠습니까?');
			if(result){
				$.ajax({
					type : 'post',
					async : true,
					url : '../user/heart_all.do',
					beforeSend : function(xhr)
					{	
						xhr.setRequestHeader(header, token);
					},
					contentType: "application/x-www-form-urlencoded;charset=utf-8",
					dataType : 'json',
					data : {"id" : $('.login_on').val()},
					success: function(){
		        	},
					error : function(err){ console.log(err)}  //실패했을때
				});
				$('.product_count').text("0대 찜"); 
				$('.page_choice').remove(); 
				$('.page_number').append('<li class="page-item choice page_choice"><a href="#" class="page-link">1</a></li>');
				$('.no_carlist').removeClass('off');
				$('.product_all').addClass('off');
			}
		}
	})
	
	$(document).on("click",".page_choice",function(){
		var t = $(this).text();
		button_page(t);
	});
	
	$(document).on("click",".start_page",function(){
		button_page(1);
	});
	
	$(document).on("click",".prev_page",function(){
		var t = $('.choice').text();
		if(t!=1)
			button_page(Number(t)-Number(1));
	});
	
	$(document).on("click",".next_page",function(){
		var temp=$('.product_count').text().slice(0,-3);
		var page_count = Math.floor(uncomma(temp)/15)+1;
		if(uncomma(temp)%15==0)
			page_count -= 1;
		var t = $('.choice').text();
		if(t!=page_count)
			button_page(Number(t)+Number(1));
	});
	
	$(document).on("click",".end_page",function(){
		var temp=$('.product_count').text().slice(0,-3);
		var page_count = Math.floor(Number(uncomma(temp))/Number(15))+1;
		if(uncomma(temp)%15==0)
			page_count -= 1;
		button_page(page_count);
	});
	
	function button_page(btn){
		$('.page').val(btn);
		$.ajax({
			type : 'post',
			async : true,
			url : '../user/heart_select.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {"id" : $('.login_on').val(),
			"page":btn},
			success: function(list){
				car_liston(list);
		    },
			error : function(err){ console.log(err)}  //실패했을때
		});
		var temp=$('.product_count').text().slice(0,-3);
		var page_count = Math.floor(uncomma(temp)/15)+1;
		if(uncomma(temp)%15==0)
			page_count -= 1;
		$('.page_choice').remove();
		
		var start_page;
		var end_page;
		
		if(btn<=5){
			start_page=1;
			if(page_count<=5)
				end_page=page_count;
			else{
				if(page_count<10)
					end_page=page_count;					
				else
					end_page=10;
			
			}
			for(var i=1;i<=end_page;i++){
				if(i==btn)
					$('.page_number').append('<li class="page-item choice page_choice"><a href="#" class="page-link">'+i+'</a></li>');
				else
					$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+i+'</a></li>');					
			}
		}
	}
	function car_liston(list){
		if(list.length == 0){
			$('.no_carlist').removeClass('off');
			$('.product_all').addClass('off');
		}else{
			$('.product_all').removeClass('off');
			$('.no_carlist').addClass('off');
		}
		for ( var count = 0; count < 15-list.length; count++){
					$(".product_all:eq("+ (14-count) +")").addClass('off');
				}
				for ( var count = 0; count < list.length ; count++){					
					$(".go_detail1:eq("+count+")").attr("href", "../all/salesDetail.do?num="+list[count].sell_id);
					$(".go_detail2:eq("+count+")").attr("href", "../all/salesDetail.do?num="+list[count].sell_id);
					$(".car_image:eq("+count+")").attr("src", list[count].image+'img1.png');
					$(".go_detail2:eq("+count+")").text(list[count].title);
					if(list[count].resultoption=='')
						$(".car_opt:eq("+count+")").text("옵션이 등록되지 않음");
					else	
						$(".car_opt:eq("+count+")").text(list[count].resultoption);
					$(".car_price:eq("+count+")").text(comma(list[count].price)+'만원');
					$(".sell_id:eq("+count+")").val(list[count].sell_id);
					
				}		
	}
	//콤마 찍기
	function comma(num){
    var len, point, str; 
       
    num = num + ""; 
    point = num.length % 3 ;
    len = num.length; 
   
    str = num.substring(0, point); 
    while (point < len) { 
        if (str != "") str += ","; 
        str += num.substring(point, point + 3); 
        point += 3; 
    } 
     
    return str;
 
	}
	//콤마풀기
    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    }
})

