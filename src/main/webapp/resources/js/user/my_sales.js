/**
 * 작성자 문희주
 * 내 판매 목록
 */
 
$(function(){
 
 	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";


	
	//날짜

	var startDate = $('#datepicker1').datepicker({dateFormat: 'yy-mm-dd'});
	var endDate = $('#datepicker2').datepicker({dateFormat: 'yy-mm-dd'});
	
	var btnSearch = $('#btnSearch')
	var byTitle = $('#byTitle')



//날짜 리셋 버튼
$('#datepickerReset').on('click', function(){
startDate.val("");
endDate.val("");
search();

})

//날짜 검색 버튼
$('#datepickerBtn').on('click', function(){
search();
})

//엔터
endDate.keydown(function(key) {
if (key.keyCode == 13) {
search();
}

});

//검색 리셋 버튼
$('#resetSearch').on('click', function(){
byTitle.val("");

})

//검색 검색 버튼
$('#btnSearch').on('click', function(){
search();
})

//엔터
byTitle.keydown(function(key) {
if (key.keyCode == 13) {
search();
}

});





//상태 클래스 toggle
 window.statusOn = function(obj) {
  $(obj).toggleClass( 'on' );
  
   search();

}






var search = function(){

var status = '';

$("a.on").each(function(){

status = status +','+ $(this).text()

 })
 

	$.ajax({
		type : 'post',
		async : true,
		url : '../user/my_sales_ajax.do',
		beforeSend : function(xhr)
		{	
			xhr.setRequestHeader(header, token);
		},
		contentType: "application/x-www-form-urlencoded;charset=utf-8",
	 	dataType : 'html',
	 	data : {"startDate" : startDate.val(),
	 			"endDate": endDate.val(),
	 			"status" : status,
	 			"byTitle" : byTitle.val()
	 	
	 	},				
	 	success : function(result){

	 	var html = jQuery('<div>').html(result);
			$( '#indexListAjax' ).html(html);
	 	},
	 	
	 	
	 	error : function(err){
	 		console.log(err);
	 	}
	 	
	 }) 


	


}






 })//end of function