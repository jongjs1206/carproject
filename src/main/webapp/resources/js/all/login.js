/*
작성자 문희주
*/

$(function(){
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";

	$.ajax({
		type : 'post',
		async : true,
		url : '../all/certNumChk.do',
		beforeSend : function(xhr)
		{	
			xhr.setRequestHeader(header, token);
		},
		contentType: "application/x-www-form-urlencoded;charset=utf-8",
	 	
	 	data : {'certCode' : $('#certCode').val()
	 			
	 	},
	 	
	 	success : function(result){
	 	
	 		if(result=='인증'){
	 		alert('이메일 인증에 성공하셨습니다');
	 		emailPassCheck=true;
	 		
	 		//이메일칸 readonly
	 		$("#email1").prop("readonly",true);
	 		$("#email2").prop("readonly",true);
	 		
	 		}else{
	 		alert(result);
	 		emailPassCheck=false;
	 		}
	 	},
	 	
	 	error : function(err){
	 		console.log(err);
	 	}
	 })  

	
})
