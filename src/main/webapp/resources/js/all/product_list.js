$(function() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";

	var choose1;
	$('.btn_category').click(function(){
		choose1 = $(this).children().first().text();
		alert(choose1);
		$.ajax({
			type : 'POST',
			async : true,
			url : '../all/category.do',
			beforeSend : function(xhr)
			{	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/json",
			dataType : 'text',
			data : choose1,
			
			success: function(data){
				alert(data);							
        	},
			error : function(err){ console.log(err)}  //실패했을때
		});
	});
	
})