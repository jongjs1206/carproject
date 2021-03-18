/**
 * 작성자 문희주
 * 내 판매 목록
 */
 
$(function(){
 
 	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";


	
	//날짜

	var startDate = $('#startDate')
	var endDate = $('#endDate')
	
	var btnSearch = $('#btnSearch')
	var byTitle = $('#byTitle')

	
 //날짜 함수(yyyy-mm-dd 형식)
function getTimeStamp() {
    var d = new Date();
    var s =
        leadingZeros(d.getFullYear(), 4) + '-' +
        leadingZeros(d.getMonth() + 1, 2) + '-' +
        leadingZeros(d.getDate(), 2);
    return s;
}

function leadingZeros(n, digits) {
    var zero = '';
    n = n.toString();

    if (n.length < digits) {
        for (i = 0; i < digits - n.length; i++)
            zero += '0';
    }
    return zero + n;
}
 
function getDateStr(myDate){
	return (myDate.getFullYear() + '-' + (myDate.getMonth() + 1) + '-' + myDate.getDate())
}


function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}



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




//날짜 빈칸 처리
if(startDate.val()==''){
startDate.val("1990-01-01")
}
if(endDate.val()==''){
var today = getTimeStamp();
endDate.val(today)
}


//status 클래스 상태에 따라서 쿼리문에 보낼 string 만들기
var status = '';


//status 모두 클래스가 없을때 (선택x) 모두 선택된 것 처럼 보이기
if($("a.on").length == 0 ){

$('#statusBtn > a').each(function(){
status = status +','+ $(this).text()
 })

//그 외의 경우에는 선택된 클래스의 text만 보내기
}else{
$("a.on").each(function(){
status = status +','+ $(this).text()
 })
}



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