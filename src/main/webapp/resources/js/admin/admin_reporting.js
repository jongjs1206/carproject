/**
 * 작성자 문희주
 * 신고
 */
 
$(function(){
 
 	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";




window.showReport = function(obj) {
	url = 'reporting.do?num='+$(obj).attr("id");
	alias = $(obj).attr("id");
	option = 'toolbar=no,directory=no,status=no,menubar=no,scrollbars=no,resizeable=yes,copyhistory=no, width=400, height=750, left=0, top=0';
	window.open(url, alias, option);
	
}

$('#exit').click(function(){

window.close();

})


$('#reportingCheckBtn').click(function(){

var chk_arr = [];

$("input[name=chkbox]:checked").each(function(){
	var chk = $(this).parent('td').next().text();
    chk_arr.push(chk);
    
    //$(this).parents( 'tr' ).addClass('gray');
    
    location.href = "de_ok.do?chk="+chk_arr;

})

})






 })//end of function