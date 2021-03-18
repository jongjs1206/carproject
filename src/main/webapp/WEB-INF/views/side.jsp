<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/side.css" type="text/css">
<script type="text/javascript" src="../resources/js/side.js"></script>
</head>
<body>
	<div class='side_all off'>
		<div class="side-vehicle">
			<h3 class="side-vehicle__head ">
				최근 본 차량 ${sessionScope.nowlist.size()}
			</h3>
			
			<c:set var='side_start' value='0'></c:set>
			<c:set var='side_end' value='1'></c:set>
			
			<c:set var='finish' value='${sessionScope.nowlist.size()}'></c:set>
			<input type="hidden" class='finish' value='${finish}'>
			<c:if test="${finish eq '1'}">
				<c:set var='side_start' value='0'></c:set>
				<c:set var='side_end' value='0'></c:set>
			</c:if>
			
			<c:forEach var='items' items="${sessionScope.nowlist}">
				<input class='side_number' type="hidden" value='${items[0]}'>
				<input class='side_img' type="hidden" value='${items[1]}img1.png'>
			</c:forEach>
			
			<div class="side-vehicle__container side-first">
				<div class="side-vehicle__list">
					<div class="side-vehicle__slide" data-index="0">
						<c:if test="${sessionScope.nowlist eq null}">
							<div class='nolistside'>최근 본 목록이 없습니다.</div>
						</c:if>
						<c:if test="${sessionScope.nowlist ne null}">
							<c:forEach var='temp_side' begin='${side_start}' end='${side_end}'>
							<div class="side-vehicle__slide-box">
								<input type="hidden" class='side_num' value='${sessionScope.nowlist.get(temp_side)[0]}'/>
								<a href="../all/salesDetail.do?num=${sessionScope.nowlist.get(temp_side)[0]}" class="side-vehicle__link">
									<img src="${sessionScope.nowlist.get(temp_side)[1]}img1.png"
									class="side-vehicle__image"
									>
								</a>
								<button type="button" class="side-vehicle__item-delete _delete">
									삭제</button>
								<hr class="line" />
							</div>
						</c:forEach>
						</c:if>
						
					</div>
				</div>
						<c:if test="${sessionScope.nowlist ne null}">
				<div class="side-vehicle__bottom">
					<div class="side-vehicle__fraction">
						<button type="button" class="side-vehicle__prev">
							<i class="fas fa-chevron-left"></i>
						</button>
						
							<span class="page__now" data-current-page="1">1</span>/
							<span class="page__end">${fn:substring((finish/2)+(1-((finish/2)%1))%1, 0, 1)}</span>
						
						
						<button type="button" class="side-vehicle__next">
							<i class="fas fa-chevron-right"></i>
						</button>
					</div>
				</div>
						</c:if>
			</div>
		</div>

	</div>

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

</body>
</html>