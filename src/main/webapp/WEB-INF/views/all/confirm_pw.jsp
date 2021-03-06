<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 비밀번호 찾기 </title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="../resources/assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="../resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/assets/css/style.css">
<link rel="stylesheet" href="../resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="../resources/css/all/find_idpw.css" type="text/css"/>
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

<!-- FindController의 FindPw 결과에 따라 화면 출력 -->
<!-- 화면 내 버튼 클릭시 find_idpw.js 에서 각 id에 따라 click 이벤트 동작하며 컨트롤러 호출 -->

<div class="main">

	<c:choose>
		<c:when test="${empty resultvo.email}">
			회원정보가 일치하지 않습니다.<br/>
			다시 한 번 확인해주세요. <hr/>
			<a href="../all/find_idpw.do" class="my-btn btn more-btn1">
				<i class="ti-angle-left"></i>뒤로 가기
			</a><br/>
		</c:when>
		<c:otherwise>
			${resultvo.email} 으로 인증번호가 발송되었습니다. <br/><hr/>
			
			<!-- modify시 사용할 아이디 정보를 가져와서 쿼리스트링으로 다음 화면에 전달 -->
			<input type="hidden" id="m_id" value="${resultvo.m_id}"/>  
			<input type="text" id="certCode" placeholder="인증번호를 입력해주세요."/>
			<input type="button" id="certNumChk" value="확인" class="confirm-btn view-btn1"/> <br/><hr/>
			<a href="#" id="back_to_login" class="my-btn view-btn1 btn more-btn1">
				로그인하기<i class="ti-angle-right"></i>
			</a> 
		</c:otherwise>
	</c:choose>
	

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