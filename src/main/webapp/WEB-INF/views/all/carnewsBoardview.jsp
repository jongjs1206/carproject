<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 자동차 뉴스 </title>
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
<link rel="stylesheet" type="text/css" href="../resources/css/all/newsview.css">

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
<script type="text/javascript" src="../resources/js/all/news.js"></script>
</head>
<body>

	<%@ include file="../header.jsp"%>	<!-- header -->
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	
	<input type="hidden" class='login_on' value='${sessionScope.info.m_id}'/>	

	<!-- slider Area Start-->
	<div class="slider-area">
		<div
			class="single-slider hero-overly slider-height2 d-flex align-items-center"
			data-background="../resources/img/top3.jpg">
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
	<input type="hidden" class='news_num'  value='${news_num}'/>
   <!--================Blog Area =================-->
   <section class="blog_area single-post-area section-padding">
      <div class="container" style="display:flex; justify-content: center;">
         <div class="row">
            <div class="col-12 posts-list">
            <div>
				<a href="../all/carnewsBoardList.do?page=1" class="blog_details">목록보기</a>
			</div>
               <div class="single-post">
                  <div>
	                  <div>
						<hr/>
						<div style="display: flex; justify-content: space-between;">
		                     <h2 class='news_title'>${newsview.title}</h2>
		                     <div>${fn:substring(newsview.w_date, 0, 16)}
		                     <br>좋아요
		                     <c:if test="${heart_ok eq null}">
		                     	<button class='good_btn'><i class="far fa-thumbs-up">
								<input class='good_me' type="hidden" value='off'/>
		                     </c:if>
		                     <c:if test="${heart_ok ne null}">
		                     	<button class='good_btn'><i class="far fa-thumbs-up color-red">
								<input class='good_me' type="hidden" value='on'/>
		                     </c:if>
		                     
		                     <span class='love_cnt'>${newsview.love_cnt}</span></i></button></div>
						</div>
	                    <hr/>
	                     <div class='news_content'>
		                     ${newsview.content}
	                     </div>
	                  </div>

				<div class="comment-form">
                  <h4>Leave a Reply</h4>
                  
                     <div class="row">
                        <div class="col-12">
                           <div class="form-group">
                              <textarea
                              class="form-control w-100" name="content" id="content" cols="30" rows="9"
                                 placeholder="코멘트를 남겨주세요."></textarea>
                           </div>
                        </div>
                     </div>
                     <div class="form-group">
                        <button class="button button-contactForm btn_1 boxed-btn">등록하기</button>
                     </div>
           
               </div>
               
               
               <!-- 댓글 -->
               <div class="comments-area">
				<!-- 여기에 DB 내용 가져오기 ↓↓↓↓↓ -->           
                  <div class="comment-list">
                  	<c:forEach var="reply_on" items="${reply}">
                  		<div class='reply_list'>
                  			<i class="fas fa-user-circle"></i> 
                  			<div class='reply_name_content'>
                  				<div>
                  					${reply_on.m_name} 
                  					<span style="color:#909092; margin-left: 10px;">${fn:substring(reply_on.w_date, 0, 16)}</span>
                  					<c:if test="${sessionScope.info.m_id eq reply_on.writer}">
                  						<a style=" cursor:pointer; margin-left: 10px;">수정</a>
                  						<a style=" cursor:pointer; margin-left: 10px;">삭제</a>
                  					</c:if>
                  					<input type="hidden" value='${reply_on.r_id}'/> 
                  				</div>
                  				<div>
                  					${reply_on.content}
                  				</div>
                  			</div>
                  		</div>
                  	</c:forEach>
                  </div>
                </div>
   </section>
   <!--================ Blog Area end =================-->



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