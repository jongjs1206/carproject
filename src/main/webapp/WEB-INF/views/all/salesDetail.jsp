<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.carproject.domain.*" %>
<%@ page import="java.sql.*" %>

<%
	String sell_id = request.getParameter("num");
	String status = request.getParameter("status");
	SalesVO vo = new SalesVO();
	vo.setSell_id(Integer.parseInt(sell_id));
	vo.setStatus(status);
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>상세글 확인</title>
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
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
	<link rel="stylesheet" href="../resources/css/all/homepage.css" type="text/css">
	<link rel="stylesheet" href="../resources/css/all/product_list.css" type="text/css">
	<link rel="stylesheet" href="../resources/css/all/salesDetail.css" type="text/css">
	<link rel="stylesheet" href="../resources/assets/css/style.css">
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
	<%@ include file="../side.jsp"%>	<!-- 최근 본 목록 -->
	
	<input type="hidden" class='login_on' value='${sessionScope.info.m_id}'/>
	
	<!-- slider Area Start-->
    <div class="slider-area">
      <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="../resources/img/detail.jpg" >
          <div class="container">
              <div class="row">
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
  	
	<!--====================== 글 내용 부분 =======================-->
	<section class="blog_area single-post-area section-padding">
	<form class="salesDetailForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div class="container">
			<div class="row">
				<div class="col-lg-7">
					<div class="carImgs" style="margin:0 0 0 0;">
						<div class="carImg"> 	<!-- 차 이미지 -->
							<img id="carimg" src="${mainphoto}img1.png" alt="" style="width:600px; height:420px; margin-left:30px;"/> 	<!-- 메인 이미지 크기 고정 -->
	                	</div><hr style="margin:10px 0 10px 0;">
	                	<!-- ----------------썸네일---------------- -->
	                    <div class="thumbnail" style="display: flex; flex-wrap: wrap; margin:0 0 0 20px;" >
		                    <c:forEach items="${allphoto}" var="thumbUrl"> 
								<div style="margin:3px;">
									<img class="thumbImg" style="width: 97px; height:73px; margin: 0px; cursor:pointer;" 
										src="${thumbUrl.url}" onclick="imgClick(this);" onerror="this.parentNode.style.display='none'">
					            </div>
					        </c:forEach>
						</div><br/><br/>	
						<!-- end of 썸네일 -->
					</div><!-- 이미지 -->
						<div class="col-lg-6 col-md-6 col-sm-6 col-md-3 col-sm-6" style="display: flex;">
							<div class="course__details__feature" style="width:500px; margin:0 80px 30px 0;">
								<h5>기본 정보</h5><hr style="margin:20px 0 10px 0;">
								<table class="detail-info-table" style="font-size:14px; width:500px; height:200px; margin-left:15px;">
									<tbody>
										<tr style="padding:0px; margin:0px;">
											<th scope="col">차량 번호</th>
												<td>${sales.vehicle_num}</td>
												<th scope="col">주행거리(km)</th>
												<td>${sales.mile}</td>
											</tr>
											<tr style="padding:0px; margin:0px;">
												<th scope="col">연식</th>
												<td>${sales.old}</td>
												<th scope="col">연료</th>
												<td>${sales.fuel}</td>
											</tr>
											<tr style="padding:0px; margin:0px;">
												<th scope="col">변속기</th>
												<td>${sales.gear}</td>
												<th scope="col">배기량(cc)</th>
												<td>${sales.baeki}</td>
											</tr>
											<tr style="padding:0px; margin:0px;">
												<th scope="col">색상</th>
												<td>${sales.color}</td>
											</tr>
									</tbody>
								</table>
							</div>	
						</div><br/>	<!-- end of  기본 정보-->
						<div class="col-lg-6 col-md-6 col-sm-6 col-md-3 col-sm-6" style="display: flex;">
							<div class="course__details__feature">
								<h5>시세 정보 및 예측</h5><hr style="margin:20px 0 10px 0; width:1000px;">
								<div class="marketPredict" style="font-size:14px; width:1000px;">
									<div class="card-body" style="display: flex;">
										<canvas id="predict_price" width="700" height="350">
			                            	<!-- 선 그래프 -->
			                            </canvas>
			                          	<span style="width:300px; font-size:18px; margin: 100px 0 0 50px; text-align:right;">
				                            &nbsp;현재 <fmt:formatNumber value="${fn:split(sales.p_price,'.')[0]}" pattern="#,###" />만원<br/>
				                            2년 후 <fmt:formatNumber value="${fn:split(sales.after2_price,'.')[0]}" pattern="#,###" />만원<br/>				                            
				                            4년 후 <fmt:formatNumber value="${fn:split(sales.after4_price,'.')[0]}" pattern="#,###" />만원<br/>				                            
				                            6년 후 <fmt:formatNumber value="${fn:split(sales.f_price,'.')[0]}" pattern="#,###" />만원<br/>				                            
			                            </span>
									</div>
								</div>
							</div>	
						</div><br/><br/>	<!-- end of 시세 예측 -->
						<div class="col-lg-6 col-md-6 col-sm-6 col-md-3 col-sm-6">	<!-- start of 옵션 정보 -->
							<div class="course__details__feature" style="width:1000px;">	
								<h5>옵선 정보</h5><hr style="margin:20px 0 10px 0">
								<div class="selectOptions" style="font-size:15px; list-style-type: none !important; ">	
								&nbsp;&nbsp;&nbsp;외관&nbsp;&nbsp;&nbsp;<hr style="margin:10px 0;">
									<div class="outside" style="display: flex;">	<!-- 외관 -->
										<ul class="optionList" style="font-size:14px;" >
											<c:forEach var="i" begin="0" end="3">										
												<c:if test="${result_option.get(i) ne '0'}">	<!--옵션의 값이 1일때(체크O) 빨간체크 + 검은색 -->
													<li style="font-size:14px; padding:0 80px 8px 54px;"><i class="fas fa-check" style="color:red"></i>${option_name[i]}</li>
												</c:if>
												<c:if test="${result_option.get(i) eq '0'}">	<!--옵션의 값이 0일때(체크X) 회색 -->
													<li style="color:#929292; font-size:14px; padding:0 80px 8px 54px;">${option_name[i]}</li> 
												</c:if>
											</c:forEach>
										</ul>
										<ul class="optionList" >	
											<c:forEach var="i" begin="4" end="7">										
												<c:if test="${result_option.get(i) ne '0'}">	<!--옵션의 값이 1일때(체크O) 빨간체크 + 검은색 -->
													<li style="font-size:14px; padding:0 80px 8px 54px;"><i class="fas fa-check" style="color:red"></i>${option_name[i]}</li>
												</c:if>
												<c:if test="${result_option.get(i) eq '0'}">	<!--옵션의 값이 0일때(체크X) 회색 -->
													<li style="color:#929292; font-size:14px; padding:0 80px 8px 54px;">${option_name[i]}</li> 
												</c:if>
											</c:forEach>
										</ul>
										<ul class="optionList" >
											<c:forEach var="i" begin="8" end="11">										
												<c:if test="${result_option.get(i) ne '0'}">	<!--옵션의 값이 1일때(체크O) 빨간체크 + 검은색 -->
													<li style="font-size:14px; padding:0 80px 8px 54px;"><i class="fas fa-check" style="color:red"></i>${option_name[i]}</li>
												</c:if>
												<c:if test="${result_option.get(i) eq '0'}">	<!--옵션의 값이 0일때(체크X) 회색 -->
													<li style="color:#929292; font-size:14px; padding:0 80px 8px 54px;">${option_name[i]}</li> 
												</c:if>
											</c:forEach>
										</ul>
										<ul class="optionList">
											<c:forEach var="i" begin="12" end="13">										
												<c:if test="${result_option.get(i) ne '0'}">	<!--옵션의 값이 1일때(체크O) 빨간체크 + 검은색 -->
													<li style="font-size:14px; padding:0 80px 8px 54px;"><i class="fas fa-check" style="color:red"></i>${option_name[i]}</li>
												</c:if>
												<c:if test="${result_option.get(i) eq '0'}">	<!--옵션의 값이 0일때(체크X) 회색 -->
													<li style="color:#929292; font-size:14px; padding:0 80px 8px 54px;">${option_name[i]}</li> 
												</c:if>
											</c:forEach>
										</ul>
										</div>
								</div><hr style="margin:10px 0;">	
								<!-- end of 외관 -->
								<div class="" style="font-size:14px; list-style-type: none !important; ">	
								<!-- 내관 -->
								&nbsp;&nbsp;&nbsp;내관&nbsp;&nbsp;&nbsp;<hr style="margin:10px 0;">
									<div class="inside" style="display: flex;">
										<ul class="optionList" >
											<c:forEach var="i" begin="14" end="18">										
												<c:if test="${result_option.get(i) ne '0'}">	<!--옵션의 값이 1일때(체크O) 빨간체크 + 검은색 -->
													<li style="font-size:14px; padding:0 80px 8px 54px;"><i class="fas fa-check" style="color:red"></i>${option_name[i]}</li>
												</c:if>
												<c:if test="${result_option.get(i) eq '0'}">	<!--옵션의 값이 0일때(체크X) 회색 -->
													<li style="color:#929292; font-size:14px; padding:0 80px 8px 54px;">${option_name[i]}</li> 
												</c:if>
											</c:forEach>										
										</ul>
										<ul class="optionList">
											<c:forEach var="i" begin="19" end="22">										
												<c:if test="${result_option.get(i) ne '0'}">	<!--옵션의 값이 1일때(체크O) 빨간체크 + 검은색 -->
													<li style="font-size:14px; padding:0 80px 8px 40px;"><i class="fas fa-check" style="color:red"></i>${option_name[i]}</li>
												</c:if>
												<c:if test="${result_option.get(i) eq '0'}">	<!--옵션의 값이 0일때(체크X) 회색 -->
													<li style="color:#929292; font-size:14px; padding:0 80px 8px 40px;">${option_name[i]}</li> 
												</c:if>
											</c:forEach>
										</ul>
										<ul class="optionList">
											<c:forEach var="i" begin="23" end="26">										
												<c:if test="${result_option.get(i) ne '0'}">	<!--옵션의 값이 1일때(체크O) 빨간체크 + 검은색 -->
													<li style="font-size:14px; padding:0 80px 8px 54px;"><i class="fas fa-check" style="color:red"></i>${option_name[i]}</li>
												</c:if>
												<c:if test="${result_option.get(i) eq '0'}">	<!--옵션의 값이 0일때(체크X) 회색 -->
													<li style="color:#929292; font-size:14px; padding:0 80px 8px 54px;">${option_name[i]}</li> 
												</c:if>
											</c:forEach>
										</ul>
										<ul class="optionList">
											<c:forEach var="i" begin="27" end="30">										
												<c:if test="${result_option.get(i) ne '0'}">	<!--옵션의 값이 1일때(체크O) 빨간체크 + 검은색 -->
													<li style="font-size:14px; padding:0 80px 8px 45px;"><i class="fas fa-check" style="color:red"></i>${option_name[i]}</li>
												</c:if>
												<c:if test="${result_option.get(i) eq '0'}">	<!--옵션의 값이 0일때(체크X) 회색 -->
													<li style="color:#929292; font-size:14px; padding:0 80px 8px 45px;">${option_name[i]}</li> 
												</c:if>
											</c:forEach>
										</ul>
									</div>
								</div><hr style="margin:10px 0;">	
								<!-- end of 내관 -->
								<div class="" style="font-size:14px; list-style-type: none !important; ">	
								<!-- 안전 -->
									&nbsp;&nbsp;&nbsp;안전&nbsp;&nbsp;&nbsp;<hr style="margin:10px 0;">
									<div class="safe" style="display: flex;">
										<ul class="optionList">
											<c:forEach var="i" begin="31" end="35">										
												<c:if test="${result_option.get(i) ne '0'}">	<!--옵션의 값이 1일때(체크O) 빨간체크 + 검은색 -->
													<li style="font-size:14px; padding:0 80px 8px 54px;"><i class="fas fa-check" style="color:red"></i>${option_name[i]}</li>
												</c:if>
												<c:if test="${result_option.get(i) eq '0'}">	<!--옵션의 값이 0일때(체크X) 회색 -->
													<li style="color:#929292; font-size:14px; padding:0 80px 8px 54px;">${option_name[i]}</li> 
												</c:if>
											</c:forEach>
										</ul>
										<ul class="optionList">
											<c:forEach var="i" begin="36" end="40">										
												<c:if test="${result_option.get(i) ne '0'}">	<!--옵션의 값이 1일때(체크O) 빨간체크 + 검은색 -->
													<li style="font-size:14px; padding:0 80px 8px 50px;"><i class="fas fa-check" style="color:red"></i>${option_name[i]}</li>
												</c:if>
												<c:if test="${result_option.get(i) eq '0'}">	<!--옵션의 값이 0일때(체크X) 회색 -->
													<li style="color:#929292; font-size:14px; padding:0 80px 8px 50px;">${option_name[i]}</li> 
												</c:if>
											</c:forEach>
										</ul>
										<ul class="optionList">
											<c:forEach var="i" begin="41" end="44">										
												<c:if test="${result_option.get(i) ne '0'}">	<!--옵션의 값이 1일때(체크O) 빨간체크 + 검은색 -->
													<li style="font-size:14px; padding:0 80px 8px 25px;"><i class="fas fa-check" style="color:red"></i>${option_name[i]}</li>
												</c:if>
												<c:if test="${result_option.get(i) eq '0'}">	<!--옵션의 값이 0일때(체크X) 회색 -->
													<li style="color:#929292; font-size:14px; padding:0 80px 8px 25px;">${option_name[i]}</li> 
												</c:if>
											</c:forEach>
										</ul>
										<ul class="optionList">
											<c:forEach var="i" begin="45" end="48">										
												<c:if test="${result_option.get(i) ne '0'}">	<!--옵션의 값이 1일때(체크O) 빨간체크 + 검은색 -->
													<li style="font-size:14px; padding:0 80px 8px 70px;"><i class="fas fa-check" style="color:red"></i>${option_name[i]}</li>
												</c:if>
												<c:if test="${result_option.get(i) eq '0'}">	<!--옵션의 값이 0일때(체크X) 회색 -->
													<li style="color:#929292; font-size:14px; padding:0 80px 8px 70px;">${option_name[i]}</li> 
												</c:if>
											</c:forEach>
										</ul>
									</div>
								</div><hr style="margin:10px 0;">	
								<!-- end of 안전 -->
								<div class="" style="font-size:14px; list-style-type: none !important; ">	
								<!-- 편의 -->
									&nbsp;&nbsp;&nbsp;편의&nbsp;&nbsp;&nbsp;<hr style="margin:10px 0;">
									<div class="comfort" style="display: flex;">
										<ul class="optionList">
											<c:forEach var="i" begin="49" end="53">										
												<c:if test="${result_option.get(i) ne '0'}">	<!--옵션의 값이 1일때(체크O) 빨간체크 + 검은색 -->
													<li style="font-size:14px; padding:0 80px 8px 54px;"><i class="fas fa-check" style="color:red"></i>${option_name[i]}</li>
												</c:if>
												<c:if test="${result_option.get(i) eq '0'}">	<!--옵션의 값이 0일때(체크X) 회색 -->
													<li style="color:#929292; font-size:14px; padding:0 80px 8px 54px;">${option_name[i]}</li> 
												</c:if>
											</c:forEach>
										</ul>
										<ul class="optionList">
											<c:forEach var="i" begin="54" end="57">										
												<c:if test="${result_option.get(i) ne '0'}">	<!--옵션의 값이 1일때(체크O) 빨간체크 + 검은색 -->
													<li style="font-size:14px; padding:0 80px 8px 60px;"><i class="fas fa-check" style="color:red"></i>${option_name[i]}</li>
												</c:if>
												<c:if test="${result_option.get(i) eq '0'}">	<!--옵션의 값이 0일때(체크X) 회색 -->
													<li style="color:#929292; font-size:14px; padding:0 80px 8px 60px;">${option_name[i]}</li> 
												</c:if>
											</c:forEach>
										</ul>
										<ul class="optionList">
											<c:forEach var="i" begin="58" end="61">										
												<c:if test="${result_option.get(i) ne '0'}">	<!--옵션의 값이 1일때(체크O) 빨간체크 + 검은색 -->
													<li style="font-size:14px; padding:0 80px 8px 50px;"><i class="fas fa-check" style="color:red"></i>${option_name[i]}</li>
												</c:if>
												<c:if test="${result_option.get(i) eq '0'}">	<!--옵션의 값이 0일때(체크X) 회색 -->
													<li style="color:#929292; font-size:14px; padding:0 80px 8px 50px;">${option_name[i]}</li> 
												</c:if>
											</c:forEach>
										</ul>
										<ul class="optionList">
											<c:forEach var="i" begin="62" end="65">										
												<c:if test="${result_option.get(i) ne '0'}">	<!--옵션의 값이 1일때(체크O) 빨간체크 + 검은색 -->
													<li style="font-size:14px; padding:0 80px 8px 0px;"><i class="fas fa-check" style="color:red"></i>${option_name[i]}</li>
												</c:if>
												<c:if test="${result_option.get(i) eq '0'}">	<!--옵션의 값이 0일때(체크X) 회색 -->
													<li style="color:#929292; font-size:14px; padding:0 80px 8px 0px;">${option_name[i]}</li> 
												</c:if>
											</c:forEach>
										</ul>
									</div>
								</div><hr style="margin:10px 0;">	
								<!-- end of 편의 -->
								<div class="" style="font-size:14px; list-style-type: none !important; ">	
								<!-- 멀티미디어 -->
									&nbsp;&nbsp;&nbsp;멀티미디어&nbsp;&nbsp;&nbsp;<hr style="margin:10px 0;">
									<div class="multimedia" style="display: flex;">
										<ul class="optionList" >
											<c:forEach var="i" begin="66" end="68">										
												<c:if test="${result_option.get(i) ne '0'}">	<!--옵션의 값이 1일때(체크O) 빨간체크 + 검은색 -->
													<li style="font-size:14px; padding:0 80px 8px 54px;"><i class="fas fa-check" style="color:red"></i>${option_name[i]}</li>
												</c:if>
												<c:if test="${result_option.get(i) eq '0'}">	<!--옵션의 값이 0일때(체크X) 회색 -->
													<li style="color:#929292; font-size:14px; padding:0 80px 8px 54px;">${option_name[i]}</li> 
												</c:if>
											</c:forEach>
										</ul>
										<ul class="optionList">
											<c:forEach var="i" begin="69" end="71">										
												<c:if test="${result_option.get(i) ne '0'}">	<!--옵션의 값이 1일때(체크O) 빨간체크 + 검은색 -->
													<li style="font-size:14px; padding:0 100px 8px 20px;"><i class="fas fa-check" style="color:red"></i>${option_name[i]}</li>
												</c:if>
												<c:if test="${result_option.get(i) eq '0'}">	<!--옵션의 값이 0일때(체크X) 회색 -->
													<li style="color:#929292; font-size:14px; padding:0 100px 8px 20px;">${option_name[i]}</li> 
												</c:if>
											</c:forEach>
										</ul>
										<ul class="optionList">
											<c:forEach var="i" begin="72" end="74">										
												<c:if test="${result_option.get(i) ne '0'}">	<!--옵션의 값이 1일때(체크O) 빨간체크 + 검은색 -->
													<li style="font-size:14px; padding:0 170px 8px 90px;"><i class="fas fa-check" style="color:red"></i>${option_name[i]}</li>
												</c:if>
												<c:if test="${result_option.get(i) eq '0'}">	<!--옵션의 값이 0일때(체크X) 회색 -->
													<li style="color:#929292; font-size:14px; padding:0 170px 8px 90px;">${option_name[i]}</li> 
												</c:if>
											</c:forEach>
										</ul>
										<ul class="optionList">
											<c:forEach var="i" begin="75" end="77">										
												<c:if test="${result_option.get(i) ne '0'}">	<!--옵션의 값이 1일때(체크O) 빨간체크 + 검은색 -->
													<li style="font-size:14px; padding:0 80px 8px 10px;"><i class="fas fa-check" style="color:red"></i>${option_name[i]}</li>
												</c:if>
												<c:if test="${result_option.get(i) eq '0'}">	<!--옵션의 값이 0일때(체크X) 회색 -->
													<li style="color:#929292; font-size:14px; padding:0 80px 8px 10px;">${option_name[i]}</li> 
												</c:if>
											</c:forEach>
										</ul>
									</div>
								</div>	<!-- end of 멀티미디어 -->
							</div>
						</div><br/><br/>	<!-- end of 옵션 정보 -->
						<div class="section-top-border">
							<h3 class="mb-30">차량 설명</h3>
							<div class="salesContext">
								<div class="col-lg-12">
									<blockquote class="generic-blockquote" style="width:1000px; font-size:14px; font-weight:lighter;">${sales.content}</blockquote>
								</div>
							</div>
						</div>	<!-- end of 차량 설명글 -->
				</div>	<!-- end of 왼쪽부분 -->
				<div class="col-lg-5">	<!-- start of 오른쪽 위 -->
	            	<div class="course__details__sidebar">
	                	<div class="rightSideTop1" style="border:1px solid #9d9d9d;"><br/>
	                		<input type="hidden" class='note_title' value='${sales.title}'>
	                        <div class="carNameInfo" style="text-align:center;"><span style="font-size:22px;">${sales.title}</span></div>
	                        <div class="carInfo" style="text-align:center; "><span style="font-size:16px; margin:10px 0;">${sales.old} | ${sales.color} | ${sales.fuel}</span></div>
	                        <div class="" style="text-align:center;"><span style="font-size:18px;"><b class="salesPrice" style="color:#dca73a; margin-right:5px;">
	                        <fmt:formatNumber value="${sales.price}" pattern="#,###" /></b>만원</span></div><br/>
	                        <div class="carInfo1">
		                        <span style="color:#112e41; font-size:12px; margin-left:160px;">
		                        <i class="fas fa-tools fa-2x"></i>	<!-- 성능 -->
		                        <i class="fas fa-file-alt fa-2x" style="margin-left:90px;"></i>	<!-- 보험이력 -->
	                            <br/>
								<span style="margin-left:150px; font-size:13px;">성능점검</span>
								<span style="margin-left:67px; font-size:13px;">보험이력</span>	
	                            </span>
	                        </div><br/>	<!-- end of 차 정보 -->
	                    </div><br/>
	                    <div class="rightSideTop2" style="border:1px solid #9d9d9d;"><br/>	<!-- 판매자 정보 -->
	                        <div class="salesManInfo">
	                        	<h4 style="color:#dca73a; margin-left:30px;">판매자 정보</h4>
	                        	<div class="salesPerson" style="display:flex;">
	                        		<!-- 프로필 사진이 떠야함 : 프사가 없는 사람은 기본이미지가 떠야함-->
				           			<img src="https://storage.cloud.google.com/car_image_for_analysis/profile/${sales.m_id}.jpg" alt="" style="width:15%; margin:10px 30px 20px 50px;">
				           			<div class="salesMan">
				           				<span style="margin-left:30px;">${sales.m_name} (${sales.m_id})</span><br/>
					           			<span style="margin-left:30px;">${sales.tel}</span>
				                	</div>
				                	<input class='sale_id' type="hidden" value="${sales.m_id}">
				                	<input class='sale_name' type="hidden" value="${sales.m_name}">
				           		</div> 
				            </div>
	                    </div>	<!-- end of 판매자 정보 -->
				        <div class="favorite" style="font-size:14px; display:flex; margin:5px 0 0 0;">
				        	<div class="icons" style="margin-left:150px; display:flex;">
				        		<div class='pointer declaration'>
				        			<span style="margin:0 5px 0 5px; font-size:15px; position: relative; top:2px;">신고하기</span> 
				        			<img src="../resources/img/siren.PNG" style="width:26px; height:30px;">
				        		</div>
				        		<div class='pointer notego'>
				        			<span style="margin-left:20px; font-size:15px; position: relative; top:2px;">쪽지보내기</span>
				        			<img src="../resources/img/message-gold.png" style="width:26px; height:30px;position: relative; top:2px;">
												
				        		</div>
									<div class='pointer' style="position: relative; top:6px;">
										<span style="margin-left: 20px; font-size: 15px;">찜하기</span> <span
											style="margin-left: 20px;position: relative; top:-2px;"> <!-- 하트 아이콘 --> <c:choose>
												<c:when test="${heart eq '1'}">
													<i class="fas fa-heart wish color_pink"></i>
													<input type="hidden" class='heart_on_off' value="on" />
												</c:when>
												<c:otherwise>
													<i class="fas fa-heart wish"></i>
													<input type="hidden" class='heart_on_off' value="off" />
												</c:otherwise>
											</c:choose>
										</span>
									</div>
								</div>	<!-- end of 쪽지보내기 / 찜하기 -->
				        </div>	<!-- end of favorite -->
	                </div>	<!-- end of 차 / 판매자 정보 -->
				</div>	<!-- end of 오른쪽 위 -->
			</div>	<!-- end of row -->
			<input type="hidden" name="sell_id" id="sell_id" value="<%=sell_id%>">
			<input type="hidden" name="status" id="status" value="<%=status%>">
			<!-- 버튼들 -->
			<div class="modify-delete" style="margin:50px 0;">
				<c:choose> 
					<c:when test="${sales.m_id == sessionScope.info.m_id && sales.status != '게시종료' && sales.status != '판매완료'}">	<!-- m_id가 같고 게시종료 상태가 아닐때 -->
						<a id="modifyCar"><span style="margin-left:450px; cursor:pointer;">수정하기</span></a>
						<a id="deleteCar"><span style="margin-left:50px; cursor:pointer;">삭제하기</span></a>
					</c:when>
					<c:when test="${sales.m_id == sessionScope.info.m_id && sales.status == '게시종료'}">	<!-- m_id가 같고 게시종료 상태일 때 -->
						<a id="reEnroll"><span style="margin-left:450px; cursor:pointer;">재등록하기</span></a>
						<a id="deleteCar"><span style="margin-left:50px; cursor:pointer;">삭제하기</span></a>
					</c:when>
					<c:when test="${sales.m_id == sessionScope.info.m_id && sales.status == '판매완료'}">	<!-- m_id가 같고 판매완료일 때 아무것도 안떠야함 -->
						<a></a>
					</c:when>
				</c:choose>
			</div>
		</div>
		</form>
	</section>
	<!--================ end of 상세페이지 글 내용 =================-->
	
	<!-- 차트용 스크립트 시작-->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="https://cdn.jsdelivr.net/gh/emn178/chartjs-plugin-labels/src/chartjs-plugin-labels.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-colorschemes@0.4.0/dist/chartjs-plugin-colorschemes.min.js"></script>
	<!-- 시세 예측 스크립트 시작 -->
	<script>
		var ctx = document.getElementById('predict_price');
		var myChart = new Chart(ctx, {
			type: 'line',
			data: {
				labels: [ '현재', '2년 후', '4년 후', '6년 후' ],
				datasets: [{
					label: '시세 (단위 : 만원)',
					data: [
						'${fn:split(sales.p_price,".")[0]}',
						'${fn:split(sales.after2_price,".")[0]}',
						'${fn:split(sales.after4_price,".")[0]}',
						'${fn:split(sales.f_price,".")[0]}'
					],
					backgroundColor: 'rgba(220, 167, 58, 0.2)',
					borderColor: '#dca73a',
					borderWidth: 1,
					fill:true
				}]
			},
			options: {
				responsive: false,
				tooltips: {
					enabled: true
				},
				hover: {
					animationDuration: 0
				},
				animation: {
					duration: 1,
					onComplete: function () {
						var chartInstance = this.chart,
							ctx = chartInstance.ctx;
						ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
						ctx.fillStyle = '#112e41';
						ctx.textAlign = 'center';
						ctx.textBaseline = 'bottom';

						this.data.datasets.forEach(function (dataset, i) {
							var meta = chartInstance.controller.getDatasetMeta(i);
							meta.data.forEach(function (bar, index) {
								var data = dataset.data[index];							
								ctx.fillText(data, bar._model.x, bar._model.y - 5);
							});
						});
					}
				}
			}
		});
	</script>
	<!-- 시세 예측 스크립트 끝-->


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