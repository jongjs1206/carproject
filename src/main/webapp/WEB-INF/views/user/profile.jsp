<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Hotel</title>
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
</script>
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

<script type="text/javascript" src="../resources/js/user/profile.js"></script>
</head>
<body>

	<%@ include file="../header.jsp"%>

	<main class="background_color">


		<!-- Application Form Section Begin -->
		<div class="container box-login">

			<div class="noMenuLogo">
				<h3 id="ProfileEdit">내정보 수정</h3>
			</div>


			<section class="content--center-block">

				<div class="cmm-basic-info"></div>

				<hr class="cmm-line mg-b40 pad-t20">

			<form method="post" action="updatePhoto.do"  enctype="multipart/form-data" id="picForm">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="cmm-basic-info">
					<div class="cmm-tit">
						<span>프로필 사진</span>
					</div>

					<div class="cmm-input-area">
						<div class="col-md-6">
						<a href="javascript:void(0);">
							<img id='preImg' src="https://storage.cloud.google.com/car_image_for_analysis/profile/${member.m_id}.jpg" alt="profile" class="single-gallery-image"/>
							</a>
						</div>
						
						<input type="file" name="file" id="picFile" accept="image/*"/>
							<button type="button" class="joinBtns more-btn1"
								id="btnPic" name="btnPic">
								<span>변경</span>
							</button>
					</div>
				</div>
			</form>
			
			
				<hr class="cmm-line mg-b40 pad-t20">

				<form:form method="post" action="userUpdate.do" id="modify"
					role="form">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="cmm-basic-info">
						<div class="cmm-tit">
							<span>아이디</span>
						</div>
						<div class="cmm-input-area">
							<span class="inp-t"> <input type="text" id="m_id"
								class="readonly" value="${member.m_id}" name="m_id"
								autocomplete="off" maxlength="20" title="아이디" tk_security="true"
								readonly>
							</span>
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
							<button type="button" class="joinBtns more-btn1"
								id="btnIdDuplChk" name="btnIdDuplChk">
								<span>비밀번호 다시 설정</span>
							</button>
						</div>
					</div>

					<hr class="cmm-line mg-b40 pad-t20">
					<div class="cmm-basic-info">
						<div class="cmm-tit">
							<span>이름</span>
						</div>
						<div class="cmm-input-area">
							<span class="inp-t"><input type="text" title="이름"
								value="${member.m_name}" id="m_name" name="m_name"
								maxlength="10" autocomplete="off" tk_security="true"></span>
							<div class="form-txt">
								<span class="ft-red" id="nameAlert"></span>
							</div>
						</div>
					</div>
					<div class="cmm-basic-info">
						<div class="cmm-tit">
							<span>성별</span>
						</div>
						<div class="cmm-input-area">
							<div class="ck-wrap mg-t20" id="divGenderArea">
								<!-- 남자 선택 -->
								<c:if test="${member.gender eq '남'}">
									<button type="button" id="gender_m" value="남"
										class="joinBtns gender more-btn1 ck-item genderOn">
										<span>남</span>
									</button>
									<button type="button" id="gender_w" value="여"
										class="joinBtns gender more-btn1 ck-item">
										<span>여</span>
									</button>
									<input type="hidden" id="gender" name="gender">
									<!-- 여자 선택 -->
								</c:if>
								<c:if test="${member.gender eq '여'}">
									<button type="button" id="gender_m" value="남"
										class="joinBtns gender more-btn1 ck-item">
										<span>남</span>
									</button>
									<button type="button" id="gender_w" value="여"
										class="joinBtns gender more-btn1 ck-item genderOn">
										<span>여</span>
									</button>
									<input type="hidden" id="gender" name="gender">
								</c:if>
							</div>

							<div class="form-txt">
								<span class="ft-red" id="genderAlert"></span>
							</div>
						</div>
					</div>
					<div class="cmm-basic-info">
						<div class="cmm-tit">
							<span>생년월일</span>
						</div>
						<div class="cmm-input-area">
							<span class="inp-t"> <input type="text" id="birth"
								name="birth" maxlength="8" autocomplete="off" title="생년월일"
								value="${member.birth}" placeholder="예) 19890909"
								tk_security="true">
							</span>
							<div class="form-txt">
								<span class="ft-red" id="birthDayAlert"></span>
							</div>
						</div>
					</div>
					<div class="cmm-basic-info">
						<div class="cmm-tit">
							<span>이메일</span>
						</div>
						<div class="cmm-input-area">
							<span class="inp-t" style="width: 140px;"> <input
								type="text" id="email1" class='readonly' name="email1"
								title="이메일 주소" value="${email[0]}" tk_security="true" readonly>
							</span> <span class="form-t">@</span> <span class="inp-t"
								style="width: 140px;"> <input type="text" id="email2"
								class="readonly" name="email2" title="직접입력 이메일"
								value="${email[1]}" readonly></span> <input type="hidden"
								id="email" name="email">
							<div class="form-txt">
								<span class="ft-red" id="emailAlert"></span>
							</div>
						</div>


					</div>
					<div class="cmm-basic-info">
						<div class="cmm-tit">
							<span>휴대폰번호</span>
						</div>
						<div class="cmm-input-area">
							<div class="mg-b10">
								<span class="inp-t w400"><input type="text"
									title="휴대전화번호" id="tel" name="tel" autocomplete="off"
									value="${member.tel }" maxlength="13"
									placeholder="예)01012345555" tk_security="true"></span>
							</div>
						</div>


					</div>

					<hr class="cmm-line mg-b30 pad-t10">
					<div class="joinBtnDiv">
						<a id="modifyBtn" class="btn border-btn"><span>수 정</span></a>
					</div>
				</form:form>

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