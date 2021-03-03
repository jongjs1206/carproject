$(function() {

	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";

	var m_id = $('#m_id');
	var m_pw = $('#m_pw');
	var m_pwConfirm = $('#m_pwConfirm');			
	var m_name = $('#m_name');
	var gender = $('#gender');
	
	var email1 = $('#email1');
	var email2 = $('#email2');
	
	
	var birth = $('#birth');
	var tel = $('#tel');
	var w_date = $('#w_date');
	
	var idPassCheck= false;
	var pwPassCheck = false;
	var joinPassCheck = false;
	var emailPassCheck = false;
	
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







//아이디 유효성 체크
checkId = function(m_id) {
	idPassCheck = false;
	joinPassCheck=false;
	if(m_id == ''){
		m_id.focus();
		return "아이디를 입력하세요.";
	}else if (m_id.search(/\s/) != -1) {
		return "아이디는 빈칸을 포함 할 수 없습니다.";
	}else if(getTextLength(m_id)>20){
		return "아이디는 영문 및 숫자 2~20자 입니다.";
	}else if (specialCheck.test(m_id)){
		return "아이디는 특수문자를 포함 할 수 없습니다.";
	}else if (korCheck.test(m_id)){
		return "아이디는 한글을 포함 할 수 없습니다.";
	}else{
		idPassCheck = true;
		return"형식에 맞는 아이디 입니다."

		
	}
}

m_id.on('keyup', function(){
	result = checkId(m_id.val())
	$('#info').text(result);
});





//비밀번호 유효성 체크

var checkPw = function(m_pw, m_pwConfirm) {
pwPassCheck = false;

	if(m_pw == ''){
		$('#m_pw').focus();
		return "비밀번호를 입력해주세요.";
	}else if (!passRule.test(m_pw)){
		return "비밀번호는 영문자, 특수문자, 숫자 포함 형태의 8~15자리 이내로 설정하셔야 합니다.";
	}else if(m_pwConfirm == ''){
		$('#m_pwConfirm').focus();
		return "비밀번호 확인을 입력해주세요.";
	}else if(m_pw != m_pwConfirm){
		return "비밀번호가 일치하지 않습니다.";
	}else{
		pwPassCheck = true;
		return "비밀번호가 일치 입니다.";
	}

}

m_pw.on('change', function(){
	result = checkPw(m_pw.val(), m_pwConfirm.val())
	$('#infoPw').text(result);

});
m_pwConfirm.on('change', function(){
	result = checkPw(m_pw.val(), m_pwConfirm.val())
	$('#infoPw').text(result);
});





//아이디 중복 확인 클릭 시
$('#btnIdDuplChk').click(function() {

if(idPassCheck){

//유효성 체크 통과 시, 중복 체크
	$.ajax({
		type : 'post',
		async : true,
		url : '../all/idCheck.do',
		beforeSend : function(xhr)
		{	
			xhr.setRequestHeader(header, token);
		},
		contentType: "application/x-www-form-urlencoded;charset=utf-8",
	 	
	 	data : {'m_id' : $('#m_id').val()
	 				
	 	},
	 	
	 	success : function(result){
	 		
	 		if(result=='성공'){
	 		alert("사용하실 수 있는 아이디 입니다.");
	 		joinPassCheck=true;
	 	
	 		}else{
	 		alert("이미 존재하는 아이디입니다.");
	 		joinPassCheck=false;
	 		}
	 	},
	 	
	 	error : function(err){
	 		console.log(err);
	 	}
	 	
	 })        
		 
	}//end of if
	else{
	alert("아이디가 올바른 형식이 아닙니다.")
	}	 
		
		});
		
		

		
		
//메일 인증번호 보내기
$('#btnMailSend').click(function(){

	var email = email1.val()+'@'+email2.val()

	if(email1.val()=='' || email2.val()==''){
	alert('이메일을 입력 해 주세요.')
	}else{
	
	alert(email+' \n 인증번호가 발송 되었습니다  \n 이메일을 확인 해 주세요.')
		//인증번호칸 보이기
	$('#confirmNumDiv').show();	


	$.ajax({
		type : 'post',
		async : true,
		url : '../all/mailCheck.do',
		beforeSend : function(xhr)
		{	
			xhr.setRequestHeader(header, token);
		},
		contentType: "application/x-www-form-urlencoded;charset=utf-8",
	 	
	 	data : {'email' :  email
	 			
	 	},
	 	
	 	success : function(result){
			

	 	},
	 	
	 	error : function(err){
	 		console.log(err);
	 	}
	 	
	 })  
}//end of else

})//end of MailSender


		
//메일 인증번호 확인
$('#certNumChk').click(function(){

//유효성 체크 통과 시, 중복 체크
	$.ajax({
		type : 'post',
		async : true,
		url : '../all/certNumChk.do',
		beforeSend : function(xhr)
		{	
			xhr.setRequestHeader(header, token);
		},
		contentType: "application/x-www-form-urlencoded;charset=utf-8",
	 	
	 	data : {'certCode' : $('#certCode').val()
	 			
	 	},
	 	
	 	success : function(result){
	 		if(result=='인증'){
	 		alert('이메일 인증에 성공하셨습니다');
	 		emailPassCheck=true;
	 		
	 		//이메일칸 readonly
	 		$("#email1").attr("readonly",true);
	 		$("#email2").attr("readonly",true);
	 		
	 		}else{
	 		alert(result);
	 		emailPassCheck=false;
	 		}
	 	},
	 	
	 	error : function(err){
	 		console.log(err);
	 	}
	 })  

})//end of certNumChk






//회원가입 버튼 클릭 시
$(document).on("click","#joinDiv",function(){

//id
	if(!joinPassCheck){
	alert("아이디를 확인해 주세요.")
	return
	}
	
//pw
	else if(!pwPassCheck){
	alert("비밀번호를 확인해 주세요.")
	return
	}
//이름, 성별, 생년월일, 이메일
	else if(gender.val() == ''){
	alert("성별을 선택해 주세요.")
	return
	}
	else if(m_name.val() == ''){
	alert("이름을 입력해 주세요.")
	return
	}else if(birth.val() == ''){
	alert("생일을 입력해 주세요.")
	return
	}else if(!emailPassCheck){
	alert("이메일을 인증해 주세요.")
	return
//이메일 인증
	}else if(!emailPassCheck){
	alert("이메일을 인증해 주세요.")
	}	else{
	$('#join').submit()
	
	}



});

}); //end of function




