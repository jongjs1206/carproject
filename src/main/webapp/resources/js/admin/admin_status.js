/**
 * 작성자 문희주
 * 상태 팝업
 */
 
$(function(){
 
 	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	


window.showStatus = function(obj) {

	url = 'member_status.do?id='+$(obj).attr("id");
	alias = $(obj).attr("id");
	option = 'width=700, height=700, toolbar=no, scrollbars=no, left=200, top=100';
	window.open(url, alias, option);
	
}

/*
$('#confirm').click(function(){

$('#adminStatus_form').submit();

location.href='updateUserEtc.do'+$(obj).attr("id");


})
*/

 })//end of function