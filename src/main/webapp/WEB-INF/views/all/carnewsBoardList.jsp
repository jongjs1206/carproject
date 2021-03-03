<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I 자동차 뉴스 </title>
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
<link rel="stylesheet" type="text/css" href="../resources/css/all/news.css">

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


</head>
<body>

	<%@ include file="../header.jsp"%>	<!-- header -->
	<%@ include file="../side.jsp"%>	<!--side menu -->
	
	<!-- slider Area Start-->
    <div class="slider-area">
      <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="../resources/assets/img/hero/contact_hero.jpg" >
          <div class="container">
              <div class="row ">
                  <div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
                      <div class="hero-caption">
                          <span>자동차 관련 최신 기사를 제공합니다. </span>
                          <h2>자동차 뉴스</h2>
                      </div>
                  </div>
              </div>
          </div>
      </div>
	</div>	
	<!-- slider Area End-->
	
	<input type="hidden" class='login_on' value='${sessionScope.info.m_id}'/>	


    <!--================Blog Area =================-->
    <section class="blog_area section-padding">
        <div class="container">
            
			<div class="blog_item_date blog_item_img">
			        <h3>인기 뉴스</h3>
			</div>
			
			<!-- 이 안에 DB 내용 가져올 예정 ↓↓↓↓↓  -->
			<a href="../all/carnewsBoardview.do">
				<div class="fav-news">
					<span>인기뉴스 제목 인기뉴스 제목 인기뉴스 제목 인기뉴스 제목 </span>
					<span>조회수</span>
					<span>추천수</span>			
				</div>
			</a>
			
			<a href="../all/carnewsBoardview.do">
				<div class="fav-news">
					<span>인기뉴스 제목 인기뉴스 제목 인기뉴스 제목 인기뉴스 제목 </span>
					<span>조회수</span>
					<span>추천수</span>			
				</div>
			</a>
			
			<a href="../all/carnewsBoardview.do">
				<div class="fav-news">
					<span>인기뉴스 제목 인기뉴스 제목 인기뉴스 제목 인기뉴스 제목 </span>
					<span>조회수</span>
					<span>추천수</span>			
				</div>
			</a>
			<!-- 이 안에 DB 내용 가져올 예정 ↑↑↑↑↑  -->						
			
			<div class="blank" alt="여백공간">
				<input type="hidden" class="blank"/>
			</div>
			
			<div class="news-info">
				<span>제목</span>
				<span>조회수</span>
				<span>추천수</span>
			</div>
			
			<!-- 이 안에 DB 내용 가져올 예정 ↓↓↓↓↓  -->
			<div class="blog_details news-container">
			    <a class="d-inline-block news-thumb" href="../all/carnewsBoardview.do">
		    		<img src="../resources/img/newsimg.jpg" alt="기사썸네일">
	    		</a>
	    		<a class="d-inline-block" href="../all/carnewsBoardview.do">
			        <h2>기사제목 기사제목 기사제목 기사제목</h2>
			    	<p>기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 </p>
		    	</a>
		    	<div class="cnt">12</div>
		    	<div class="cnt">6</div>
			</div>
			<!-- 이 안에 DB 내용 가져올 예정 ↑↑↑↑↑  -->	
			
			<div class="blog_details news-container">
			    <a class="d-inline-block news-thumb" href="../all/carnewsBoardview.do">
		    		<img src="../resources/img/newsimg.jpg" alt="기사썸네일">
	    		</a>
	    		<a class="d-inline-block" href="../all/carnewsBoardview.do">
			        <h2>기사제목 기사제목 기사제목 기사제목</h2>
			    	<p>기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 </p>
		    	</a>
		    	<div class="cnt">12</div>
		    	<div class="cnt">6</div>
			</div>
	            
			<div class="blog_details news-container">
			    <a class="d-inline-block news-thumb" href="../all/carnewsBoardview.do">
		    		<img src="../resources/img/newsimg.jpg" alt="기사썸네일">
	    		</a>
	    		<a class="d-inline-block" href="../all/carnewsBoardview.do">
			        <h2>기사제목 기사제목 기사제목 기사제목</h2>
			    	<p>기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 기사내용 </p>
		    	</a>
		    	<div class="cnt">12</div>
		    	<div class="cnt">6</div>
			</div>
			
            
        </div>
    </section>

	<!-- ### 페이징 시작 ### -->
	<nav class="blog-pagination justify-content-center d-flex">
	    <ul class="pagination">
	        <li class="page-item">
	            <a href="#" class="page-link" aria-label="Previous">
	                <i class="ti-angle-left"></i>
	            </a>
	        </li>
	        <li class="page-item">
	            <a href="#" class="page-link">1</a>
	        </li>
	        <li class="page-item active">
	            <a href="#" class="page-link">2</a>
	        </li>
	        <li class="page-item">
	            <a href="#" class="page-link" aria-label="Next">
	                <i class="ti-angle-right"></i>
	            </a>
	        </li>
	    </ul>
	</nav>
	<!-- ### 페이징 끝 ### -->
                
	<section class="blog_area section-padding">       
		<div class="container">         
			<form action="#">
			    <div class="form-group">
			        <div class="news-search-container">
			        	<select>
		     				<option value="title">제목</option>
							<option value="content">내용</option>
			        	</select>
			            <input type="text" class="form-control" placeholder='Search Keyword'
			                onfocus="this.placeholder = ''"
			                onblur="this.placeholder = 'Search Keyword'">
				        <button class="button primary-bg text-white btn_1 boxed-btn"
					        type="submit">검색</button>
			        </div>
			    </div>
			</form>
		</div>
	</section>
    <!--================Blog Area =================-->



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