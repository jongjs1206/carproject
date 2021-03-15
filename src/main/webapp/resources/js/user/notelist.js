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
    	window.open('../user/note_get_select.do?l_id='+$(this).next().val(), 'window', 'toolbar=no,directory=no,status=no,menubar=no,scrollbars=no,resizeable=yes,copyhistory=no, width=395, height=630, left=0, top=0')
    })
    
    $(".send_title").click(function(){
    	window.open('../user/note_send_select.do?l_id='+$(this).next().val(), 'window', 'toolbar=no,directory=no,status=no,menubar=no,scrollbars=no,resizeable=yes,copyhistory=no, width=395, height=630, left=0, top=0')
    })

})

