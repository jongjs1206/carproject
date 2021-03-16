<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>SNS 간편가입</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge" />


<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="../resources/assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="../resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="../resources/assets/css/gijgo.css">
<link rel="stylesheet" href="../resources/assets/css/slicknav.css">
<link rel="stylesheet" href="../resources/assets/css/animate.min.css">
<link rel="stylesheet" href="../resources/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="../resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="../resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="../resources/assets/css/slick.css">
<link rel="stylesheet" href="../resources/assets/css/nice-select.css">
<link rel="stylesheet" href="../resources/assets/css/style.css">
<link rel="stylesheet" href="../resources/assets/css/responsive.css">
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
	integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.0/gsap.min.js"
	integrity="sha512-JO6JyFPJupQKZf7icgZkHwuq/rAQxH7COqvEd4WdK52AtHPedwHog05T69pIelI69jVN/zZbW6TuHfH2mS8j/Q=="
	crossorigin="anonymous"></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.0/CSSRulePlugin.min.js'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.0/EaselPlugin.min.js"></script>

<link rel="stylesheet" href="../resources/css/all/join_login.css"
	type="text/css">

<script type="text/javascript" src="../resources/js/all/join_sns.js"></script>
</head>
<body>

	<%@ include file="../header.jsp"%>

	<main class="background_color">
		<!-- Application Form Section Begin -->
		<div class="container box-login">
			<div class="noMenuLogo">
				<a href="/carproject/all/homepage.do"><img
					src="../resources/img/logo.png" alt="logo"></a>
			</div>


			<section class="content--center-block">

				<form action="snsUserInsert.do" method="post" id="join" role="form">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
				
				<input type="hidden" id="email" name="email" value="${vo.email}" /> 
				<input type="hidden" id="google" name="google" value="${vo.google}" /> 
				<input type="hidden" id="m_name" name="m_name" value="${vo.m_name}" /> 
				
					<div class="cmm-basic-info">

					</div>


					<hr class="cmm-line mg-b40 pad-t20">


					<div class="cmm-basic-info">
						<div class="cmm-tit">
							<span>아이디</span>
						</div>
						<div class="cmm-input-area">
							<span class="inp-t"> <input type="text" id="m_id"
								name="m_id" autocomplete="off"
								maxlength="20" title="아이디" tk_security="true">
							</span>
							<button type="button" class="joinBtns more-btn1"
								id="btnIdDuplChk" name="btnIdDuplChk">
								<span>중복확인</span>
							</button>
							<div class="form-txt">
								<span class="ft-black" id="idAlert1" style="display: none;"></span>
								<span class="ft-red" id="info"></span>
							</div>
						</div>
					</div>




					<div class="cmm-basic-info">
						<div class="cmm-tit">
							<span>비밀번호</span>
						</div>
						<div class="cmm-input-area">
							<span style="font-family: '고딕';" class="inp-t"> <input type="password" title="비밀번호" 
								maxlength="20" min="6" id="m_pw" name="m_pw" data-enc="on"
								autocomplete="off" >
							</span>
							<div class="form-txt">
								<span class="ft-red" id="infoPw"></span>
								<ul class="ft-list">
									<li><span class="icon">*</span>비밀번호는 영문자, 특수문자, 숫자 포함 형태의
										8~15자리로 입력해주세요.</li>
									<li><span class="icon">*</span>아이디를 포함한 문자/숫자는 비밀번호로 사용할 수
										없습니다.</li>
									<li><span class="icon">*</span>동일한 문자/숫자 3자리 이상은 입력이
										불가합니다.(ex. aaa,111 등)</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="cmm-basic-info">
						<div class="cmm-tit">
							<span>비밀번호확인</span>
						</div>
						<div class="cmm-input-area">
							<span style="font-family: '고딕';" class="inp-t"><input type="password" title="비밀번호"
								id="m_pwConfirm" name="loginPassChk" min="6" maxlength="20" 
								data-enc="on" autocomplete="off" ></span>
							<div class="form-txt">
								<span class="ft-red" id="passwordAlert2"></span>
							</div>
						</div>
					</div>
					
					
					<hr class="cmm-line mg-b30 pad-t10">
					<div class="joinBtnDiv">
						<a id="joinDiv" class="btn border-btn"><span>회원가입</span></a>
					</div>
				</form>

				<!--end of container  -->
			</section>
		</div>
	</main>

	<%@ include file="../footer.jsp"%>

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