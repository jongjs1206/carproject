<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String id = request.getParameter("m_id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 비밀번호 변경하기 </title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="../resources/assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="../resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="../resources/assets/css/style.css">
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

<div class="main">

	<input type="hidden" disabled="disabled" id="m_id" value="<%= id %>"/>
	아이디 : <span class="idbox-in-modify"><%= id %></span><hr/>
	비밀번호는 영문자, 특수문자, 숫자 포함  8~15자리로 입력해주세요.
	<table>
		<tr>	
			<td class="left">새 비밀번호 : </td>
			<td class="right">
				<span style="font-family: '고딕';" class="inp-t">
					<input type="password" id="m_pw" data-enc="on" autocomplete="off"/>
				</span>
			</td>
		</tr>
		<tr>
			<td class="left">비밀번호 확인 : </td>
			<td class="right">
				<span style="font-family: '고딕';" class="inp-t">
					<input type="password" id="m_pwConfirm" data-enc="on" autocomplete="off"/>
				</span>
			</td>
		</tr>
	</table>
	<span class="ft-red" id="infoPw"></span>
	<br/><hr/>
	
	<a href="#" id="update_pw" class="my-btn view-btn1 center btn more-btn1">
		변경하기 <i class="ti-wand"></i></a>

	


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