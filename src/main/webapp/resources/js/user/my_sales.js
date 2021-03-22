/**
 * 작성자 문희주
 * 내 판매 목록
 
 날자/ 태그/ 검색어/ 페이징 등
 이벤트 마다 데이터를 받는 방식
 
 */
 
$(function(){
 
 //글로벌 변수 선언
 
 	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";

	var pageNow = 1;
	var totalpage = $('#totalpage').val();
	var perBlock =5;
	
	//날짜

	var startDate = $('#startDate')
	var endDate = $('#endDate')
	
	var btnSearch = $('#btnSearch')
	var byTitle = $('#byTitle')
	
//status
	var status = '';

	
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
 
 
 //파라미터 받아오는 함수
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
$(document).on('click','#datepickerReset',function(){
startDate.val("");
endDate.val("");
search();
})


//검색 리셋 버튼
$('#resetSearch').on('click', function(){
byTitle.val("");
})

//날짜, 제목검색 검색 버튼
$(document).on('click','#btnSearch',function(){
search();
})

//검색창 엔터
$(document).on('keydown',byTitle,function(key){
if (key.keyCode == 13) {
search();
}
});





//상태 클래스 toggle
 window.statusOn = function(obj) {
  $(obj).toggleClass( 'on' );
   search();
}


//페이지 숫자 클릭
$(document).on('click','.page-num',function(){
pageNow=$(this).text();
search();
})


//페이지 << 클릭
$(document).on('click','.gofirst',function(){
pageNow=1;
   search();
})


//페이지 < 클릭
$(document).on('click','.goprev',function(){
if(pageNow != 1){
pageNow=pageNow-1;
}
   search();
})

//페이지 >>클릭
$(document).on('click','.goend',function(){
pageNow= totalpage;
   search();
})


//페이지 > 클릭
$(document).on('click','.gonext',function(){
if(pageNow != totalpage){
pageNow=pageNow+1;
}
  search();
})






var search = function(){


//mapper에 보낼 pageNow(처음 페이지 , 0부터 시작)
let start = (pageNow-1)*10;


//날짜 빈칸 처리
if(startDate.val()==''){
startDate.val("1990-01-01")
}
if(endDate.val()==''){
var today = getTimeStamp();
endDate.val(today)
}


//status 클래스 상태에 따라서 쿼리문에 보낼 string 만들기
status='';

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


}//end of else

//데이터 보내서 검색결과에 맞는 ajax 페이지 구성 후 본페이지에 합성

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
	 			"byTitle" : byTitle.val(),
	 			"start" : start,
	 			"cnt" : $('#totalcnt').val()
	 	
	 	
	 	},				
	 	success : function(result){
		
	 	var html = jQuery('<div>').html(result);
			$( '#indexListAjax' ).html(html);
			
			
//검색 결과에 따라서 페이지 조건 바꾸기
			
	$.ajax({
		type : 'post',
		async : true,
		url : '../user/my_sales_page.do',
		beforeSend : function(xhr)
		{	
			xhr.setRequestHeader(header, token);
		},
		contentType: "application/x-www-form-urlencoded;charset=utf-8",
			 	data : {"startDate" : startDate.val(),
	 			"endDate": endDate.val(),
	 			"status" : status,
	 			"byTitle" : byTitle.val(),
	 			"start" : start,
	 			"cnt" : $('#totalcnt').val()
	 	
	 	},		
		
	 	success : function(result){
	 	
		totalpage = parseInt(result);
		pageNow = parseInt(pageNow);
		
		let block = parseInt((pageNow+perBlock-1)/perBlock);
		
		let startPage = block;
		let endPage = block+perBlock-1;

		//인덱스 페이지 바꾸기		
		$('ul.page_number li').remove();		
		for (i = startPage; i <= endPage ; i++) {
		$('ul.pagination.page_number').append('<li class="page-item"><a class="page-link page-num">'+i+'</a> </li>')
		}
	 }, 	
	 	
	error:function(request, status, error){
		console.log(err);
		}	 	
	 }) 
	 	},	 	
	 	error : function(err){
	 		console.log(err);
	 	}	 	
	 }) 

}




 })//end of function