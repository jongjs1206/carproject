$(function() {
	var choose1;
	$('.btn_category').click(function(){
		choose=$(this).children().first().text();
		alert('1');
		$.ajax({
			type : 'post',
			async : true,
			url : 'category.do',
			dataType : 'text',
			data : choose1,
			contentType  : 'application/x-www-form-urlencoded;charset=utf-8', //한글처리
			success: function(category){
				alert('2');								
        	},
			error : function(err){ console.log(err)}  //실패했을때
		});
	});
	
})