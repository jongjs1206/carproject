$(function() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";

	var choose1;
	$('.btn_category').click(function(){
		choose1 = $(this).children().first().text();
		alert(choose1);
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
					alert(list[count].model);
				}							
        	},
			error : function(err){ console.log(err)}  //실패했을때
		});
	});
	
})