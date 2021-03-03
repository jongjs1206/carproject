<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>글 확인</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/x-icon" href="../resources/assets/img/favicon.png">
	
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
	
	<script type="text/javascript" src="../resources/js/all/sales.js"></script>
</head>
<body>

	<%@ include file="../header.jsp"%>	<!-- header -->
	<%@ include file="../side.jsp"%>	<!-- side bar -->
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" class='login_on' value='${sessionScope.info.m_id}'/>
	
	<!-- slider Area Start-->
    <div class="slider-area">
      <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="../resources/assets/img/hero/contact_hero.jpg" >
          <div class="container">
              <div class="row ">
                  <div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
                      <div class="hero-caption">
                          <span>내 차 팔기</span>
                          <h2>글 확인</h2>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  	</div>	<!-- slider Area End-->
  	
	<!--================ 글 내용 부분 =================-->
	<section class="blog_area single-post-area section-padding">
	<form>
		<div class="container">
			<div class="row">
				<div class="col-lg-7">
					<div class="carImg" style="margin:0 0 0 0;">
					<div class="row justify-content-center">
					<div class="h1-testimonial-active slick-initialized slick-slider">
						<button type="button" class="slick-prev slick-arrow" style="display: block;"><i class="ti-angle-left"></i></button>
						<img src="../resources/img/car/ex_car1.jpg" alt=""><hr style="margin:10px 0 10px 0;">	<!-- 차 대표 이미지 -->
						<button type="button" class="slick-next slick-arrow" style="display: block;"><i class="ti-angle-right"></i></button>
	                </div></div>
	                    <div class="thumbnail" style="display: flex; flex-wrap: wrap; margin:0 0 0 45px;" > <!-- 썸네일 -->
						<%
							for(int i = 1; i <= 20; i++){
						%>
						<div style="width: 9%; margin:0 1px 1px 0;">
							<img style="width: 100%; margin: 0px" src="../resources/img/car/ex_car<%=i%>.jpg">
		                </div>
						<% 
						}
						%>
						</div><br/><br/>	<!-- end of 썸네일 -->
					</div><!-- 이미지 -->
						<div class="col-lg-6 col-md-6 col-sm-6 col-md-3 col-sm-6" style="display: flex;">
							<div class="course__details__feature" style="width:500px; margin:0 100px 30px 0;">
								<h5>기본 정보</h5><hr style="margin:20px 0 10px 0;">
								<table class="detail-info-table" style="font-size:13px; width:500px; height:200px; ">
									<tbody>
										<c:forEach var="sales" items="${sales}">	<!-- 여기 확인!!! -->
											<tr style="padding:0px; margin:0px;">
												<th scope="col">차량 번호</th>
												<td>${sales.carNumber}</td>
												<th scope="col">주행거리</th>
												<td>${sales.km}</td>
											</tr>
											<tr style="padding:0px; margin:0px;">
												<th scope="col">연식</th>
												<td>${sales.carYear}</td>
												<th scope="col">연료</th>
												<td>${sales.carFuel}</td>
											</tr>
											<tr style="padding:0px; margin:0px;">
												<th scope="col">변속기</th>
												<td>${car.carGear}</td>
												<th scope="col">배기량</th>
												<td>${car.cc}</td>
											</tr>
											<tr style="padding:0px; margin:0px;">
												<th scope="col">색상</th>
												<td>${sales.carColor}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>	
							<div class="course__details__feature" style="width:500px; margin:0 100px 30px 0;">
								<h5>보험 처리 이력</h5><hr style="margin:20px 0 10px 0;">
								&nbsp;&nbsp;&nbsp;<span style="color:#0c2b4b; font-size:13px;"><i class="fas fa-file-alt fa-2x"></i>
								&nbsp;&nbsp;&nbsp;보험처리 <b style="color:#f3bd00; font-size:13px;">2</b>회</span><hr style="margin:10px 0;">
								<table class="detail-info-table" style="font-size:13px; width:600px; height:200px; ">
									<tbody>
										<c:forEach var="sales" items="${sales}">	<!-- accident -->
											<tr style="padding:0px; margin:0px;">
												<th scope="col">차량번호/소유자변경</th>
												<td>0회 / 1회</td>
											</tr>
											<tr style="padding:0px; margin:0px;">
												<th scope="col">자동차보험 특수사고</th>
												<td>전손: 1 / 침수전손 : 0 / 침수분손 : 0 / 도난: 0</td>
											</tr>
											<tr style="padding:0px; margin:0px;">
												<th scope="col">보험사고(내차피해)</th>
												<td>1회(0원)</td>
											</tr>
											<tr style="padding:0px; margin:0px;">
												<th scope="col">보험사고(타차가해)</th>
												<td>1회(0원)</td>
											</tr>
											<tr style="padding:0px; margin:0px;">
												<th scope="col">보험이력 공개일</th>
												<td>2020-12-25</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>	
						</div><br/>	<!-- end of  기본 정보-->
						<div class="col-lg-6 col-md-6 col-sm-6 col-md-3 col-sm-6" style="display: flex;">
							<div class="course__details__feature" style="width:500px; margin:0 100px 30px 0;">
								<h5>시세 정보</h5><hr style="margin:20px 0 10px 0;">
								<div class="marketPrice" style="font-size:13px; width:500px; height:200px; display: flex;">
									<div>
										
									</div>
								</div>
							</div>	<!-- end of 시세 정보 -->
							<div class="course__details__feature" style="width:500px; height:200px;" >
								<h5>시세 예측</h5><hr style="margin:20px 0 10px 0;">
								<div class="marketPredict" style="font-size:13px; width:500px; height:200px; display: flex;">
								</div>
							</div>	<!-- end of 시세 예측 -->
						</div><br/>	<!-- end of 시세 정보 / 예측 -->
						<div class="col-lg-6 col-md-6 col-sm-6 col-md-3 col-sm-6">	<!-- start of 옵션 정보 -->
							<div class="course__details__feature" style="width:1000px;">	<!-- alloption 리스트 쓰면 됨 -->
								<h5>옵선 정보</h5><hr style="margin:20px 0 10px 0">
								<div class="" style="font-size:14px; list-style-type: none !important; ">	<!-- 외관 -->
								&nbsp;&nbsp;&nbsp;외관&nbsp;&nbsp;&nbsp;<b style="color:#f3bd00">8</b>개<hr style="margin:10px 0;">
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
						<div class="section-top-border">
							<h3 class="mb-30">차량 설명</h3>
							<div class="salesContext">
								<div class="col-lg-12">
									<blockquote class="generic-blockquote"  style="width:1000px;">
										<c:forEach var="sales" items="${sales}">
											${sales.salesContext}
										</c:forEach>
									</blockquote>
								</div>
							</div>
						</div>	<!-- end of 차량 설명글 -->
					
				</div>	<!-- end of 왼쪽부분 -->
				<div class="col-lg-5">	<!-- start of 오른쪽 위 -->
	            	<div class="course__details__sidebar">
	                	<div class="rightSideTop1" style="border:1px solid #9d9d9d;"><br/>
	                	<c:forEach var="sales" items="${sales}">
	                        <div class="carNameInfo"><h4 style="text-align:center">${sales.title}</h4></div>
	                        <div class="carInfo"><h6 style="text-align:center">${sales.carYear} | ${sales.km} | ${sales.carFuel}</h6></div>
	                        <span><b class="salesPrice" style="color:#dca73a">
	                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sales.salesPrice}</b>만원</span><br/><br/>
	                        <div class="carInfo1">
		                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                        <span style="color:#112e41; font-size:11px;"><i class="fas fa-tools fa-2x"></i>	<!-- 성능 -->
		                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                        <i class="fas fa-file-alt fa-2x"></i>	<!-- 보험이력 -->
		                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <b class="percent">91</b><canvas height="40" width="40">	<!-- 신차대비 -->
								</canvas><br/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								성능점검
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								보험이력 2건
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;
								신차대비
	                            </span>
	                        </div><br/>	<!-- end of 차 정보 -->
	                    </c:forEach>
	                    </div><br/>
	                    <div class="rightSideTop2" style="border:1px solid #9d9d9d;"><br/>	<!-- 판매자 정보 -->
	                        <div class="salesManInfo">
	                        	<h4 style="color:#dca73a;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;판매자 정보</h4>
	                        	<div class="salesPerson" style="display:flex;">
	                        	<c:forEach var="sales" items="${sales}">
				           			<img src="../resources/assets/img/logo/testimonial.png" alt="" style="width:110px; height:110px; margin:10px 30px 20px 50px;">
				           			<div class="salesMan"><br/><br/>
				           				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.info.m_name}(${sessionScope.info.m_id})<br/>
					           			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.info.tel}
				                	</div>
				                </c:forEach>
				           		</div> 
				            </div>
	                    </div>	<!-- end of 판매자 정보 -->
				        <div class="favorite" style="font-size:13px; display:flex; margin:5px 0 0 0;">
					        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			               	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				        	<div class="sendMessage">	<!-- 쪽지 보내기 -->
				        		<span style="color:#dca73a"><i class="fas fa-comment-dots fa-flip-horizontal"></i></span>
				        		&nbsp;쪽지보내기&nbsp;&nbsp;
				        	</div>	<!-- end of 쪽지보내기 -->
				        	<div class="">	<!-- 찜하기 -->
				        		<span style="color:#112e42"><i class="far fa-heart"></i></span>	<!-- 빈 하트 -->	
				        	</div>	<!-- end of 찜하기 -->
				        <!-- <span style="color:#f3bd00"><i class="fas fa-heart"></i></span> -->	<!-- 노란 하트 -->
				        	 &nbsp;찜하기
				        </div>	<!-- end of 찜하기 -->
	                </div>	<!-- end of 차 / 판매자 정보 -->
				</div>	<!-- end of 오른쪽 위 -->
			</div>	<!-- end of row -->
			<div class="col-lg-16 text-center">
				<a href="#">
			    <button type="submit" class="modifyBtn" 
					style="border-radius: 12px; background-color:#dca73a; border:0; color:white; text-align:center; 
				    width:100px; height:50px; margin:20px 0 30px;">
			        수정하기</button></a>
		    </div>
		</div>
		</form>
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