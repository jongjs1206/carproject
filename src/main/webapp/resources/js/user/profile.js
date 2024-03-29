/**
 * 작성자 문희주
 * 내 정보 수정
 */
 
 
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
	
	
	

	
	
//프로필 사진 로컬경로 통해 미리보기


$("#picFile").on('change', function(){
    readURL(this);
});


function readURL(input) {
    if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function (e) {
          $('#preImg').prop('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]);
    }

}




//프로필 사진 수정

$("#btnPic").on('click', function(){
	if($("#picFile").val()){
	$('#picForm').submit();
	alert("프로필 사진이 변경 되었습니다.")
}else{
alert("새 프로필 사진을 등록하세요.")
}
 })
 



//성별 체크
$('#gender_m').click(function(){

	$('#gender_w').removeClass('genderOn');
	$('#gender_m').addClass('genderOn');
})

$('#gender_w').click(function(){
	$('#gender_m').removeClass('genderOn');
	$('#gender_w').addClass('genderOn');
})




		
//메일 인증번호 보내기
$('#btnMailSend').click(function(){

	var email = email1.val()+'@'+email2.val()


	alert(email+' \n 인증번호가 발송 되었습니다  \n 이메일을 확인 해 주세요.')
		//인증번호칸 보이기
	$('#confirmNumDiv').show();	
	$('#btnMailSend').hide();


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
	 		
	 		if(confirm('정말 탈퇴하시겠습니까?')){
	 		
	 		alert("탈퇴되었습니다.")
	 		
	 		location.href="memberOut.do";
	 		
	 		}
	 		
	 		}else{
	 		alert(result);
	 		}
	 	},
	 	
	 	error : function(err){
	 		console.log(err);
	 	}
	 })  

})//end of certNumChk




//수정 버튼 클릭 시

$(document).on("click","#modifyBtn",function(){

if($("#gender_m").hasClass("genderOn") == true) {
	gender.val("남")
}
if($("#gender_w").hasClass("genderOn") == true) {
	gender.val("여")
}

//이름, 성별, 생년월일, 이메일, 폰번호
	if(gender.val() == ''){
	alert("성별을 선택해 주세요.")
	return
	}
	else if(m_name.val() == ''){
	alert("이름을 입력해 주세요.")
	return
	}else if(birth.val() == ''){
	alert("생일을 입력해 주세요.")
	return
	}else if(tel.val() == ''){
	alert("휴대폰 번호를 입력해 주세요.")
	return
	}else{
	$('#modify').submit()
	}



});

}); //end of function




