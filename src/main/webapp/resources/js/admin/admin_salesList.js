/**
 * 작성자 문희주
 * 관리자 판매글 목록
 */
 
$(function(){
 
 	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";


	
	//날짜

	var startDate = $('#startDate')
	var endDate = $('#endDate')
	
	var searchStatus = $('#searchStatus')
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

/* 오늘 날짜를 문자열로 반환 */
function today() {
  var d = new Date()
  return getDateStr(d)
}

/* 오늘로부터 1주일전 날짜 반환 */
function lastWeek() {
  var d = new Date()
  var dayOfMonth = d.getDate()
  d.setDate(dayOfMonth - 7)
  return getDateStr(d)
}

/* 오늘로부터 1개월전 날짜 반환 */
function lastMonth() {
  var d = new Date()
  var monthOfYear = d.getMonth()
  d.setMonth(monthOfYear - 1)
  return getDateStr(d)
}
$(".srch_area :radio").click(function(){
  var rname = $(this).attr("name")
  $("#search_end_date").val(today())
	if( rname == "today"){
    $("#search_start_date").val(today())
  }else if(rname == "week") {
  	$("#search_start_date").val(lastWeek())
  }else{
  	$("#search_start_date").val(lastMonth())
  }
})
 


//현재 url 파싱
function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }



//날짜 검색 버튼
$('#searchDates').on('click', function(){
search();
})

//상태 샐랙트 시
searchStatus.on('change', function(){
search();
})




var search = function(){



	$.ajax({
		type : 'post',
		async : true,
		url : '../admin/salesList_ajax.do',
		beforeSend : function(xhr)
		{	
			xhr.setRequestHeader(header, token);
		},
		contentType: "application/x-www-form-urlencoded;charset=utf-8",
		dataType : 'html',
	 	data : {"startDate" : startDate.val(),
	 			"endDate": endDate.val(),
	 			"status" : searchStatus.val(),
	 			"byTitle" : byTitle.val()
	 	
	 	},
	 	success : function(result){
	 	
	 	location.href="salesList.do?startDate="+startDate.val()+"&endDate="+endDate.val()+"&status="+searchStatus.val()+"&byTitle="+byTitle.val();
	 	
	 	
	 	},
	 	
	 	
    error:function(data, status, opt)
    {
        alert("code:"+data.status+"\n"+"message:"+data.responseText+"\n"+"error:"+opt);
	 		
	 	}
	 	
	 }) 
	 
	 
	 
	 
}






 })//end of function