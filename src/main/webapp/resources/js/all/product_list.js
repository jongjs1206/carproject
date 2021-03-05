$(function() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";

	var choose1;
	var choose2;
	var choose3;
	var choose4;
	
	var page = $('.page').val();
	var point=6;
	var page_count;
	var page_count_t1;
	var page_count_t2;
	
	//카테고리 눌렀을 때
	$(document).on("click",".btn_category",function(){
		$('.searh_text').val('');
		choose1 = $(this).children().first().text();
		$('.search_result').addClass('off');
		$('.btn_category').removeClass('btn-ch');
		$(this).addClass('btn-ch');
		$('.cell-jejo').addClass('off');
		$('.model_list').remove();
		$('.cell-mode').removeClass('off');
		$('.optdd').remove();
		$('.cell-detail').removeClass('off');
		$('.optgrade').remove();
		point=1;
		$('.fa-heart').removeClass('color_pink');
		$('.heart_on_off').val('off');
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
			data : {"id" : $('.login_on').val(),
			"category" : choose1,
			"page": page},
			success: function(list){
				car_liston(list);					
        	},
			error : function(err){ console.log(err);}  //실패했을때
		});
		
		var temp = $(this).children().last().text();
		$('.product_count').text('등록 '+comma(temp)+'대');
		page_count = Math.floor(uncomma(temp)/15);
		if(uncomma(temp)%15==0)
			page_count -= 1;
		$('.page_choice').remove();
		$('.page_number').append('<li class="page-item choice page_choice"><a href="#" class="page-link">1</a></li>');
		if(page_count>8){
			for(var i=0;i<9;i++){
				$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
			}
		}else{
			for(var i=0;i<page_count;i++){
				$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
			}
		}
	});
	
	
	//모델 눌렀을 때
	var model_count;
	$(document).on("click",".btn_model",function(){
		$('.searh_text').val('');
		$('.search_result').addClass('off');
		choose2 = $(this).children().first().val();
		$('.btn_model').removeClass('btn-ch');
		$(this).addClass('btn-ch');
		$('.cell-mode').addClass('off');
		$('.optdd').remove();
		$('.cell-detail').removeClass('off');
		$('.optgrade').remove();
		point=2;
		$('.fa-heart').removeClass('color_pink');
		$('.heart_on_off').val('off');
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
		
		$.ajax({
			type : 'post',
			async : true,
			url : '../all/model_product.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {"id" : $('.login_on').val(),
			"car_num" : choose2,
			"page": page},
			success: function(list){
				car_liston(list);					
        	},
			error : function(err){ console.log(err);}  //실패했을때
		});
		var temp = $(this).children().last().text();
		model_count=uncomma(temp);
		$('.product_count').text('등록 '+comma(temp)+'대');
		page_count = Math.floor(uncomma(temp)/15);
		if(uncomma(temp)%15==0)
			page_count -= 1;
		page_count_t1 = page_count;
		$('.page_choice').remove();
		$('.page_number').append('<li class="page-item choice page_choice"><a href="#" class="page-link">1</a></li>');
		if(page_count>8){
			for(var i=0;i<9;i++){
				$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
			}
		}else{
			for(var i=0;i<page_count;i++){
				$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
			}
		}
	});
	
	
	//세부모델 눌렀을 때
	var options;
	$(document).on("click",".op_ck",function(){
		$('.optgrade').remove();
		$('.searh_text').val('');
		options = "";
		$('.search_result').addClass('off');
		var temp = 0;
		
		
		
		$(".op_ck:checked").each(function(i,elements){
    		options = options+$(this).next().text()+"','";
    		temp = Number(uncomma(temp))+Number(uncomma($(this).parent().next().text()));
    	});
    	$('.product_count').text('등록 '+comma(temp)+'대');
    	page_count = Math.floor(uncomma(temp)/15);
		if(uncomma(temp)%15==0)
			page_count -= 1;
		
		if($(".op_ck:checked").length == 1){
			$('.cell-detail').addClass('off');
			$('.two-detail').addClass('off');
			choose3=$(".op_ck:checked").next().next().val();
			point=3;
			$('.fa-heart').removeClass('color_pink');
			$('.heart_on_off').val('off');
			
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
			
			$.ajax({
				type : 'post',
				async : true,
				url : '../all/detail_product.do',
				beforeSend : function(xhr)
				{	
					xhr.setRequestHeader(header, token);
				},
				contentType: "application/x-www-form-urlencoded;charset=utf-8",
				dataType : 'json',
				data : {"id" : $('.login_on').val(),
				"car_num" : choose2,
				"options" : options.slice(0,-3),
				"page": page},
				success: function(list){
					car_liston(list);					
	        	},
				error : function(err){ console.log(err);}  //실패했을때
			});
		
		$('.page_choice').remove();
		$('.page_number').append('<li class="page-item choice page_choice"><a href="#" class="page-link">1</a></li>');
		page_count_t2 = page_count;
		if(page_count>8){
			for(var i=0;i<9;i++){
				$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
			}
		}else{
			for(var i=0;i<page_count;i++){
				$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
			}
		}
		
		}else if($(".op_ck:checked").length == 0){
			$('.cell-detail').removeClass('off');
			$('.two-detail').addClass('off');
			point=2;
			$.ajax({
				type : 'post',
				async : true,
				url : '../all/model_product.do',
				beforeSend : function(xhr)
				{	
					xhr.setRequestHeader(header, token);
				},
				contentType: "application/x-www-form-urlencoded;charset=utf-8",
				dataType : 'json',
				data : {"id" : $('.login_on').val(),
				"car_num" : choose2,
				"page": page},
				success: function(list){
					car_liston(list);					
		    	},
				error : function(err){ console.log(err);}  //실패했을때
			});
			
			$('.product_count').text('등록 '+model_count+'대');
			$('.page_choice').remove();
		$('.page_number').append('<li class="page-item choice page_choice"><a href="#" class="page-link">1</a></li>');	
			if(page_count_t1>8){
				for(var i=0;i<9;i++){
					$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
				}
			}else{
				for(var i=0;i<page_count_t1;i++){
					$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
				}
			}
		}else{
			$('.two-detail').removeClass('off');
			point=3;
			$.ajax({
			type : 'post',
			async : true,
			url : '../all/detail_product.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {"id" : $('.login_on').val(),
			"car_num" : choose2,
			"options" : options.slice(0,-3),
			"page": page},
			success: function(list){
				car_liston(list);					
        	},
			error : function(err){ console.log(err);}  //실패했을때
		});	
		$('.page_choice').remove();
		$('.page_number').append('<li class="page-item choice page_choice"><a href="#" class="page-link">1</a></li>');
		if(page_count>8){
			for(var i=0;i<9;i++){
				$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
			}
		}else{
			for(var i=0;i<page_count;i++){
				$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
			}
		}
		}
	});
	
	//등급 눌렀을 때
	var options2;
	$(document).on("click",".opg_ck1",function(){
		choose4 = $(this).next().text();
		$('.search_result').addClass('off');
		var temp = 0;
		options2="";
		$('.searh_text').val('');
		$(".opg_ck1:checked").each(function(i,elements){
    		options2 = options2+$(this).next().text()+"','";
    		
    		temp = Number(uncomma(temp)) + Number(uncomma($(this).parent().next().text()));
    	
    	});
    	
    	var numlist = [];
    	$(".opg_ck2:checked").each(function(i,elements){
    		temp = Number(uncomma(temp))+Number(uncomma($(this).parent().next().text()));
    		var ck=0;
    		for(var i=0;i<numlist.length;i++){
    			if(numlist[i]==$(this).parent().parent().parent().parent().children().first().text()){
    				ck=1;
    			}
    			
    		}
    		if(ck==0){
    			temp = Number(uncomma(temp)) - Number(uncomma($(this).parent().parent().parent().parent().children().first().next().text()));
    		}
    		numlist[numlist.length]=$(this).parent().parent().parent().parent().children().first().text();
    	});
    	
    	
		
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
							$('.optgrade').filter(":contains("+choose4+")").first().append('<dl class="sub-list"><dd class="optdd"><span class="optBoxg2"><i class="fas fa-long-arrow-alt-right"></i><input class="opg_ck2" type="checkbox"><label>'
							+list[count].grade2+'</label></span><span class="t2 lv2Cnt_27824">0</span></dd></dl>')
						}else{
							$('.optgrade').filter(":contains("+choose4+")").first().append('<dl class="sub-list"><dd class="optdd"><span class="optBoxg2"><i class="fas fa-long-arrow-alt-right"></i><input class="opg_ck2" type="checkbox"><label>'
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
		if($(".opg_ck1:checked").length == 0){
		point=3;
		$.ajax({
			type : 'post',
			async : true,
			url : '../all/detail_product.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {"id" : $('.login_on').val(),
			"car_num" : choose2,
			"options" : options.slice(0,-3),
			"page": page},
			success: function(list){
				car_liston(list);					
        	},
			error : function(err){ console.log(err);}  //실패했을때
		});
		$(".op_ck:checked").each(function(i,elements){
    		options = options+$(this).next().text()+"','";
    		temp = Number(uncomma(temp))+Number(uncomma($(this).parent().next().text()));
    	});
    	$('.product_count').text('등록 '+comma(temp)+'대');	
		if(page_count_t2>8){
			for(var i=0;i<9;i++){
				$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
			}
		}else{
			for(var i=0;i<page_count_t2;i++){
				$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
			}
		}
		}else{
		point=4;
		$.ajax({
			type : 'post',
			async : true,
			url : '../all/grade1_product.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {"id" : $('.login_on').val(),
			"car_num" : choose2,
			"options" : options.slice(0,-3),
			"options2" : options2.slice(0,-3),
			"page": page},
			success: function(list){
				car_liston(list);					
        	},
			error : function(err){ console.log(err);}  //실패했을때
		});
		$('.product_count').text('등록 '+comma(temp)+'대');
		page_count = Math.floor(uncomma(temp)/15);
		if(uncomma(temp)%15==0)
			page_count -= 1;
		page_count_t1 = page_count;
		$('.page_choice').remove();
		$('.page_number').append('<li class="page-item choice page_choice"><a href="#" class="page-link">1</a></li>');
		if(page_count>8){
			for(var i=0;i<9;i++){
				$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
			}
		}else{
			for(var i=0;i<page_count;i++){
				$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
			}
		}
		
		}	
	});
	
	//등급 2 눌렀을 때
	var options3;
	$(document).on("click",".opg_ck2",function(){
		options3="";
		$('.search_result').addClass('off');
		$('.searh_text').val('');
		var temp = 0;
		$(".opg_ck2:checked").each(function(i,elements){
    		options3 = options3+$(this).next().text()+"','";
    	});
    	
    	$(".opg_ck1:checked").each(function(i,elements){
    		options2 = options2+$(this).next().text()+"','";
    		
    		temp = Number(uncomma(temp)) + Number(uncomma($(this).parent().next().text()));
    	
    	});
    	var numlist = [];
    	$(".opg_ck2:checked").each(function(i,elements){
    		temp = Number(uncomma(temp))+Number(uncomma($(this).parent().next().text()));
    		var ck=0;
    		for(var i=0;i<numlist.length;i++){
    			if(numlist[i]==$(this).parent().parent().parent().parent().children().first().text()){
    				ck=1;
    			}
    			
    		}
    		if(ck==0){
    			temp = Number(uncomma(temp)) - Number(uncomma($(this).parent().parent().parent().parent().children().first().next().text()));
    		}
    		numlist[numlist.length]=$(this).parent().parent().parent().parent().children().first().text();
    	});
    	$('.product_count').text('등록 '+comma(temp)+'대');
    	page_count = Math.floor(uncomma(temp)/15);
		if(uncomma(temp)%15==0)
			page_count -= 1;
		page_count_t1 = page_count;
		$('.page_choice').remove();
		$('.page_number').append('<li class="page-item choice page_choice"><a href="#" class="page-link">1</a></li>');
		if(page_count>8){
			for(var i=0;i<9;i++){
				$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
			}
		}else{
			for(var i=0;i<page_count;i++){
				$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
			}
		}
    	if($(".opg_ck2:checked").length == 0){
    		point=4;
    		$.ajax({
			type : 'post',
			async : true,
			url : '../all/grade1_product.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {"id" : $('.login_on').val(),
			"car_num" : choose2,
			"options" : options.slice(0,-3),
			"options2" : options2.slice(0,-3),
			"page": page},
			success: function(list){
				car_liston(list);					
        	},
			error : function(err){ console.log(err);}  //실패했을때
		});
    	}else{
    	point=5;
    	$.ajax({
			type : 'post',
			async : true,
			url : '../all/grade2_product.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {"id" : $('.login_on').val(),
			"car_num" : choose2,
			"options" : options.slice(0,-3),
			"options2" : options2.slice(0,-3),
			"options3" : options3.slice(0,-3),
			"page": page},
			success: function(list){
				car_liston(list);					
        	},
			error : function(err){ console.log(err);}  //실패했을때
		});
		}
	});
	
	
	//나라 눌렀을때
	$('.country>span').click(function(){
		$('.search_result').addClass('off');
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
		$('.searh_text').val('');
		point=6;
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
		
		$.ajax({
			type : 'post',
			async : true,
			url : '../all/country_all.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {"id" : $('.login_on').val(),
			"page": page},
			success: function(list){
				car_liston(list);					
        	},
			error : function(err){ console.log(err);}  //실패했을때
		});
		
		$.ajax({
			type : 'post',
			async : true,
			url : '../all/country_all_count.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			
			success: function(temp){
				$('.product_count').text('등록 '+comma(temp)+'대');
			    	page_count = Math.floor(temp/15);
					if(uncomma(temp)%15==0)
						page_count -= 1;
					page_count_t1 = page_count;
					$('.page_choice').remove();
					$('.page_number').append('<li class="page-item choice page_choice"><a href="#" class="page-link">1</a></li>');
					if(page_count>8){
						for(var i=0;i<9;i++){
							$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
						}
					}else{
						for(var i=0;i<page_count;i++){
							$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
						}
					}		
        	},
			error : function(err){ console.log(err);}  //실패했을때
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
			$.ajax({
				type : 'post',
				async : true,
				url : '../all/country_one.do',
				beforeSend : function(xhr)
				{	
					xhr.setRequestHeader(header, token);
				},
				contentType: "application/x-www-form-urlencoded;charset=utf-8",
				dataType : 'json',
				data : {"id" : $('.login_on').val(),
				"country":$(this).text(),
				"page": page},
				success: function(list){
					car_liston(list);					
	        	},
				error : function(err){ console.log(err);}  //실패했을때
			});
			
			$.ajax({
				type : 'post',
				async : true,
				url : '../all/country_one_count.do',
				beforeSend : function(xhr)
				{	
					xhr.setRequestHeader(header, token);
				},
				contentType: "application/x-www-form-urlencoded;charset=utf-8",
				dataType : 'json',
				data : {"country":$(this).text()},
				success: function(temp){
					$('.product_count').text('등록 '+comma(temp)+'대');
				    	page_count = Math.floor(uncomma(temp)/15);
						if(uncomma(temp)%15==0)
							page_count -= 1;
						page_count_t1 = page_count;
						$('.page_choice').remove();
						$('.page_number').append('<li class="page-item choice page_choice"><a href="#" class="page-link">1</a></li>');
						if(page_count>8){
							for(var i=0;i<9;i++){
								$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
							}
						}else{
							for(var i=0;i<page_count;i++){
								$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
							}
						}		
	        	},
				error : function(err){ console.log(err);}  //실패했을때
			});
		}
		
    	
	});
	
	//검색기능
	$('.btn_search').click(function(){
		if($('.searh_text').val()==''){
			alert('검색어를 입력하세요');
		}else{
			point=7;
			$('.search_result').removeClass('off');
			$('.search_result').text("'"+$('.searh_text').val()+"' 의 검색결과")
			$.ajax({
				type : 'post',
				async : true,
				url : '../all/search_select.do',
				beforeSend : function(xhr)
				{	
					xhr.setRequestHeader(header, token);
				},
				contentType: "application/x-www-form-urlencoded;charset=utf-8",
				dataType : 'json',
				data : {"id" : $('.login_on').val(),
					"search":$('.searh_text').val(),
					"page": page},
				success: function(list){
					car_liston(list);
	        	},
				error : function(err){ console.log(err);}  //실패했을때
			});
			
			$.ajax({
				type : 'post',
				async : true,
				url : '../all/search_count.do',
				beforeSend : function(xhr)
				{	
					xhr.setRequestHeader(header, token);
				},
				contentType: "application/x-www-form-urlencoded;charset=utf-8",
				dataType : 'json',
				data : {"search":$('.searh_text').val()},
				success: function(temp){
					$('.product_count').text('등록 '+comma(temp)+'대');
				    	page_count = Math.floor(temp/15);
						if(temp%15==0)
							page_count -= 1;
						page_count_t1 = page_count;
						$('.page_choice').remove();
						$('.page_number').append('<li class="page-item choice page_choice"><a href="#" class="page-link">1</a></li>');
						if(page_count>8){
							for(var i=0;i<9;i++){
								$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
							}
						}else{
							for(var i=0;i<page_count;i++){
								$('.page_number').append('<li class="page-item page_choice"><a href="#" class="page-link">'+(i+2)+'</a></li>');
							}
						}
	        	},
				error : function(err){ console.log(err);}  //실패했을때
			});
			$('.searh_text').val('');
		}
	});
	
	//찜기능
	$(document).on("click",".fa-heart",function(){
			if($('.login_on').val()==""){
				alert('로그인시 찜 기능을 사용할 수 있습니다.');
			}else{
				if($(this).next().val()=='on'){
					$(this).next().val('off');
					$(this).removeClass('color_pink');
					
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
				
				}else{
					$(this).next().val('on');
					$(this).addClass('color_pink');
										
			$.ajax({
			type : 'post',
			async : true,
			url : '../all/heart_on.do',
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
				}
			}
	});
	
	
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
		var temp=$('.product_count').text().slice(3,-1);
		var page_count = Math.floor(uncomma(temp)/15)+1;
		if(uncomma(temp)%15==0)
			page_count -= 1;
		var t = $('.choice').text();
		if(t!=page_count)
			button_page(Number(t)+Number(1));
	});
	
	$(document).on("click",".end_page",function(){
		var temp=$('.product_count').text().slice(3,-1);
		var page_count = Math.floor(Number(uncomma(temp))/Number(15))+1;
		if(uncomma(temp)%15==0)
			page_count -= 1;
		button_page(page_count);
	});

	function button_page(btn){
		$('.page').val(btn);
		
		if(point==1){
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
			data : {"id" : $('.login_on').val(),
			"category" : choose1,
			"page": btn},
			success: function(list){
				car_liston(list);					
        	},
			error : function(err){ console.log(err);}  //실패했을때
		});
		}else if(point==2){
			$.ajax({
			type : 'post',
			async : true,
			url : '../all/model_product.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {"id" : $('.login_on').val(),
			"car_num" : choose2,
			"page": btn},
			success: function(list){
				car_liston(list);					
        	},
			error : function(err){ console.log(err);}  //실패했을때
		});
		}else if(point==3){
		$.ajax({
			type : 'post',
			async : true,
			url : '../all/detail_product.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {"id" : $('.login_on').val(),
			"car_num" : choose2,
			"options" : options.slice(0,-3),
			"page": btn},
			success: function(list){
				car_liston(list);					
        	},
			error : function(err){ console.log(err);}  //실패했을때
		});
		}else if(point==4){
		$.ajax({
			type : 'post',
			async : true,
			url : '../all/grade1_product.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {"id" : $('.login_on').val(),
			"car_num" : choose2,
			"options" : options.slice(0,-3),
			"options2" : options2.slice(0,-3),
			"page": btn},
			success: function(list){
				car_liston(list);					
        	},
			error : function(err){ console.log(err);}  //실패했을때
		});
		}else if(point==5){
		$.ajax({
			type : 'post',
			async : true,
			url : '../all/grade2_product.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {"id" : $('.login_on').val(),
			"car_num" : choose2,
			"options" : options.slice(0,-3),
			"options2" : options2.slice(0,-3),
			"options3" : options3.slice(0,-3),
			"page": btn},
			success: function(list){
				car_liston(list);					
        	},
			error : function(err){ console.log(err);}  //실패했을때
		});
		}else if(point==6){
			if($('.downline').text()=='전체'){
			
				$.ajax({
			type : 'post',
			async : true,
			url : '../all/country_all.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {"id" : $('.login_on').val(),
			"page": btn},
			success: function(list){
				car_liston(list);					
        	},
			error : function(err){ console.log(err);}  //실패했을때
		});
			}else{
				$.ajax({
			type : 'post',
			async : true,
			url : '../all/country_one.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			dataType : 'json',
			data : {"id" : $('.login_on').val(),
			"country":$('.downline').text(),
			"page": btn},
			success: function(list){
				car_liston(list);					
        	},
			error : function(err){ console.log(err);}  //실패했을때
		});
			}
		}else if(point==7){
			$.ajax({
				type : 'post',
				async : true,
				url : '../all/search_select.do',
				beforeSend : function(xhr)
				{	
					xhr.setRequestHeader(header, token);
				},
				contentType: "application/x-www-form-urlencoded;charset=utf-8",
				dataType : 'json',
				data : {"id" : $('.login_on').val(),
					"search":$('.search_result').text().slice(1,-8),
					"page": btn},
				success: function(list){
					car_liston(list);
	        	},
				error : function(err){ console.log(err);}  //실패했을때
			});
		}
		var temp=$('.product_count').text().slice(3,-1);
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
		}else{
			start_page=btn-4;
			if(Number(btn)+Number(5)>page_count)
				end_page=page_count;
			else
				end_page=Number(btn)+Number(5);
			for(var i=start_page;i<=end_page;i++){
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
					$(".go_detail1:eq("+count+")").attr("href", "../all/detail.do?num="+list[count].sell_id);
					$(".go_detail2:eq("+count+")").attr("href", "../all/detail.do?num="+list[count].sell_id);
					$(".car_image:eq("+count+")").attr("src", list[count].image+'img1.png');
					$(".go_detail2:eq("+count+")").text(list[count].title);
					if(list[count].resultoption=='')
						$(".car_opt:eq("+count+")").text("옵션이 등록되지 않음");
					else	
						$(".car_opt:eq("+count+")").text(list[count].resultoption);
					$(".car_price:eq("+count+")").text(comma(list[count].price)+'만원');
					$(".sell_id:eq("+count+")").val(list[count].sell_id);
					
					if(list[count].ht=='1'){
						$(".fa-heart:eq("+count+")").addClass('color_pink');
						$(".heart_on_off:eq("+count+")").val('on');
					}
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