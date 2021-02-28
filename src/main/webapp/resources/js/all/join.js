$(function() {


	var m_id = $('#m_id');
	var m_pw = $('#m_pw');
	var m_pwConfirm = $('#m_pwConfirm');			
	var m_name = $('#m_name');
	var gender = $('#gender');
	var email = $('#email');
	var birth = $('#birth');
	var tel = $('#tel');
	var w_date = $('#w_date');
	
	var joinPassCheck = false;
	var infoMessage = "";
	
	var Length = 0; 
	var engCheck = /[a-z]/; 
	var korCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var numCheck = /[0-9]/; 
	var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	var emailRule	 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var passRule = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;


	//escape 16진수로 바꿔줌 한글은 길이6
	//바이트 구하는 함수
	var getTextLength = function(str) {
    var len = 0;
    for (var i = 0; i < str.length; i++) {
    if (escape(str.charAt(i)).length == 6) {
   	 len++;
      }
 	  	len++;
   	 }
    return len;
	}
	


//성별 체크
$('#gender_m').click(function(){

	$('#gender_w').removeClass('genderOn');
	$('#gender_m').addClass('genderOn');
	gender.val($('#gender_m').val())
})

$('#gender_w').click(function(){
	$('#gender_m').removeClass('genderOn');
	$('#gender_w').addClass('genderOn');
	gender.val($('#gender_w').val())
})

var checkGender = function(gender) {

	joinPassCheck = false;
	
	if(gender == ''){
		alert("성별을 선택해주세요.");
	}else{
	joinPassCheck = true;
	}
}


//아이디 체크
var checkId = function(id) {

		joinPassCheck = false;
		
		if(id == ''){
			infoMessage = "아이디를 입력해주세요.";
		}else if(id.search(/\s/) != -1) {
			infoMessage = "아이디는 빈칸을 포함 할 수 없습니다.";
		}else if(specialCheck.test(id)){
			infoMessage = "아이디는 특수문자를 포함 할 수 없습니다.";
		}else if(korCheck.test(id)){
			infoMessage = "아이디는 한글을 포함 할 수 없습니다.";
		}else{
			joinPassCheck = true;
		}

}


//아이디 중복 확인 클릭 시
$('#btnIdDuplChk').click(function() {

//id 유효성 체크
	checkId(m_id.val());
	
	if(!joinPassCheck){
	alert(infoMessage)
	}
	
/*
//유효성 체크 통과 시, 중복 체크
	else{
	
	$.ajax({
 	type : 'post',
 	
 	async : true, //비동기 통신
 	
 	url : 'checkId.do', //*****요청(request) jsp는x mvc안타겠다는 얘기
 	
 	contentType : 'application/x-www-form-urlencoded;charset=utf-8', //한글처리
 	
 	data : {'m_id' : $('#m_id').val()
 	},

 	
 	success : function(result){
		infoMessage = result;
		if(result="이미 존재하는 아이디 입니다."){
		joinPassCheck = false;
		}
		alert(infoMessage);
 	},
 	
 	error : function(x, e) {
                  if (x.status == 0) {
                    alert('You are offline!!n Please Check Your Network.');
                  } else if (x.status == 404) {
                    alert('Requested URL not found.');
                  } else if (x.status == 500) {
                    alert('Internel Server Error.');
                  } else if (e == 'parsererror') {
                    alert('Error.nParsing JSON Request failed.');
                  } else if (e == 'timeout') {
                    alert('Request Time out.');
                  } else {
                    alert('Unknow Error.n' + x.responseText);
                  }
                }
 	
 });
 

	
	}
*/

		});


//회원가입 버튼 클릭 시
$('#joinDiv').click(function() {


	$('#join').submit();
			


});


}); //end of function