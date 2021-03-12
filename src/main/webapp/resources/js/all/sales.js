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
	            	$('.carDetailGrade').append('<option id=' + list[count].g_id + '>' + list[count].grade2 + '</option>');
	            	//console.log(list[count].g_id);
	            }	// end of for문 
	        },	// end of success
	        error : function(err){console.log(err)}  // 실패했을때
		});  // end of ajax()
	}) // end of 세부등급 선택
	
	
	//////////// g_id값
	$('#carDetailGrade').on('change', function(){
		//alert($(this).val());
		var g_id = $('#carDetailGrade option:selected').attr('id');	// 선택한 세부모델의 g_id값
		console.log(g_id);
		$('#selectId').val(g_id);
	});
	
	////////////////////////////////////////////////////////////////////////////////

	

	
	
	
	////////////////////////////////////////////////////////////////////////////////
	
	/////////////////////////////////////////////////////////
	// 이미지 미리보기 <- 판매글 =>
	
	$("#picFile").on('change', function(){
	    readURL(this);
	});

	var sel_files = [];
	function readURL(input) {

	    	var files = input.files;			// 업로드 되는 사진파일
    		if (input.files.length >= 7) {		// 최대 6장까지만 업로드 시킴 
    			alert('사진은 6장까지만 첨부할 수 있습니다.');
    			$("#phototo").text("");
    			$("#photo").show();
	    		return; 
    		}
    		
	    	var filesArr = Array.prototype.slice.call(files);	// 사진 파일을 리스트 안에 각각 담음??? 몰겠음. 	    	
	    	
	    	$("#photo").hide();				// 주황색 사진 이미지를 감춤
	    	
	    	var allhtml = '';					// 미리보기로 표시될 변수를 초기화 ("파일선택"버튼을 다시 눌렀을 때 초기화되도록)
	    	$("#phototo").text("");
	    
	    	// 사진 외의 파일을 업로드 하지 못하도록 막음
	    	filesArr.forEach(function(f) {
	    		if(!f.type.match("image.*")){
	    			alert("이미지 파일만 업로드 할 수 있습니다.");
	    			return;
    			}

				// 리스트에 사진 파일을 넣고 열기
    			sel_files.push(f);	  
	       		var reader = new FileReader();	       		
	       		
	       		reader.onload = function (e) {
	       			var img_html = "<img src=\"" + e.target.result + "\" width=\"50px\" height=\"50px\"/>";
					$("#phototo").append(img_html);
          		}
	       		reader.readAsDataURL(f);
	       });
	    
	}	// end of 이미지 미리보기
	

	
	/////////////////////////////////////////////////////////
	// 다중 이미지 업로드 및 미리보기
/*	var sel_files = [];
	
	$(document).ready(function(){
		$('#picFile').on("change", handleImgFileSelect);
	});
	
	function fileUploadAction(){
		console.log("fileUpload");
		$("#picFile").trigger('click');
	}
	
	function handleImgFileSelect(e) {
		// 이미지 정보들 초기화
		sel_files = [];
		$("#photo").empty();
		
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		var index = 0;
		fileArr.forEach(function(f) {
			if(!f.type.match("image.*")){
				alert("이미지 확장자만 가능합니다.");
				return;
			}
			
			sel_files.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e) {
				var html = "CONTENT";
				$(".imgs_wrap").append(html);
				index++;
			}
			reader.readAsDataURL(f);
		});
	}	// end of 다중 이미지 업로드
	*/
	
	
	
	
	/////////////////////////////////////////////////////////////////////
	// 등록하기 버튼
	$(document).on("click","#enrollCar",function(){
		
		console.log();

		// 유효성 검사 
		if ($('#phototo > img').length == 0) {
			$('#picFile').focus();
			alert("사진 등록은 필수 입력사항입니다. ");
			return 
		}else if ($('#carNumber').val() == "") {
			$('#carNumber').focus();
			alert("차량번호를 입력해주세요");
			return
		}else if ($('#carDetailGrade').val() == "세부등급") {
			$('#carDetailGrade').focus();
			alert("차종을 선택해주세요");
			return
		}else if ($('.carColor').val() == "선택") {
			$('.carColor').focus();
			alert('색상을 선택해주세요');
			return
		}else if ($('#km').val() == "") {
			$('#km').focus();
			alert('주행거리를 입력해주세요');
			return
		}else if  ($('#cc').val() == "") {
			$('#cc').focus();
			alert('배기량을 입력해주세요');
			return
		}else if  ($('#salesPrice').val() == "") {
			$('#salesPrice').focus();
			alert('판매가격을 입력해주세요');
			return
		}else if  ($('#carGear').val() == "선택") {
			$('#carGear').focus();
			alert('변속기를 선택해주세요');
			return
		}else if  ($('#carFuel').val() == "선택") {
			$('#carFuel').focus();
			alert('연료 종류를 선택해주세요');
			return
		}else if  ($('#salesContext').val() == "") {
			$('#salesContext').focus();
			alert('내용을 입력해주세요');
			return
		}
		
		
		if (confirm("등록하시겠습니까?")) {	
			// 체크옵션 부분
			var arr_options = document.getElementsByName("option");
			var result = "";
			var chk;
			for (var i = 1; i <= arr_options.length; i++) {
			
				// '/' 추가 (14, 31, 49, 66, 78)
				if (i == 15 || i == 32 || i == 50 || i == 67) {
					result = result + "/"
				}
				
				if ($("#options_" + i).is(":checked")) {
					chk = "1"
				} else {
					chk = "0"
				}
				result = result + chk;
			}	// end of for(옵션)
			
			$("#strOption").val(result);
			
			
			$('#salesForm').submit();

        }	// end of if
	});		// end of 등록하기 버튼
	
	
	// 수정하기 버튼 
	//$(document).on("click","#enrollCar",function(){
		
	//});		// end of 수정하기 버튼
	
})	// end of 전체 function()
