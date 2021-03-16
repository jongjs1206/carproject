<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>사차원</title>
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
<link rel="stylesheet" href="../resources/css/all/product_list.css"
	type="text/css">
<script type="text/javascript" src="../resources/js/all/homepage.js"></script>
<script type="text/javascript" src="../resources/js/all/product_list.js"></script>
</head>
<body>
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	<%@ include file="../header.jsp"%>

	<input type="hidden" class='login_on' value='${sessionScope.info.m_id}' />


	<main style="margin-bottom: 150px;">
		<!-- slider Area Start-->
		<div class="slider-area ">
			<!-- Mobile Menu -->
			<div class="">
				<div
					class="single-slider  hero-overly slider-height d-flex align-items-center"
					data-background="../resources/img/bgimg.jpg">
					<div class="container">
						<div class="row justify-content-center text-center">
							<div class="col-xl-9">
								<div class="h1-slider-caption">
									<img class='bluecar' alt=""
										style="width: 80%; position: absolute; z-index: 0; top: 42%; right: -28%;"
										src="../resources/img/car1.png">
									<h1 data-animation="fadeInUp" data-delay=".4s">중고차 사이트
										사차원!</h1>
									<h3 data-animation="fadeInDown" data-delay=".4s">가짜 매물 X</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- slider Area End-->


		<!-- Make customer Start-->
		<section class="make-customer-area customar-padding fix">
			<div class="container-fluid p-0">
				<div class="row">
					<div class="col-xl-5 col-lg-6">
						<div class="customer-img mb-120">
							<img src="../resources/img/sell.jpg" class="customar-img1" alt="">
							<img src="../resources/assets/img/customer/customar2.png"
								class="customar-img2" alt="">
							<div class="service-experience heartbeat">
								<h3>
									저희 사이트는 개인회원이<br>거래하는 사이트 입니다.
								</h3>
							</div>
						</div>
					</div>
					<div class=" col-xl-4 col-lg-4">
						<div class="customer-caption">
							<span></span>
							<h2>개인 차량 매물 등록</h2>
							<div class="caption-details">
								<p class="pera-dtails">코인을 충전하여 글을 등록할 수 있습니다.</p>
								<p>
									글을 등록한 순간부터 2주동안 게시됩니다. <br>1코인에 1건의 글을 등록할 수 있으며 1코인은
									10,000원으로 살 수 있습니다. <br>허위 매물 등록시 삭제를 당할 수 있으며 코인은 돌려주지
									않습니다.
								</p>
								<a style="color: white;" class="btn more-btn1">글 등록 <i
									class="ti-angle-right"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Make customer End-->

		<!-- Room Start -->
		<section class="room-area">
			<div class="container">
				<div class="row" style="display: flex;">
					<c:forEach var="product_sell" items="${sell}">
						<div class="col-xl-4 col-lg-6 col-md-6 product_all">
							<!-- Single Room -->
							<div class="single-room mb-50">
								<div class="room-img">
									<a class='go_detail1'
										href="../all/salesDetail.do?num=${product_sell.sell_id}"><img
										class="car_image" style="height: 277px;"
										src="${product_sell.image}img1.png" alt=""></a>
								</div>
								<div class="room-caption" style="height: 220px;">
									<h3 style="height: 50px;">
										<a class='go_detail2'
											href="../all/salesDetail.do?num=${product_sell.sell_id}">${product_sell.title}</a>
									</h3>
									<div class="per-night">
										<span><span class='car_opt'>${product_sell.resultoption}</span></span>

										<c:if test="${product_sell.resultoption eq ''}">
											<span><span class='car_opt'>옵션이 등록되지 않음</span></span>
										</c:if>
										<div style="margin-top: 5px;">
											<span class='car_price' style="font-size: 26px;"> <fmt:formatNumber
													value="${product_sell.price}" pattern="#,###" />만원
											</span>
											<c:choose>
												<c:when test="${product_sell.ht eq '1'}">
													<i class="fas fa-heart wish color_pink"></i>
													<input type="hidden" class='heart_on_off' value="on" />
												</c:when>
												<c:otherwise>
													<i class="fas fa-heart wish"></i>
													<input type="hidden" class='heart_on_off' value="off" />
												</c:otherwise>
											</c:choose>
											<input type="hidden" class='sell_id'
												value="${product_sell.sell_id}" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</section>
		<!-- Room End -->

		<!-- Dining Start -->
		<div class="dining-area dining-padding-top">
			<!-- Single Left img -->
			<div class="single-dining-area left-img">
				<div class="container">
					<div class="row justify-content-end">
						<div class="col-lg-8 col-md-8">
							<div class="dining-caption">
								<span>news</span>
								<h3>자동차 뉴스</h3>
								<p>자동차에 관련된 최신 정보를 모아 놓았습니다.</p>

								<a href="../all/carnewsBoardList.do?page=1"
									class="btn border-btn">Learn More <i class="ti-angle-right"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- single Right img -->
			<div class="single-dining-area right-img">
				<div class="container">
					<div class="row justify-content-start">
						<div class="col-lg-8 col-md-8">
							<div class="dining-caption text-right">
								<span>prediction</span>
								<h3>시세 확인 & 예측</h3>
								<p>
									과거의 자동차 판매가격을 기준으로 평균 시세를 보여주고<br> 미래의 시세를 예측하여 나타내 줍니다.
								</p>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Dining End -->






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