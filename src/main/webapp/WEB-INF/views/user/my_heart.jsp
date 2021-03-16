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
<script type="text/javascript" src="../resources/js/user/my_heart.js"></script>
</head>
<body>

	<%@ include file="../header.jsp"%>
	
	<!-- slider Area Start-->

	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	<input type="hidden" class="page" value="1">
	<div class="slider-area">
		<div
			class="single-slider hero-overly slider-height2 d-flex align-items-center"
			data-background="../resources/img/top2.jpg">
			<div class="container">
				<div class="row ">
					<div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
						<div class="hero-caption">
							<span>마이페이지</span>
							<h2>찜 목록</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- slider Area End-->



	
	

	
	<input type="hidden" class='login_on' value='${sessionScope.info.m_id}'/>										

		
	<!-- Room Start -->
	<section class="room-area" style="margin-top: 50px;">
		<div class="container">
			<div style="display: flex; justify-content: space-between;">
			<div class='product_count'><fmt:formatNumber value="${heartcount}" pattern="#,###" />대 찜</div>
			<div class='delete_heart' style='background-color: #dca73a; color:white; 
			padding: 5px 10px 5px 10px; cursor:pointer; border-radius: 5px;'>
			전체 삭제</div>
			</div>
			<hr>
			<div class="row" style="display: flex;">
				<c:forEach var="product_sell" items="${heartlist}">
					<div class="col-xl-4 col-lg-6 col-md-6 product_all">
						<!-- Single Room -->
						<div class="single-room mb-50">
							<div class="room-img">
								<a class='go_detail1' href="../all/salesDetail.do?num=${product_sell.sell_id}"><img class="car_image" style="height: 277px;"
									src="${product_sell.image}img1.png"
									alt=""></a>
							</div>
							<div class="room-caption" style="height: 220px;">
								<h3 style="height: 50px;">
									<a class='go_detail2' href="../all/salesDetail.do?num=${product_sell.sell_id}">${product_sell.title}</a>
								</h3>
								<div class="per-night">
								<span><span class='car_opt'>${product_sell.resultoption}</span></span>
								
								<c:if test="${product_sell.resultoption eq ''}">
									<span><span class='car_opt'>옵션이 등록되지 않음</span></span>
								</c:if>
									<div style="margin-top: 5px;">
										<span class='car_price' style="font-size: 26px;">
										<fmt:formatNumber value="${product_sell.price}" pattern="#,###" />만원</span>
										
											<i class="fas fa-heart wish color_pink"></i>									
											<input type="hidden" class='heart_on_off' value="on"/>
										
										<input type="hidden" class='sell_id' value="${product_sell.sell_id}"/>									
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<c:if test="${heartcount eq '0'}">
					<div class='no_carlist'>
						찜한 차량이 없습니다.
					</div>
				</c:if>
				<c:if test="${heartcount ne '0'}">
					<div class='no_carlist off'>
						찜한 차량이 없습니다.
					</div>
				</c:if>
			</div>
		</div>
	</section>
	<c:set var='all_page' value='${(heartcount/15)+(1-((heartcount/15)%1))%1}'></c:set>
	<c:set var='start' value='2'></c:set>
	<c:set var='end' value='10'></c:set>
	<c:if test="${all_page<end}">
		<c:set var='end' value='${all_page}'></c:set>
	</c:if>
	<!-- Room End -->
	<nav class="paging" style="display: flex; justify-content: center;">
		<ul class="pagination">
			<li class="page-item start_page"><a href="#" class="page-link"
				aria-label="Previous"> <i class="fas fa-angle-double-left"></i>
			</a></li>
			<li class="page-item prev_page"><a href="#" class="page-link"
				aria-label="Previous"> <i class="fas fa-angle-left"></i>
			</a></li>
		</ul>
		<ul class="pagination page_number">
			<li class="page-item choice page_choice"><a href="#" class="page-link">1</a></li>
			<c:forEach var='temp' begin='${start}' end='${end}'>
					<li class="page-item page_choice"><a href="#" class="page-link">${temp}</a></li>
			</c:forEach>
		</ul>
		<ul class="pagination">
			<li class="page-item next_page"><a href="#" class="page-link"
				aria-label="Next"> <i class="fas fa-angle-right"></i>
			</a></li>
			<li class="page-item end_page"><a href="#" class="page-link"
				aria-label="Previous"> <i class="fas fa-angle-double-right"></i>
			</a></li>
		</ul>
	</nav>

	<!-- 챗봇 -->
  	<div id="frogue-container" class="position-right-bottom"
      data-chatbot="4e13c93c-d37f-4fa8-ad40-ce2fc1707a9f"
      data-user="사용자ID"
      data-init-key="value"
      ></div>
	<!-- data-init-식별키=값 으로 셋팅하면 챗플로우에 파라미터와 연동가능. 식별키는 소문자만 가능 -->
	<script>
	(function(d, s, id){
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) {return;}
	    js = d.createElement(s); js.id = id;
	    js.src = "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
	    fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'frogue-embed'));
	</script>


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