<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 내 코인 </title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
<link rel="stylesheet" href="../resources/css/all/homepage.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/all/jso.css" type="text/css">		
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

<script type="text/javascript" src="../resources/js/all/homepage.js"></script>

</head>
<body>

	<%@ include file="../header.jsp"%>	<!-- header -->
	<%@ include file="../side.jsp"%>	<!--side menu -->
	
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	
	<!-- slider Area Start-->
    <div class="slider-area">
      <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="../resources/assets/img/hero/contact_hero.jpg" >
          <div class="container">
              <div class="row ">
                  <div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
                      <div class="hero-caption">
                          <span>마이페이지</span>
                          <h2>내 코인 정보</h2>
                      </div>
                  </div>
              </div>
          </div>
      </div>
	</div>	
	<!-- slider Area End-->
	
	<input type="hidden" class='login_on' value='${sessionScope.info.m_id}'/>	
	
	<div class='coin-container'>
		<div class="coin-item">
			<img src="../resources/img/bitcoinlogo.png" width="170" height="176">
		</div>
		<div class="coin-item">
			<h1>
			<span>${sessionScope.info.m_name} 님 현재 </span>
			<span class="gold-font">
				${sessionScope.info.coin} 코인
			</span>
			<span> 보유중입니다.</span>
			</h1>
			<h4>
				1코인당 1건의 판매글을 작성할 수 있습니다. <br/>
				글을 등록한 순간부터 2주동안 게시됩니다.  <br/>
			</h4>
			<h4>
				게시판 취지에 어긋나는 글, 허위매물 등록시 관리자가 삭제할 수 있으며 사용된 코인은 반화되지 않습니다. 
			</h4>
		</div>
	</div>
	
	<!-- 탭 메뉴 -->
	<div class="coin-main">
		<input id="tab1" type="radio" name="tabs" class="input" checked>
		<label for="tab1" class="coin-tab">코인 충전</label>
		
		<input id="tab2" type="radio" name="tabs" class="input">
		<label for="tab2" class="coin-tab">코인 충전내역</label>
	
	<!-- 탭 내용 -->

	<!-- 첫번째 탭 --> 
		<section id="content1" class="container">
			<p>
				<h4>수량을 입력하여 코인을 충전할 수 있습니다. </h4>
				<h4>10코인 구매시 코인 1개 가격을 할인해드립니다.</h4><br/><br/>
				<div class="buy-coin-container">
					<span>
						<input type="text" name="coin-num" value="1" placeholder="1" class="coin-num">
						<span class="coin-num">코인</span>
					</span>
					<span class="coin-num">
						<input type="text" id="coin-price" value="10000" placeholder="10000"> 원 
					</span>
					
					<input type="button" value="결제하기" class="buy-coin"/>
					
				</div>
			</p>
		</section>
	
	<!-- 두번째 탭 -->
		<section id="content2" class="container">
			<p>
				<div class="coin-search">
					기간
					<span>전체</span>
					<span>1주일</span>
					<span>1개월</span>
				</div>
				<div class="coin-list-bottom">
					<span class="">충전날짜</span>
					<span class="">충전한 코인</span>
					<span class="">결제금액</span>
				</div>
				<div class="coin-list">
					<span>
						

					</span>
				</div>
			</p>
		</section>

		
	</div>
	
	<div class="blank">
		<input type="hidden" class="blank"/>
	</div>

	
	
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
	
	<!-- Coin page js -->
	<script type="text/javascript" src="../resources/js/all/coin.js"></script>


</body>
</html>