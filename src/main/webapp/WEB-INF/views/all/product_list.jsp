<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Hotel</title>
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
<link rel="stylesheet" href="../resources/css/all/product_list.css"
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

<script type="text/javascript" src="../resources/js/all/product_list.js"></script>
</head>
<body>

	<%@ include file="../header.jsp"%>
	<%@ include file="../side.jsp"%>
	<!-- slider Area Start-->

	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />

	<div class="slider-area">
		<div
			class="single-slider hero-overly slider-height2 d-flex align-items-center"
			data-background="../resources/img/top1.jpg">
			<div class="container">
				<div class="row ">
					<div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
						<div class="hero-caption">
							<span>전체</span>
							<h2>자동차 매장</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- slider Area End-->



	<!-- 세부검색 -->
	<div class="container maker_margin">
		<div class='country'>
			<span class='downline'>전체</span>| <span>국산차</span>| <span>수입차</span>
		</div>
		<div class="wrap-finder-maker">
			<!-- 제조사 -->
			<div class="area-maker">
				<h4>제조사</h4>
				<div class="list-comm js-tabs">
					<dl class="group-list abroad_table">
						<c:forEach var="mycategory" items="${category}">
							<c:if test="${null eq mycategory.count}">
								<dd class="category_list">
									<button type="button" class="btn_category">
										<span>${mycategory.jejosa}</span> <span class="t2 mkCnt_21">0</span>
									</button>
								</dd>
							</c:if>
							<c:if test="${null ne mycategory.count}">
								<dd class="category_list">
									<button type="button" class="btn_category">
										<span>${mycategory.jejosa}</span> <span class="t2 mkCnt_21">${mycategory.count}</span>
									</button>
								</dd>
							</c:if>
						</c:forEach>
					</dl>
				</div>
			</div>

			<!-- 모델 -->
			<div class="area-model">
				<h4>모델</h4>
				<div class="list-comm js-tabs">
					<dl class="group-list model_table">
						<div class="cell-jejo">
							<span>제조사를 <br>선택하세요.
							</span>
						</div>
					</dl>
				</div>
			</div>
			<!-- 세부모델 -->
			<div class="area-detail">
				<h4>세부모델</h4>
				<div class="list-comm">
					<dl class="group-list detail_table">
						<div class="cell-mode">
							<span>모델을 <br>선택하세요.
							</span>
						</div>
					</dl>
				</div>
			</div>
			<!-- 등급 -->
			<div class="area-grade">
				<h4>등급</h4>
				<div class="list-comm">
					<dl class="group-list grade_table">
						<div class="cell-detail">
							<span>세부모델을 <br>선택하세요.
							</span>
						</div>
						<div class="two-detail off">
							<span>세부모델을 2개 이상 선택하시면 <br>등급은 선택하실 수 없습니다.
							</span>
						</div>
					</dl>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="container">
		<div style="display: flex; justify-content: flex-end;">
			<input type='text' placeholder="차명을 입력하세요"
				style="border: none; border-bottom: 3px solid #DCA73A; margin-top: 30px; margin-bottom: 30px; width: 200px;">
			<button
				style="color: white; border-radius: 3px; font-weight: bold; margin-bottom: 30px; background-color: #DCA73A; width: 60px; margin-top: 30px; border: none; margin-left: 10px;">검색</button>
		</div>
	</div>

	
	<input type="hidden" class='login_on' value='${sessionScope.info.m_id}'/>										
	
	<!-- Room Start -->
	<section class="room-area">
		<div class="container">
			<div class="row">
				<c:forEach var="product_sell" items="${sell}">
					<div class="col-xl-4 col-lg-6 col-md-6">
						<!-- Single Room -->
						<div class="single-room mb-50">
							<div class="room-img">
								<a class='go_detail1' href="../all/detail.do?num=${product_sell.sell_id}"><img class="car_image" style="height: 277px;"
									src="${product_sell.image}img1.png"
									alt=""></a>
							</div>
							<div class="room-caption" style="height: 220px;">
								<h3 style="height: 50px;">
									<a class='go_detail2' href="../all/detail.do?num=${product_sell.sell_id}">${product_sell.title}</a>
								</h3>
								<div class="per-night">
								<span><span class='car_opt'>${product_sell.resultoption}</span></span>
								
								<c:if test="${product_sell.resultoption eq ''}">
									<span><span class='car_opt'>옵션이 등록되지 않음</span></span>
								</c:if>
									<div style="margin-top: 5px;">
										<span class='car_price' style="font-size: 26px;">
										<fmt:formatNumber value="${product_sell.price}" pattern="#,###" />만원</span>
										
										<i class="fas fa-heart wish"></i>
										<input type="hidden" class='heart_on_off' value="off"/>
										
										
									</div>
									<input type="hidden" class='car_id' value="${product_sell.sell_id}"/>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- Room End -->

	<nav class="blog-pagination justify-content-center d-flex"
		style="position: relative; bottom: 100px;">
		<ul class="pagination">
			<li class="page-item"><a href="#" class="page-link"
				aria-label="Previous"> <i class="ti-angle-left"></i>
			</a></li>
			<li class="page-item"><a href="#" class="page-link">1</a></li>
			<li class="page-item active"><a href="#" class="page-link">2</a>
			</li>
			<li class="page-item"><a href="#" class="page-link"
				aria-label="Next"> <i class="ti-angle-right"></i>
			</a></li>
		</ul>
	</nav>



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