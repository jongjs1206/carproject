<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>후기글 확인</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/x-icon" href="../resources/assets/img/favicon.ico">
	
	<!-- CSS Style -->
	<link rel="stylesheet" href="../resources/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="../resources/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="../resources/assets/css/gijgo.css">
	<link rel="stylesheet" href="../resources/assets/css/slicknav.css">
	<link rel="stylesheet" href="../resources/assets/css/animate.min.css">
	<link rel="stylesheet" href="../resources/assets/css/magnific-popup.css">
	<link rel="stylesheet" href="../resources/assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="../resources/assets/css/themify-icons.css">
	<link rel="stylesheet" href="../resources/assets/css/slick.css">
	<link rel="stylesheet" href="../resources/assets/css/nice-select_eb.css">
	<link rel="stylesheet" href="../resources/assets/css/style_eb.css">
	<link rel="stylesheet" href="../resources/assets/css/responsive.css">
	
	<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
	integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
	crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.0/gsap.min.js"
	integrity="sha512-JO6JyFPJupQKZf7icgZkHwuq/rAQxH7COqvEd4WdK52AtHPedwHog05T69pIelI69jVN/zZbW6TuHfH2mS8j/Q=="
	crossorigin="anonymous"></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.0/CSSRulePlugin.min.js'></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.0/EaselPlugin.min.js"></script>
