$(function() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";

	
	////////////////////////////////////////////////////// 제조사 -> 모델 
	$("#carBrand").change(function() {
		
		var brand = $("#carBrand").val();
		$("#title").val(brand);	// 글 제목에 제조사 들어감 
		
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
	
	////////////////////////////////////////////////////// 모델 -> 세부모델
	$("#carModel").change(function() {

		$("#title").val("");
		
		var model = $("#carModel").val();
		$("#title").val($("#carBrand").val() + " " + model);	// 제목에 제조사 + 모델명
		
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
	
	////////////////////////////////////////////////////// 세부 모델 -> 등급
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
	    
	    // 모델 - 세부모델 중복 문자 제거
		dm0 = rslt.split(" ")[0];	// 띄어쓰기 기준 앞
		dm1 = rslt.split(" ")[1];	// 띄어쓰기 기준 뒤
		dm2 = rslt.split(" ")[2];	
		
		if(dm2 != "undefined"){
			if( model == dm0 ) {
				result = beforeTitle + " " + dm1;
			} else if ( model != dm0 ) {
				result = beforeTitle + " " + dm0;
			}
		}
		
		$("#title").val(result);
	    
	    //alert(result);
	});
	
	////////////////////////////////////////////////////// 등급 -> 세부등급
	$("#carGrade").change(function() {
	
		$("#title").val("");
		
		var brand = $("#carBrand").val();
		var model = $("#carModel").val();
		var detailModel = $("#carDetailModel").val();
		
		if (detailModel.indexOf('(') != -1) {		// 세부등급에 들어가는 괄호 내용 제거
			var startIndex = detailModel.indexOf('(')
			var rslt = detailModel.substring(0, startIndex)
			detailModel = rslt
		}
		
		dm0 = rslt.split(" ")[0];	// 띄어쓰기 기준 앞 / rslt : detailModel값
		dm1 = rslt.split(" ")[1];	// 띄어쓰기 기준 뒤
		
		var grade = $("#carGrade").val();
		
		var beforeTitle = brand + " ";
		
		if( model == dm0 ) {
			result = beforeTitle + model + " " + dm1 + " " + grade;
		} else if ( model != dm0 ) {
			result = beforeTitle + model + " " + detailModel + " " + grade;
		}
		
		$("#title").val(result);
		
		//alert(result);
		
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
	            }	// end of for문 
	        },	// end of success
	        error : function(err){console.log(err)}  // 실패했을때
		});  // end of ajax()
	}) // end of 세부등급 선택
	
	
	////////////////////////////////////////////////////// g_id값, 세부등급 선택했을 때
	$('#carDetailGrade').change(function(){
	
		$("#title").val("");
		
		var brand = $("#carBrand").val();
		var model = $("#carModel").val();
		var detailModel = $("#carDetailModel").val();
		var grade = $("#carGrade").val();
		var detailGrade = $("#carDetailGrade").val();
		
		if (detailModel.indexOf('(') != -1 && detailGrade.indexOf('(') != -1) {		// 세부등급, 세부모델에 들어가는 괄호 내용 제거
			var startIndex1 = detailModel.indexOf('(')		// 세부모델
			var startIndex2 = detailGrade.indexOf('(')		// 세부등급
			var rslt1 = detailModel.substring(0, startIndex1)	// 세부모델
			var rslt2 = detailGrade.substring(0, startIndex2)	// 세부등급
			detailModel = rslt1		// 세부모델
			detailGrade = rslt2		// 세부등급
			result = beforeTitle + " " + rslt1 + " " + rslt2
		} else {
			result = beforeTitle + " " + detailModel
		}
		
		dm0 = rslt1.split(" ")[0];	// 띄어쓰기 기준 앞 / rslt1 : detailModel값
		dm1 = rslt1.split(" ")[1];	// 띄어쓰기 기준 뒤
		
		var beforeTitle = brand + " ";
		//var result = beforeTitle + " " + detailGrade;
		
		if( model == dm0 ) {
			result = beforeTitle + model + " " + dm1 + " " + grade + " " + detailGrade;
		} else if ( model != dm0 ) {
			result = beforeTitle + model + " " + detailModel + " " + grade + " " + detailGrade;
		}
		
		$("#title").val(result);
	
		var g_id = $('#carDetailGrade option:selected').attr('id');		// 선택한 세부모델의 g_id값
		//console.log(g_id);
		$('#selectId').val(g_id);
	});
	
	
	/////////////////////////////////////////////////////////
	// 이미지 미리보기 <- 판매글 => 최대 6개까지
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
	
	
	//////////////////////////////////////////////////////
	// 이미지 & 썸네일 <= 썸네일을 클릭했을 때 대표이미지가 바뀜
	window.imgClick = function(obj) {
		// 썸네일 클릭할 때 border 부여
		//$('.thumbnail > img').css({'border':'3px solid #dca73a'});
				
		var addr = $(obj).attr('src');		// 이미지 주소값
		$('#carimg').attr('src', addr);	
		//addr.style.border = "3px solid #dca73a";
	}
	
	
	//////////////////////////////////////////////////////
	// 등록하기 버튼
	$(document).on("click", "#enrollCar", function(){
	
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
			// end of 체크옵션
			
			$('#salesForm').submit();

        }	// end of if
	});		// end of 등록하기 버튼
	
	
	// 수정하기 버튼 => 상세페이지!!!!!!!!!!!!!!!!에 있는 버튼
	$(document).on("click", "#modifyCar", function(){
		next_url = '../user/salesModify.do?num=' + $('#sell_id').val();		// 상세페이지에 있는 수정하기 버튼을 눌렀을 때 타고갈 다음 url
		window.location.href = next_url;
	});
	
	// 수정하기 버튼 => 수정 페이지!!!!!!!!!!!!!!!!!!!!!!!!!!에서 내 판매글로 이동
	$(document).on("click", "#modifyEnroll", function(){
	
		//alert($('#sell_id').val());
		
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
	
	if (confirm("수정하시겠습니까?")) {	
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
			// end of 체크옵션
			
			$('#updateForm').submit();

        }	// end of if
	});		// end of 수정하기 버튼
	
	
	// 삭제하기 => 내 판매글로 넘어감
	$(document).on("click", "#deleteCar", function(){
		var delConfirm = confirm('삭제하시겠습니까?');
		 
		if (delConfirm) {
     		alert('삭제되었습니다.');
   		}
   		else {
      		alert('삭제가 취소되었습니다.');
   		}
   		//alert($('#sell_id').val());
   		url = '../user/deleteSales.do?num=' + $('#sell_id').val();		// 상세페이지에 있는 수정하기 버튼을 눌렀을 때 타고갈 다음 url
		window.location.href = url;
   		
	});	// end of 삭제
	
})	// end of 전체 function()
