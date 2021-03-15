$(function() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	if($('.note').val()=='send'){
		$('.get_note').removeClass('downline');
		$('.send_note').addClass('downline');
		$('.get_note').removeClass('blue-color');
		$('.send_note').addClass('blue-color');
		$('.send_note').removeClass('gray');
		$('.get_note').addClass('gray');
	}
	
	$(".all_cbox").click(function(){
        //클릭되었으면
        if($(".all_cbox").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $(".ck_note").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $(".ck_note").prop("checked",false);
        }
    })
    
    $(".get_title").click(function(){
    	$(this).parent().parent().parent().addClass('gray');
    	window.open('../user/note_get_select.do?l_id='+$(this).next().val(), 'window', 'toolbar=no,directory=no,status=no,menubar=no,scrollbars=no,resizeable=yes,copyhistory=no, width=395, height=630, left=0, top=0')
    	
    	$.ajax({
			type : 'post',
			async : true,
			url : '../user/updatesend.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			
			data : {l_id:$(this).next().val()},
			success: function(){
				
        	},
			error : function(err){ console.log(err)}  //실패했을때
		});
    })
    
    $(".send_title").click(function(){
    	window.open('../user/note_send_select.do?l_id='+$(this).next().val(), 'window', 'toolbar=no,directory=no,status=no,menubar=no,scrollbars=no,resizeable=yes,copyhistory=no, width=395, height=630, left=0, top=0')
    })
    
    $(".note_delete").click(function(){
		if($('.ck_note:checked').length==0){
			alert('선택 먼저 해주세요.');
		}else{
			var result = confirm('쪽지를 제거 하시겠습니까?');
			if(result){
				var re_page=$('.page').val();
				if($(".all_cbox").is(":checked") == true){
					re_page=re_page-1;
				}
				if(re_page<1){
					re_page=1;
				}
				if($('.note').val()=='get'){
					$('.ck_note:checked').each(function(i,elements){
	    				$.ajax({
							type : 'post',
							async : true,
							url : '../user/noshowget.do',
							beforeSend : function(xhr)
							{	
								xhr.setRequestHeader(header, token);
							},
							contentType: "application/x-www-form-urlencoded;charset=utf-8",
							
							data : {l_id:$(this).next().next().children().last().val()},
							success: function(){
								
				        	},
							error : function(err){ console.log(err)}  //실패했을때
						});
	    				setTimeout(function() { 
						    window.self.location = "../user/notelist.do?note="+$('.note').val()+"&page="+re_page;
						}, 100);
	    				
					});
				}else{
					$('.ck_note:checked').each(function(i,elements){
	    				$(this).next().next().children().last().val()
	    				
	    				$.ajax({
							type : 'post',
							async : true,
							url : '../user/noshowsend.do',
							beforeSend : function(xhr)
							{	
								xhr.setRequestHeader(header, token);
							},
							contentType: "application/x-www-form-urlencoded;charset=utf-8",
							
							data : {l_id:$(this).next().next().children().last().val()},
							success: function(){
								
				        	},
							error : function(err){ console.log(err)}  //실패했을때
						});
	    				setTimeout(function() { 
						    window.self.location = "../user/notelist.do?note="+$('.note').val()+"&page="+re_page;
						}, 100);
					});		
				}
			}
		}
	})
	
	$(".ck_note").click(function(){
		if($('.ck_note:checked').length==$('.ck_note').length){
			$('.all_cbox').prop("checked", true);
		}else{
			$('.all_cbox').prop("checked", false);
		}
	})
})

