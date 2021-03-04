$(function() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";

	// 제조사 -> 모델
	 $(document).on("click",".carBrand", function(){
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
            data : {"carBrand" : $('.carBrand').val()},
            success: function(list){
               for (var count = 0; count < list.length; count++){
                  $('#carModel').append('<option>' + list[count].model + '</option>');
               }
              },
            error : function(err){console.log(err)}  // 실패했을때
         });      // end of 제조사
		
	});
	
	
	
	
	
	//
	$('.updateBtn').click(function(){		
		$('.salesForm').submit(function(){
			// 제목
			var title = $(".salesTitle").val();
			// 판매자 정보
			var name = $('#name').val();
			var id = $('#id').val();
			var tel = $('#tel').val();
			
			// 차량정보
			var carNumber = $('.carNumber').val();
			var carBrand = $('.carBrand').val();
			var carModel = $('.carModel').val();
			var carDetailModel = $('.carDetailModel').val();
			var carGrade = $('.carGrade').val();
			var carDetailGrade = $('.carDetailGrade').val();
			
			var carYear = $('.carYear').val();
			var carColor = $('.carColor').val();
			var km = $('.km').val();
			var cc = $('.cc').val();
			var accident = $('.accident').val();
			var salesPrice = $('.salesPrice').val();
			var carGear = $('.carGear').val();
			var carFuel = $('.carFuel').val();
			var checkOption = $('.checkOption').val();
			
			var salesContext = $('.salesContext').val();
		});
	});
	
	
})

