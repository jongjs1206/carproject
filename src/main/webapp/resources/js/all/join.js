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
	
	
//아이디 체크

var checkId = function(id) {
		if(id == ''){
			alert("아이디를 입력해주세요.");
			return false;
		}
			if (id.search(/\s/) != -1) {
			alert("아이디는 빈칸을 포함 할 수 없습니다.");
			return false;
		}
		if (specialCheck.test(id)){
			alert("아이디는 특수문자를 포함 할 수 없습니다.");
			return false;
		}
		if (korCheck.test(id)){
			alert("아이디는 한글을 포함 할 수 없습니다.");
			return false;
		}
	//$("#m_id").prop('readonly', true);
	//$('#m_id').addClass('readOnly');
	return true;
}

//비밀번호 체크
var checkPw = function(pw, pwConfirm) {

		if(pw == ''){
			alert("비밀번호를 입력해주세요.");
			m_pw.focus();
			return false;
		}
		if (!passRule.test(pw)){
			alert("비밀번호는 영문자, 특수문자, 숫자 포함 형태의 6~20자리 이내로 설정하셔야 합니다.");
			return false;
		}		
		
		if(pwConfirm == ''){
			alert("비밀번호 확인을 입력해주세요.");
			m_pwConfirm.focus();
			return false;
		}
		
		
		if(pw != pwConfirm){
			alert("비밀번호가 일치하지 않습니다.");
			m_pwConfirm.val('');
			m_pwConfirm.focus();
			return false;
		}
		
		return true;
}

//이름 빈칸 체크
var checkName = function(name) {
	if(name == ''){
		alert("이름(닉네임)을 입력해주세요.");
		m_name.focus();
		return false;
	}
	return true;
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
	if(gender == ''){
		alert("성별을 선택해주세요.");
		return false;
	}
	return true;
}



//이메일 체크

var checkEmail = function(email1, email2) {
		if(email1 == '' || email2 == ''){
			alert("이메일을 입력해주세요.");
			return false;
		}
	email.val(email1+'@'+email2)
	//$("#email1").prop('readonly', true);
	//$("#email2").prop('readonly', true);
	//$("#email1").prop('readonly', true);
	//$("#email2").prop('readonly', true);
	return true;
}








//아이디 중복 확인 클릭 시
$('#btnIdDuplChk').click(function() {
	checkId(m_id.val());

		});

//이메일 중복확인 클릭 시
$('#btnEmailDuplChk').click(function() {
	checkEmail($('#email1').val(),$('#email2').val());
		});






$('#joinDiv').click(function() {

	if(checkId(m_id.val()) && checkPw(m_pw.val(), m_pwConfirm.val())
	&& checkName(m_name.val() && checkGender(gender.val()))
	){
		$('#join').submit();
	}


//$('#join').submit();




});
		

















$('#joinDiv').click(function() {

			
			if(birth.val() == ''){
				$('#info').text("생일 선택해주세요.");
				return;
				
			
			if(email.val() == ''){
				$('#info').text("이메일을 입력해주세요.");
				email.focus();
				return;
			}
			if (!emailRule.test(email.val())){
				$('#info').text("이메일 형식이 아닙니다.");
				return;
			}
			
			}
			

		//중복확인	
		$.ajax({
	 	type : 'post',
	 	
	 	async : true, //비동기 통신
	 	
	 	url : 'check.do', //*****요청(request) jsp는x mvc안타겠다는 얘기
	 	
	 	contentType : 'application/x-www-form-urlencoded;charset=utf-8', //한글처리
	 	
	 	data : {'m_name' : $('#m_name').val(),
	 				'email' : $('#email').val(),
	 				'm_id' : $('#m_id').val(),
	 				'pass' : $('#pass').val(),
	 				'birth' : $('#birth').val(),
	 				'gender' : $('#gender').val()
	 	},
	 	
	 	success : function(result){
	 		$('#info').text(result);
	 		if(result=='성공'){
	 		//$('#join').submit();
	 		}
	 	},
	 	
	 	error : function(err){
	 		console.log(err);
	 	}
	 	
	 })        
		 
		
		
		
		});
	});