</head>
<body>

	<%@ include file="../header.jsp"%>	<!-- header -->
	<%@ include file="../side.jsp"%>	<!-- side bar -->
	
	<!-- slider Area Start-->
    <div class="slider-area">
      <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="../resources/assets/img/hero/contact_hero.jpg" >
          <div class="container">
              <div class="row ">
                  <div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
                      <div class="hero-caption">
                          <span>내 차 팔기</span>
                          <h2>후기글 확인</h2>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  	</div>	<!-- slider Area End-->
  	
  	<!--================ 글 내용 부분 =================-->
	<section class="blog_area single-post-area section-padding" style="padding:20px 0 120px 0;">
	<form>
		<div class="container">
			<div class="row">
				<div class="col-lg-11">
					<div class="reviewcarInfo" style="display:flex;">
						<div class="reviewTitle" style="padding:0 20px;"><br/>
							<h2 style="width:450px;">후기글 제목~~</h2><br/>
							<div class="carName">
								<h4>기아 올 뉴 카니발 11인승 2.2 디젤 프레스티지</h4>
							</div>
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    <div class="reviewPrice" style="margin-right: 40px; text-align:center;"><br/>
	                    	<h5 style="width:100px;">구매 가격</h5>
	                    	<div class="salesPrice">
	                    		<h4 style="color:#dca73a; margin:40px 0 20px 0;">1,220만원</h4>
	                    	</div>
	                    </div>
	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="carImg" style="margin:0 0 0 0;" >
							<img src="../resources/img/car/reviewCar.png" alt="" style=" width:200px; height:120px; padding-left:40px; white-space: pre;">
						</div>	<!-- 차 이미지 --> 
					</div>
					<hr style="margin:10px 0 10px 0;"><br/>
						<div class="col-lg-6 col-md-6 col-sm-6 col-md-3 col-sm-6" style="display: flex;">
							<div class="course__details__feature" style="width:400px; margin:0 100px 30px 0;">
								<h5 style="margin:8px 0;">기본 정보</h5><hr style="margin:20px 0 10px 0;">
								<table class="detail-info-table" style="font-size:13px; width:400px; height:200px; ">
									<tbody>
										<tr style="padding:0px; margin:0px;">
											<th scope="col">차량번호</th>
											<td>72rk6312</td>
											<th scope="col">주행거리</th>
											<td>150,000km</td>
											
										</tr>
										<tr style="padding:0px; margin:0px;">
											<th scope="col">연식</th>
											<td>2015.01</td>
											<th scope="col">연료</th>
											<td>디젤</td>
										</tr>
										<tr style="padding:0px; margin:0px;">
											<th scope="col">변속기</th>
											<td>자동</td>
											<th scope="col">배기량</th>
											<td>2,199 cc</td>
										</tr>
										<tr style="padding:0px; margin:0px;">
											<th scope="col">색상</th>
											<td>검정색</td>
										</tr>
									</tbody>
								</table>
							</div>	
						</div><br/>	<!-- end of  기본 정보-->
						<div class="col-lg-6 col-md-6 col-sm-6 col-md-3 col-sm-6">	<!-- start of 옵션 정보 -->
							<div class="course__details__feature" style="width:1000px;">
								<h5>옵선 정보</h5><hr style="margin:20px 0 10px 0">
								<div class="" style="font-size:14px; list-style-type: none !important;">	<!-- 외관 -->
									<div class="" style="background-color:#fbf9ff;">&nbsp;&nbsp;&nbsp;외관&nbsp;&nbsp;&nbsp;
										<b style="color:#f3bd00">8</b>개<hr style="margin:10px 0;">
									</div>
									<div class="" style="display: flex;">
										<ul class="optionList" >
											<li style="font-size:13px; padding:0 100px 8px 40px;">가죽시트</li> 
											<li style="font-size:13px; padding:0 100px 8px 40px;">전동시트(동승석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">열선시트(앞좌석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">엠비언트라이트</li>
										</ul>
										<ul class="optionList">
											<li style="font-size:13px; padding:0 100px 8px 40px;">가죽시트</li> 
											<li style="font-size:13px; padding:0 100px 8px 40px;">전동시트(동승석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">열선시트(앞좌석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">엠비언트라이트</li>
										</ul>
										<ul class="optionList">
											<li style="font-size:13px; padding:0 100px 8px 40px;">가죽시트</li> 
											<li style="font-size:13px; padding:0 100px 8px 40px;">전동시트(동승석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">열선시트(앞좌석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">엠비언트라이트</li>
										</ul>
										<ul class="optionList">
											<li style="font-size:13px; padding:0 100px 8px 40px;">가죽시트</li> 
											<li style="font-size:13px; padding:0 100px 8px 40px;">전동시트(동승석)</li>
										</ul>
									</div>
								</div><hr style="margin:10px 0;">	<!-- end of 외관 -->
								<div class="" style="font-size:14px; list-style-type: none !important; ">	<!-- 내관 -->
								&nbsp;&nbsp;&nbsp;내관&nbsp;&nbsp;&nbsp;<b style="color:#f3bd00">8</b>개<hr style="margin:10px 0;">
									<div class="" style="display: flex;">
										<ul class="optionList" >
											<li style="font-size:13px; padding:0 100px 8px 40px;">가죽시트</li> 
											<li style="font-size:13px; padding:0 100px 8px 40px;">전동시트(운전석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">전동시트(동승석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">열선시트(앞좌석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">엠비언트라이트</li>
										</ul>
										<ul class="optionList">
											<li style="font-size:13px; padding:0 100px 8px 40px;">가죽시트</li> 
											<li style="font-size:13px; padding:0 100px 8px 40px;">전동시트(운전석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">열선시트(앞좌석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">엠비언트라이트</li>
										</ul>
										<ul class="optionList">
											<li style="font-size:13px; padding:0 100px 8px 40px;">가죽시트</li> 
											<li style="font-size:13px; padding:0 100px 8px 40px;">전동시트(동승석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">열선시트(앞좌석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">엠비언트라이트</li>
										</ul>
										<ul class="optionList">
											<li style="font-size:13px; padding:0 100px 8px 40px;">가죽시트</li> 
											<li style="font-size:13px; padding:0 100px 8px 40px;">전동시트(동승석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">열선시트(앞좌석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">엠비언트라이트</li>
										</ul>
									</div>
								</div><hr style="margin:10px 0;">	<!-- end of 내관 -->
								<div class="" style="font-size:14px; list-style-type: none !important; ">	<!-- 안전 -->
									&nbsp;&nbsp;&nbsp;안전&nbsp;&nbsp;&nbsp;<b style="color:#f3bd00">14</b>개<hr style="margin:10px 0;">
									<div class="" style="display: flex;">
										<ul class="optionList" >
											<li style="font-size:13px; padding:0 100px 8px 40px;">가죽시트</li> 
											<li style="font-size:13px; padding:0 100px 8px 40px;">전동시트(운전석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">전동시트(동승석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">열선시트(앞좌석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">엠비언트라이트</li>
										</ul>
										<ul class="optionList">
											<li style="font-size:13px; padding:0 100px 8px 40px;">가죽시트</li> 
											<li style="font-size:13px; padding:0 100px 8px 40px;">전동시트(운전석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">전동시트(동승석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">열선시트(앞좌석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">엠비언트라이트</li>
										</ul>
										<ul class="optionList">
											<li style="font-size:13px; padding:0 100px 8px 40px;">가죽시트</li> 
											<li style="font-size:13px; padding:0 100px 8px 40px;">전동시트(운전석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">전동시트(동승석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">열선시트(앞좌석)</li>
										</ul>
										<ul class="optionList">
											<li style="font-size:13px; padding:0 100px 8px 40px;">가죽시트</li> 
											<li style="font-size:13px; padding:0 100px 8px 40px;">전동시트(운전석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">전동시트(동승석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">엠비언트라이트</li>
										</ul>
									</div>
								</div><hr style="margin:10px 0;">	<!-- end of 안전 -->
								<div class="" style="font-size:14px; list-style-type: none !important; ">	<!-- 편의 -->
									&nbsp;&nbsp;&nbsp;편의&nbsp;&nbsp;&nbsp;<b style="color:#f3bd00">12</b>개<hr style="margin:10px 0;">
									<div class="" style="display: flex;">
										<ul class="optionList" >
											<li style="font-size:13px; padding:0 100px 8px 40px;">가죽시트</li> 
											<li style="font-size:13px; padding:0 100px 8px 40px;">전동시트(운전석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">전동시트(동승석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">열선시트(앞좌석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">엠비언트라이트</li>
										</ul>
										<ul class="optionList">
											<li style="font-size:13px; padding:0 100px 8px 40px;">열선시트(앞좌석)</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">통풍시트</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">메모리시트</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">폴딩시트</li>
										</ul>
										<ul class="optionList">
											<li style="font-size:13px; padding:0 100px 8px 40px;">마사지시트</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">워크인시트</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">요추받침</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">하이패스룸미러</li>
										</ul>
										<ul class="optionList">
											<li style="font-size:13px; padding:0 100px 8px 40px;">ECM룸미러</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">뒷자석에어벤트</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">패들쉬프트</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">전동햇빛가리개</li>
										</ul>
									</div>
								</div><hr style="margin:10px 0;">	<!-- end of 편의 -->
								<div class="" style="font-size:14px; list-style-type: none !important; ">	<!-- 멀티미디어 -->
									&nbsp;&nbsp;&nbsp;멀티미디어&nbsp;&nbsp;&nbsp;<b style="color:#f3bd00">12</b>개<hr style="margin:10px 0;">
									<div class="" style="display: flex;">
										<ul class="optionList" >
											<li style="font-size:13px; padding:0 100px 8px 40px;">ECM룸미러</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">뒷자석에어벤트</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">패들쉬프트</li>
										</ul>
										<ul class="optionList">
											<li style="font-size:13px; padding:0 100px 8px 40px;">ECM룸미러</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">뒷자석에어벤트</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">패들쉬프트</li>
										</ul>
										<ul class="optionList">
											<li style="font-size:13px; padding:0 100px 8px 40px;">ECM룸미러</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">뒷자석에어벤트</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">패들쉬프트</li>
										</ul>
										<ul class="optionList">
											<li style="font-size:13px; padding:0 100px 8px 40px;">ECM룸미러</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">뒷자석에어벤트</li>
											<li style="font-size:13px; padding:0 100px 8px 40px;">패들쉬프트</li>
										</ul>
									</div>
								</div>	<!-- end of 멀티미디어 -->
							</div>
						</div><br/><br/>	<!-- end of 옵션 정보 -->
						<div class="section-top-border" >
							<h3 class="mb-30">후기</h3>
							<div class="reviewContext">
								<div class="col-lg-12" >
									<blockquote class="generic-blockquote" id="reviewText" style="width:1000px;">
										후기 내용~~~~
									</blockquote>
								</div>
							</div>
						</div>	<!-- end of 후기글 -->
				</div>	<!-- end of 왼쪽부분 -->
			</div>	<!-- end of row -->
			<div class="reviewModifyBtn" style="margin:50px 0;">	<!-- 수정하기 버튼 -->
		    	<a href="../user/review.do"><span style="margin-left:500px;">수정하기</span></a>
		    </div>
			<!-- <div class="col-lg-16 text-center">
				<a href="#">
			    <button type="submit" class="modifyBtn" 
					style="border-radius: 12px; background-color:#dca73a; border:0; color:white; text-align:center; 
				    width:100px; height:50px; margin:20px 0 30px;">
			        수정하기</button></a>
			</div> -->
		</div>
		</form>
	</section>	<!--================ 후기글 end =================-->
   
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