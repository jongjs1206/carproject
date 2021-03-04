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

<link rel="stylesheet" href="../resources/css/all/jso.css" type="text/css">	
	
	


</head>
<body>

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
	<!-- 이름 id : m_name / name : m_name -->
	<!-- 전화번호 id : tel / name : tel -->
	<!-- 확인 버튼 id : idsubmit ################# 이벤트 안 걸려있음 -->
	<section id="content1" class="container">

		<p>
			휴대폰으로 찾기 <br/><br/>
			<input type="text" name="m_name" id="m_name" placeholder="이름"/ class=""><br/><br/>
			<input type="text" name="tel" id="tel" placeholder="휴대폰번호(숫자만 입력)" class=""/><br/><br/>
			<input type="button" id='idsubmit' value="확인" class=""/><br/><br/>
		</p>

	</section>
	
	<!--################################### 두번째 탭 ###################################-->
	<!-- 아이디 id : m_id -->
	<!-- 확인 버튼 id : pwsubmit ################# 이벤트 안 걸려있음 -->
	<section id="content2">
		<p>
			비밀번호를 찾고자 하는 아이디를 입력해 주세요. <br/><br/>
			<input type="text" name="m_id" id="m_id" placeholder="아이디" class=""/><br/><br/>
			<input type="button" id='pwsubmit' value="확인" class=""/><br/><br/>
			
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