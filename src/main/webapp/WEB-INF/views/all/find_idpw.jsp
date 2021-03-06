<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찿기</title>

<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="../resources/assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="../resources/assets/css/style.css">
<link rel="stylesheet" href="../resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="../resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/all/jso.css" type="text/css">
<!-- JS here -->	
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
	integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="../resources/js/all/find_idpw.js"></script>	
	


</head>
<body>

	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />

	<!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <strong>CAR</strong>
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->

<!--################################### 상단 설명란 ###################################-->
<div class="label-container">
	<div class=""><b>등록된 내 회원정보로 찾을 수 있습니다.</b></div>
</div>

<!--################################### 탭 메뉴 ###################################-->
<div class="main">

	<input id="tab1" type="radio" name="tabs" class="input" checked>
	<label for="tab1" >아이디 찾기</label>
	
	<input id="tab2" type="radio" name="tabs" class="input">
	<label for="tab2">비밀번호 찾기</label>

	<!--################################### 첫번째 탭 ###################################-->
	<!-- 확인 버튼 id : idsubmit / find_idpw.js 에서 버튼 작동 --> 
    <!-- >>>> 사용자입력값 가지고 CoinQnaController로 이동하여 ID값 반환 -->
    <!-- >>>> confirm_id.jsp로 페이지 전환 -->
	<section id="content1" class="container">
		<p>
			<span class="margin-left">회원 가입된 이름과 휴대폰번호를 입력해 주세요.</span><br/><br/><br/>
			<input type="text" name="m_name" id="m_name" placeholder="이름"/ class="margin-left"><br/><br/>
			<input type="text" name="tel" id="tel" placeholder="예) 01012345678" class="margin-left"/><br/><br/>
			<a href="#" id='idsubmit' class="my-btn margin-left btn more-btn1">확인<i class="ti-angle-right"></i> </a>

		</p>
	</section>
	
	<!--################################### 두번째 탭 ###################################-->
	<!-- 확인 버튼 id : pwsubmit / find_idpw.js 에서 버튼 작동 --> 
    <!-- >>>> 사용자입력값 가지고 CoinQnaController로 이동하여 임시비밀번호 메일 전송 -->
    <!-- >>>> confirm_id.jsp로 페이지 전환 -->
	<section id="content2">
		<p>
			회원 가입된 아이디와 이메일을 입력해 주세요. <br/>
			가입시 등록한 이메일로 새 비밀번호 변경을 위한 인증번호가 발송됩니다.  <br/><br/>
			<input type="text" name="m_id" id="m_id" placeholder="아이디" class=""/><br/><br/>
			<input type="text" name="user_email" id="user_email" placeholder="예) gildong@gmail.com" class=""/><br/><br/>
			<a href="#" id='pwsubmit'  class="my-btn view-btn1 btn more-btn1">다음<i class="ti-angle-right"></i> </a>
		
		</p>
	</section>	
</div>


	<!-- JS here -->

	<!-- All JS Custom Plugins Link Here here -->
	<script src="./../resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>

	<!-- Jquery, Popper, Bootstrap -->
	<script src="./../resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="./../resources/assets/js/popper.min.js"></script>
	<script src="./../resources/assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script src="./../resources/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="./../resources/assets/js/owl.carousel.min.js"></script>
	<script src="./../resources/assets/js/slick.min.js"></script>
	<!-- Date Picker -->
	<script src="./../resources/assets/js/gijgo.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script src="./../resources/assets/js/wow.min.js"></script>
	<script src="./../resources/assets/js/animated.headline.js"></script>
	<script src="./../resources/assets/js/jquery.magnific-popup.js"></script>

	<!-- Scrollup, nice-select, sticky -->
	<script src="./../resources/assets/js/jquery.scrollUp.min.js"></script>
	<script src="./../resources/assets/js/jquery.nice-select.min.js"></script>
	<script src="./../resources/assets/js/jquery.sticky.js"></script>

	<!-- contact js -->
	<script src="./../resources/assets/js/contact.js"></script>
	<script src="./../resources/assets/js/jquery.form.js"></script>
	<script src="./../resources/assets/js/jquery.validate.min.js"></script>
	<script src="./../resources/assets/js/mail-script.js"></script>
	<script src="./../resources/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="./../resources/assets/js/plugins.js"></script>
	<script src="./../resources/assets/js/main.js"></script>

</body>
</html>