$(function() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	// 아이디/비밀번호 찾기 버큰 클릭시 팝업창 출력
	$('#popup_idpw').click(function(){
		url = 'find_idpw.do';
		alias = '아이디/비밀번호찾기';
		option = 'width=650, height=500, toolbar=no, scrollbars=no, left=200, top=100';
		window.open(url, alias, option);
	}) 


	// find_idpw.jsp에서 확인 버튼 클릭시 쿼리스트링을 통해 findId.do로 사용자입력값 전달
	// >>>> 이름/휴대폰번호 일치하는 id 반환
	// >>>> 입력값 누락시 경고창 출력, 페이지 전환 X
	$('#idsubmit').click(function(){		
		if ($('#m_name').val() == ''){
			alert("아이디와 휴대폰번호를 모두 입력해주세요");
		}else if($('#tel').val() == ''){
			alert("아이디와 휴대폰번호를 모두 입력해주세요");
		}else{
			id_url = 'confirm_id.do?m_name=' + $('#m_name').val() + '&tel=' + $('#tel').val();
			window.location.href=id_url;
		}
	});
	
	
	// confirm_id.jsp 에서 비밀번호 찾기로 이동
	// 비밀번호 찾기로 다이렉트 이동이 아직 안 됨 //////////////////////
	$('#go_to_find_pw').click(function(){
		window.location.href = 'find_idpw.do'
		window.onload = function(){
			document.getElementByName('tabs').reset();
			var tabs = document.getElementByName('tabs');
			for (var i=0; tabs.length; i++){
				if(tabs[i].checked){
					tabs[i].checked = false;
				}
			}
		}
	});
	
	
	// confirm_id.jsp 에서 로그인하기 클릭시 팝업창 닫고 login 페이지로 이동
	$('#back_to_login').click(function(){
		url = 'login.do';
		window.opener.location.href = url;
		window.close();
	});
	
	
	// find_idpw.jsp에서 다음 버튼 클릭시 쿼리스트링을 통해 findpw.do로 사용자입력값 전달
	// >>>> 아이디/이메일 정보 있는지 확인 후 임시비밀번호 메일 발송하며 다음 화면으로 전환
	// >>>> 입력값 누락시 경고창 출력, 페이지 전환 X
	$('#pwsubmit').click(function(){
		if ($('#m_id').val() == ''){
				alert("아이디와 이메일을 모두 입력해주세요");
			}else if($('#user_email').val() == ''){
				alert("아이디와 이메일을 모두 입력해주세요");
			}else{
				pw_url = 'confirm_pw.do?m_id=' + $('#m_id').val() + '&user_email=' + $('#user_email').val();
				window.location.href = pw_url;	
			}
	});

	// confirm_id.jsp 에서 메일로 받은 인증번호 입력 후 확인 버튼 클릭시 
	// >>>> 세션에 저장된 난수와 메일 발송된 인증번호의 일치여부 확인하며 다음 화면으로 전환
	$('#certNumChk').click(function(){
		$.ajax({
			type : 'post',
			async : true,
			url : 'check_Mail.do',
			beforeSend : function(xhr){	
				xhr.setRequestHeader(header, token);
			},
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
	 		data : {
	 			'certCode' : $('#certCode').val()
 			},
 			success : function(result){
 				console.log(result);
 				if(result=='인증'){
 					// 인증성공시 다음 화면인 modify_pw.jsp로 페이지 전환
					modify_url = 'modify_pw.do?m_id=' + $('#m_id').val() ;
					window.location.href = modify_url;				
 				}else{
 					alert('인증번호를 다시 확인해주세요.');
 				}
			}
		});
	});
	
	
	// 비밀번호 유효성 검사를 위한 변수
	var m_pw = $('#m_pw');
	var m_pwConfirm = $('#m_pwConfirm');
	var pwPassCheck = false;
	var passRule = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	
	// 비밀번호 유효성 검사를 위한 함수
	var checkPw = function(m_pw, m_pwConfirm) {
		pwPassCheck = false;

		if(m_pw == ''){
			$('#m_pw').focus();
			return "비밀번호를 입력해주세요.";
		}else if (!passRule.test(m_pw)){
			return "영문자, 특수문자, 숫자 포함 8~15자리 이내로 설정하셔야 합니다.";
		}else if(m_pwConfirm == ''){
	//		$('#m_pwConfirm').focus();
			return "비밀번호 확인을 입력해주세요.";
		}else if(m_pw != m_pwConfirm){
			return "비밀번호가 일치하지 않습니다.";
		}else{
			pwPassCheck = true;
			return "비밀번호가 일치합니다.";
		}
	}
	
	// 비밀번호 입력시 유효성검사 함수 호출
	m_pw.on('keyup', function(){
		result = checkPw(m_pw.val(), m_pwConfirm.val())
		$('#infoPw').text(result);		
	});
	m_pwConfirm.on('keyup', function(){
		result = checkPw(m_pw.val(), m_pwConfirm.val())
		$('#infoPw').text(result);
	});


	// modify_pw.jsp 에서 비밀번호 입력 후 수정하기 버튼 클릭시 
	// >>>> 비밀번호 유효성 체크 후, DB 반영, 팝업창 닫기
	$(document).on("click", "#update_pw", function(){
		if ($('#m_pw').val() == ''){
			alert('새 비밀번호를 입력해주세요.');	
			$('#m_pw').focus();	
		}else{
			$.ajax({
				type : 'post',
				async : true,
				url : '../all/update_pw.do',
				beforeSend : function(xhr){	
					xhr.setRequestHeader(header, token);
				},
				contentType: "application/x-www-form-urlencoded;charset=utf-8",
		 		data : {
		 			'm_id' : $('#m_id').val(),
		 			'm_pw' : $('#m_pw').val()
	 			},
	 			success : function(result){
	 				alert('비밀번호가 변경되었습니다.');
	//				window.opener.location.href = 'login.do';
					window.close();	
				}, 
				error : function(err){
					console.log(err);
				}
			});
		}
	});
	
	
})