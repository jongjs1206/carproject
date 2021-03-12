/**
 * 작성자 문희주
 * 상태 팝업
 */
 
$(function(){
 
 	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	var stateBtn = $('#stateBtn');


	stateBtn.click(function(){
	
		url = 'member_status.do';
		alias = '회원 상태 변경';
		option = 'width=650, height=500, toolbar=no, scrollbars=no, left=200, top=100';
		window.open(url, alias, option);
	
})




 })//end of function