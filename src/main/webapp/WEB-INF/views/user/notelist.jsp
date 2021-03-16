<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>쪽지목록</title>
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
<link rel="stylesheet" href="../resources/css/user/notelist.css"
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
<script type="text/javascript" src="../resources/js/user/notelist.js"></script>
</head>
<body>

	<%@ include file="../header.jsp"%>

	<!-- slider Area Start-->

	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	<input type="hidden" class="page" value="${page}">
	<input type="hidden" class="note" value="${note}">
	<div class="slider-area">
		<div
			class="single-slider hero-overly slider-height2 d-flex align-items-center"
			data-background="../resources/img/top5.jpg">
			<div class="container">
				<div class="row ">
					<div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
						<div class="hero-caption">
							<span>마이페이지</span>
							<h2>쪽지 목록</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- slider Area End-->


	<input type="hidden" class='login_on' value='${sessionScope.info.m_id}' />

	<!-- Room Start -->
	<section class="room-area" style="margin-top: 100px;">
		<div class="container">
			<div style="display: flex; justify-content: space-between;">
				<div style="display: flex;">
					<div class='all_ck'>
						<input type="checkbox" class='all_cbox' /> <i
							class="fas fa-caret-down"></i>
					</div>
					<div class='note_delete'
						style='background-color: pink; color: #112E41; padding: 5px 10px 5px 10px; cursor: pointer; border-radius: 5px;'>
						삭제</div>
					<a href="../user/notelist.do?note=get&page=1"><div
							class='get_note downline blue-color'>받은 쪽지</div></a> <a
						href="../user/notelist.do?note=send&page=1"><div
							class='send_note gray'>보낸 쪽지</div></a>
				</div>
				<a
					onclick="window.open('../user/noteinsert.do', 'window', 'toolbar=no,directory=no,status=no,menubar=no,scrollbars=no,resizeable=yes,copyhistory=no, width=395, height=630, left=0, top=0');return false">
					<div 
						style='background-color: #dca73a;  margin-right:30px; color: white; padding: 5px 10px 5px 10px; cursor: pointer; border-radius: 5px;'>
						글 쓰기</div>
				</a>
			</div>
			
			<div class="row" style="margin-top: 20px;">
				<c:if test="${note eq 'get'}">
					<c:forEach var="getlist" items="${list}">
						<c:if test="${getlist.r_date eq null}">
							<div class='note_row'>
						</c:if>
						<c:if test="${getlist.r_date ne null}">
							<div class='note_row gray'>
						</c:if>
							<div class='note_info'>
								<input type="checkbox" class='ck_note' />
								<div class='send_p'>
									<span>${getlist.m_name} ( ${getlist.m_id} )</span>
								</div>
								<div>
									<a class='note_title get_title'>${getlist.title}</a>
									<input type="hidden" value='${getlist.l_id}'/>
								</div>
							</div>
							<div class='note_day'>${fn:substring(getlist.w_date, 0, 16)}</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${note eq 'send'}">
					<c:forEach var="sendlist" items="${list}">
						<div class='note_row'>
							<div class='note_info'>
								<input type="checkbox" class='ck_note' />
								<div class='send_p'>
									<c:if test="${sendlist.m_name ne null}">
										<span>${sendlist.m_name} ( ${sendlist.to_id} )</span>
									</c:if>
									<c:if test="${sendlist.m_name eq null}">
										<span style="color: hotpink;">전송 에러 ( ${sendlist.to_id} )</span>
									</c:if>
								</div>
								<div>
									<a class='note_title send_title'>${sendlist.title}</a>
									<input type="hidden" value='${sendlist.l_id}'/>
								</div>
							</div>
							<div class='note_day'>${fn:substring(sendlist.w_date, 0, 16)}</div>
						</div>
					</c:forEach>
				</c:if>
				
				<c:if test="${note_count eq '0'}">
					<div class='no_carlist' style="margin-left: 20px;">쪽지가 없습니다.</div>
				</c:if>
				
			</div>
		</div>
	</section>
	
	<!-- ### 페이징 시작 ### -->
		
	<fmt:parseNumber var="all_page" integerOnly= "true" value="${(note_count/15)+(1-((note_count/15)%1))%1}"/>
	<c:if test="${page<=5}">
		<c:set var='start' value='1'></c:set>
		<c:set var='end' value='10'></c:set>
	</c:if>
	<c:if test="${page>5}">
		<c:set var='start' value='${page-4}'></c:set>
		<c:set var='end' value='${page+5}'></c:set>
	</c:if>
	<c:if test="${page+5>all_page}">
		<c:set var='end' value='${all_page}'></c:set>
		<c:set var='start' value='${all_page-9}'></c:set>
	</c:if>
	<c:if test="${start<1}">
		<c:set var='start' value='1'></c:set>
	</c:if>
	<c:if test="${end<1}">
		<c:set var='end' value='1'></c:set>
	</c:if>
	<!-- Room End -->
	<nav class="paging" style="display: flex; justify-content: center;">
		<ul class="pagination">
			<li class="page-item start_page"><a
				href="../user/notelist.do?note=${note}&page=1" class="page-link"
				aria-label="Previous"> <i class="fas fa-angle-double-left"></i>
			</a></li>
			<c:if test="${page eq 1}">
				<li class="page-item prev_page"><a
					href="../user/notelist.do?note=${note}&page=1" class="page-link"
					aria-label="Previous"> <i class="fas fa-angle-left"></i>
				</a></li>
			</c:if>
			<c:if test="${page ne 1}">
				<li class="page-item prev_page"><a
					href="../user/notelist.do?note=${note}&page=${page-1}" class="page-link"
					aria-label="Previous"> <i class="fas fa-angle-left"></i>
				</a></li>
			</c:if>

		</ul>
		
		<ul class="pagination page_number">
			<c:forEach var='temp' begin='${start}' end='${end}'>
				<c:if test="${temp eq page}">
					<li class="page-item choice page_choice"><a
						href="../user/notelist.do?note=${note}&page=${temp}" class="page-link">${temp}</a></li>
				</c:if>
				<c:if test="${temp ne page}">
					<li class="page-item page_choice"><a
						href="../user/notelist.do?note=${note}&page=${temp}" class="page-link">${temp}</a></li>
				</c:if>
			</c:forEach>
		</ul>
		<ul class="pagination">
			<c:if test="${page eq all_page}">
				<li class="page-item next_page"><a href="../user/notelist.do?note=${note}&page=${all_page}" class="page-link"
					aria-label="Next"> <i class="fas fa-angle-right"></i>
				</a></li>
			</c:if>
			<c:if test="${page ne all_page}">
				<li class="page-item next_page"><a href="../user/notelist.do?note=${note}&page=${page+1}" class="page-link"
					aria-label="Next"> <i class="fas fa-angle-right"></i>
				</a></li>
			</c:if>

			<li class="page-item end_page"><a
				href="../user/notelist.do?note=${note}&page=${all_page}" class="page-link"
				aria-label="Previous"> <i class="fas fa-angle-double-right"></i>
			</a></li>
		</ul>
	</nav>
	<!-- ### 페이징 끝 ### -->



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