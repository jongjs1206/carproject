$(function() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";

	
	// 제조사 -> 모델 
	$("#carBrand").change(function() {
		
		var brand = $("#carBrand").val();
		$("#title").val(brand);
		
		$.ajax({	
        	type : 'post',
            async : true,
            url : '../user/model.do',
            beforeSend : function(xhr)
            {   
               xhr.setRequestHeader(header, token);
            },
            contentType: "application/x-www-form-urlencoded;charset=utf-8",      // 한글처리
            dataType : 'json',
            data : {"jejosa" : $('.carBrand').val()},
            success: function(list){
            	$('.carModel').children().remove();
            	$('.carModel').append('<option>모델</option>');
               for (var count = 0; count < list.length; count++){
                  $('.carModel').append('<option>' + list[count].model + '</option>');
               }	// end of for문 
            },	// success
            error : function(err){console.log(err)}  // 실패했을때
        }); 
	});
	
	// 모델 -> 세부모델
	$("#carModel").change(function() {
		
		//console.log($("#carModel option:selected").val())

		$("#title").val("");
		
		var model = $("#carModel").val();
		$("#title").val($("#carBrand").val() + " " + model);
		
		$.ajax({
	    	type : 'post',
	        async : true,
	        url : '../user/detailmodel.do',
	        beforeSend : function(xhr)
	        {   
	        	xhr.setRequestHeader(header, token);
	        },
	        contentType: "application/x-www-form-urlencoded;charset=utf-8",      // 한글처리
	        dataType : 'json',
	        data : {"jejosa" : $('.carBrand').val(), 
	        		"model" : $('.carModel').val()},
	        success: function(list){
	        	$('.carDetailModel').children().remove();
	        	$('.carDetailModel').append('<option>세부모델</option>');
	        	for (var count = 0; count < list.length; count++){
	            	$('.carDetailModel').append('<option>' + list[count].detail + '</option>');
	            }	// end of for문 
	        },	// success
	        error : function(err){console.log(err)}  // 실패했을때
		});  
	});
	
	// 세부 모델 -> 등급
	$("#carDetailModel").change(function() {
		
		$("#title").val("");
		
		var brand = $("#carBrand").val();
		var model = $("#carModel").val();
		var detailModel = $("#carDetailModel").val();
		
		var result = "";
		var beforeTitle = brand + " " + model;
		
		if (detailModel.indexOf('(') != -1) {
			var startIndex = detailModel.indexOf('(')
			var rslt = detailModel.substring(0, startIndex)
			result = beforeTitle + " " + rslt
		} else {
			result = beforeTitle + " " + detailModel
		}
		
		$("#title").val(result);
		
		$.ajax({
	    	type : 'post',
	        async : true,
	        url : '../user/grade.do',
	        beforeSend : function(xhr)
	        {   
	        	xhr.setRequestHeader(header, token);
	        },
	        contentType: "application/x-www-form-urlencoded;charset=utf-8",      // 한글처리
	        dataType : 'json',
	        data : {"jejosa" : $('.carBrand').val(), 
	        		"model" : $('.carModel').val(),
	        		"detail" : $('.carDetailModel').val()},
	        success: function(list){
	        	$('.carGrade').children().remove();
	        	$('.carGrade').append('<option>등급</option>');
	        	for (var count = 0; count < list.length; count++){
	            	$('.carGrade').append('<option>' + list[count].grade1 + '</option>');
	            }	// end of for문 
	        },	// success
	        error : function(err){console.log(err)}  // 실패했을때
	    });  
	});
	
	// 등급 -> 세부등급
	$("#carGrade").change(function() {
	
		$("#title").val("");
		
		var brand = $("#carBrand").val();
		var model = $("#carModel").val();
		var detailModel = $("#carDetailModel").val();
		
		if (detailModel.indexOf('(') != -1) {
			var startIndex = detailModel.indexOf('(')
			var rslt = detailModel.substring(0, startIndex)
			detailModel = rslt
		}
		
		var grade = $("#carGrade").val();
		
		var beforeTitle = brand + " " + model + " " + detailModel;
		var result = beforeTitle + " " + grade;
		
		$("#title").val(result);
		
		$.ajax({
			type : 'post',
	        async : true,
	        url : '../user/detailgrade.do',
	        beforeSend : function(xhr)
	        {   
	        	xhr.setRequestHeader(header, token);
	        },
	        contentType: "application/x-www-form-urlencoded;charset=utf-8",      // 한글처리
	        dataType : 'json',
	        data : {"jejosa" : $('.carBrand').val(), 
	        		"model" : $('.carModel').val(),
	        		"detail" : $('.carDetailModel').val(),
	        		"grade1" : $('.carGrade').val()},
	        success: function(list){
	        	$('.carDetailGrade').children().remove();
	        	$('.carDetailGrade').append('<option>세부등급</option>');
	        	for (var count = 0; count < list.length; count++){
	            	$('.carDetailGrade').append('<option>' + list[count].grade2 + '</option>');
	            }	// end of for문 
	        },	// success
	        error : function(err){console.log(err)}  // 실패했을때
		});  
	})
	
	
	
	/////////////////////////////////////////////////////////
	// 등록하기 버튼
	$(document).on("click","#enrollCar",function(){
		
		if (confirm("등록하시겠습니까?")) {
			var arr_options = document.getElementsByName("option");
			var result = "";
			var chk;
			for (var i = 1; i <= arr_options.length; i++) {
			
				// '/' 추가 (14, 31, 49, 66, 78)
				if (i == 15 || i == 32 || i == 50 || i == 67) {
					result = result + "/"
				}
				
				if ( $("#options_" + i).is(":checked")  ) {
					chk = "1"
				} else {
					chk = "0"
				}
				result = result + chk;
			}
			
			console.log('result : ', result);
			
			// hidden에 대입 
			$("#strOption").val(result);
			
			$('#salesForm').submit();
        }
	});		// end of 등록하기 버튼
	
	
	// 수정하기 버튼 클릭 이벤트
	$('.modifyBtn').click(function(){
		$('.salesDetailForm').submit(function(){
			//
		});
	});	// end of 수정하기 버튼 
	
})	// end of 전체 function()
