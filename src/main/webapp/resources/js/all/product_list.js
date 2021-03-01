$(function() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";

	var choose1;
	var choose2;
	var choose3;
	var choose4;
	$(document).on("click",".btn_category",function(){
		choose1 = $(this).children().first().text();
		$('.btn_category').removeClass('btn-ch');
		$(this).addClass('btn-ch');
		$('.cell-jejo').addClass('off');
		$('.model_list').remove();
		$('.cell-mode').removeClass('off');
		$('.optdd').remove();
		$('.cell-detail').removeClass('off');
		$('.optgrade').remove();
		$.ajax({
			type : 'post',
			async : true,
			url : '../all/category.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {"category" : choose1},
			success: function(list){
				for ( var count = 0; count < list.length ; count++){
					if(list[count].count==null){
						$('.model_table').append(
						'<dd class="model_list"><button type="button" class="btn_model">'
						+'<input type="hidden" class="cate_num" value="'+list[count].car_num+'"/><span>'
						+list[count].model+'</span> <span class="t2 grCnt_877">0</span></button></dd>')
					}else{
						$('.model_table').append(
						'<dd class="model_list"><button type="button" class="btn_model">'
						+'<input type="hidden" class="cate_num" value="'+list[count].car_num+'"/><span>'
						+list[count].model+'</span> <span class="t2 grCnt_877">'
						+list[count].count+'</span></button></dd>')
					}
				}							
        	},
			error : function(err){ console.log(err)}  //실패했을때
		});
		
		$.ajax({
			type : 'post',
			async : true,
			url : '../all/category_product.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {"category" : choose1},
			success: function(list){
				for ( var count = 0; count < list.length ; count++){					
					$(".go_detail1:eq("+count+")").attr("href", "../all/detail.do?num="+list[count].sell_id);
					$(".go_detail2:eq("+count+")").attr("href", "../all/detail.do?num="+list[count].sell_id);
					$(".car_image:eq("+count+")").attr("src", list[count].image+'img1.png');
					$(".go_detail2:eq("+count+")").text(list[count].title);
					if(list[count].resultoption=='')
						$(".car_opt:eq("+count+")").text("옵션이 등록되지 않음");
					else	
						$(".car_opt:eq("+count+")").text(list[count].resultoption);
					$(".car_price:eq("+count+")").text(comma(list[count].price)+'만원');
				}							
        	},
			error : function(err){ console.log(err);}  //실패했을때
		});
	});
	
	$(document).on("click",".btn_model",function(){
		choose2 = $(this).children().first().val();
		$('.btn_model').removeClass('btn-ch');
		$(this).addClass('btn-ch');
		$('.cell-mode').addClass('off');
		$('.optdd').remove();
		$('.cell-detail').removeClass('off');
		$('.optgrade').remove();
		$.ajax({
			type : 'post',
			async : true,
			url : '../all/detail.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {"car_num" : choose2},
			success: function(list){
			for ( var count = 0; count < list.length ; count++){
				if(list[count].count==null){
					$('.detail_table').append('<dd class="optdd"><span class="optBox"><input class="op_ck" type="checkbox"><label>'
					+list[count].detail
					+'</label><input type="hidden" class="d_id" value="'+list[count].d_id+'"/></span><span class="t2 mdCnt_2346">0</span></dd>')
				}else{
					$('.detail_table').append('<dd class="optdd"><span class="optBox"><input class="op_ck" type="checkbox"><label>'
					+list[count].detail
					+'</label><input type="hidden" class="d_id" value="'+list[count].d_id+'"/></span><span class="t2 mdCnt_2346">'
					+list[count].count+'</span></dd>')
				}
				}				
        	},
			error : function(err){ console.log(err)}  //실패했을때
		});
	});
	
	$(document).on("click",".op_ck",function(){
		$('.optgrade').remove();
		if($(".op_ck:checked").length == 1){
			$('.cell-detail').addClass('off');
			$('.two-detail').addClass('off');
			choose3=$(".op_ck:checked").next().next().val();
			
			$.ajax({
			type : 'post',
			async : true,
			url : '../all/grade.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {"d_id" : choose3},
			success: function(list){
				for ( var count = 0; count < list.length ; count++){
					if(list[count].count==null){
						$('.grade_table').append('<dd class="optgrade"><span class="optBoxg1"><input class="opg_ck1" type="checkbox"/><label>'
						+list[count].grade1+'</label></span><span class="t2 lvCnt_12848">0</span></dd>')
					}else{
						$('.grade_table').append('<dd class="optgrade"><span class="optBoxg1"><input class="opg_ck1" type="checkbox"/><label>'
						+list[count].grade1+'</label></span><span class="t2 lvCnt_12848">'
						+list[count].count+'</span></dd>')
					}
				}			
        	},
			error : function(err){ console.log(err)}  //실패했을때
		});
			
		}else if($(".op_ck:checked").length == 0){
			$('.cell-detail').removeClass('off');
			$('.two-detail').addClass('off');
		}else{
			$('.two-detail').removeClass('off');
		}
	});
	
	
	$(document).on("click",".opg_ck1",function(){
		choose4 = $(this).next().text();
		if($(this).is(':checked')){
			$.ajax({
			type : 'post',
			async : true,
			url : '../all/grade2.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {
			"d_id" : choose3,
			"grade1" : choose4},
			success: function(list){
				for ( var count = 0; count < list.length ; count++){
					if(list[count].grade2 != '0'){
						if(list[count].count==null){
							$('.optgrade').filter(":contains("+choose4+")").first().append('<dl class="sub-list"><dd class="optdd"><span class="optBoxg2"><i class="fas fa-long-arrow-alt-right"></i><input type="checkbox"><label>'
							+list[count].grade2+'</label></span><span class="t2 lv2Cnt_27824">0</span></dd></dl>')
						}else{
							$('.optgrade').filter(":contains("+choose4+")").first().append('<dl class="sub-list"><dd class="optdd"><span class="optBoxg2"><i class="fas fa-long-arrow-alt-right"></i><input type="checkbox"><label>'
							+list[count].grade2+'</label></span><span class="t2 lv2Cnt_27824">'
							+list[count].count+'</span></dd></dl>')
						}
					}
				}			
        	},
			error : function(err){ console.log(err)}  //실패했을때
		});
		
		}else{
			$('.optgrade').filter(":contains("+choose4+")").first().children('.sub-list').remove();
		}
	});
	
	$('.country>span').click(function(){
		$(this).parent().children().removeClass('downline');
		$(this).addClass('downline');
		$('.hero-caption>span').text($(this).text());
		$('.abroad_table').children().remove();
		$('.model_list').remove();
		$('.cell-jejo').removeClass('off');
		$('.optdd').remove();
		$('.optgrade').remove();
		$('.cell-mode').removeClass('off');
		$('.cell-detail').removeClass('off');
		
		if($(this).text()=='전체'){
			$.ajax({
			type : 'post',
			async : true,
			url : '../all/allabroad.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {
			"abroad" : $(this).text()},
			success: function(list){
				for ( var count = 0; count < list.length ; count++){
					if(list[count].count==null){
						$('.abroad_table').append('<dd class="category_list">'
								+'<button type="button" class="btn_category"><span>'
								+list[count].jejosa
								+'</span> <span class="t2 mkCnt_21">0</span></button></dd>');
					}else{
						$('.abroad_table').append('<dd class="category_list">'
								+'<button type="button" class="btn_category"><span>'
								+list[count].jejosa
								+'</span> <span class="t2 mkCnt_21">'
								+list[count].count+'</span></button></dd>');
					}
				}			
        	},
			error : function(err){ console.log(err)}  //실패했을때
		});
		}else{
		$.ajax({
			type : 'post',
			async : true,
			url : '../all/abroad.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {
			"abroad" : $(this).text()},
			success: function(list){
				for ( var count = 0; count < list.length ; count++){
					if(list[count].count==null){
						$('.abroad_table').append('<dd class="category_list">'
								+'<button type="button" class="btn_category"><span>'
								+list[count].jejosa
								+'</span> <span class="t2 mkCnt_21">0</span></button></dd>');
					}else{
						$('.abroad_table').append('<dd class="category_list">'
								+'<button type="button" class="btn_category"><span>'
								+list[count].jejosa
								+'</span> <span class="t2 mkCnt_21">'
								+list[count].count+'</span></button></dd>');
					}
				}			
        	},
			error : function(err){ console.log(err)}  //실패했을때
		});
		}
	});
	
	$(document).on("click",".fa-heart",function(){
			if($('.login_on').val()=='ok'){
				alert('1');
			}else{
				alert('2');
			}
	});
	
	
	
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


})