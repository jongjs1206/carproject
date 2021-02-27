<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>

	<%@ include file="../header.jsp"%>
	
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
		<div class="container">
			<div class="row">
				<div class="col-lg-7">
					<div class="carImg" style="margin:0 0 0 0;">
						<img src="../resources/img/car/ex_car1.jpg" alt=""><hr style="margin:10px 0 10px 0;">	<!-- 차 대표 이미지 -->
                        <div class="thumbnail" style="display: flex; flex-wrap: wrap;" > <!-- 썸네일 -->
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
						<div class="col-lg-6 col-md-6 col-sm-6 col-md-3 col-sm-6" style="display: flex;">
							<div class="course__details__feature" style="width:500px; margin:0 100px 30px 0;">
								<h5>기본 정보</h5><hr style="margin:20px 0 10px 0;">
								<table class="detail-info-table" style="font-size:13px; width:500px; height:200px; ">
									<tbody>
										<tr style="padding:0px; margin:0px;">
											<th scope="col">차량번호</th>
											<td>358주9077</td>
											<th scope="col">주행거리</th>
											<td>8,727km</td>
											
										</tr>
										<tr style="padding:0px; margin:0px;">
											<th scope="col">연식</th>
											<td>2020.07(21년형)</td>
											<th scope="col">연료</th>
											<td>가솔린</td>
										</tr>
										<tr style="padding:0px; margin:0px;">
											<th scope="col">변속기</th>
											<td>자동</td>
											<th scope="col">배기량</th>
											<td>3,470 cc(380마력)</td>
										</tr>
										<tr style="padding:0px; margin:0px;">
											<th scope="col">색상</th>
											<td>검정색</td>
										</tr>
									</tbody>
								</table>
							</div>	
							<div class="course__details__feature" style="width:500px; margin:0 100px 30px 0;">
								<h5>보험 처리 이력</h5><hr style="margin:20px 0 10px 0;">
								&nbsp;&nbsp;&nbsp;<span style="color:#0c2b4b; font-size:13px;"><i class="fas fa-file-alt fa-2x"></i>
								&nbsp;&nbsp;&nbsp;보험처리 <b style="color:#f3bd00; font-size:13px;">2</b>회</span><hr style="margin:10px 0;">
								<table class="detail-info-table" style="font-size:13px; width:600px; height:200px; ">
									<tbody>
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
									</tbody>
								</table>
								</div>	
							<!-- <div class="course__details__feature" style="width:500px; margin:0 100px 30px 0;">
								<h5>차량 설명</h5><hr style="margin:20px 0 10px 0;">
								<div class="salesContext" style="font-size:13px; width:500px; display: flex;">
								</div>
							</div>	end of 차량 설명 -->
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
							<div class="course__details__feature" style="width:1000px;">
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
										차량 설명글 부분
									</blockquote>
								</div>
							</div>
						</div>	<!-- end of 차량 설명글 -->
					</div>
				</div>	<!-- end of 왼쪽부분 -->
				<div class="col-lg-5">	<!-- start of 오른쪽 위 -->
	            	<div class="course__details__sidebar">
	                	<div class="rightSideTop1" style="border:1px solid #9d9d9d;"><br/>
	                        <div class="carNameInfo"><h4 style="text-align:center">제네시스 더 올 뉴 G80 3.5 T-GDi AWD</h4></div>
	                        <div class="carInfo"><h6 style="text-align:center">20년 07월 (21년형) | 8,727 km | 가솔린</h6></div>
	                        <span><b class="salesPrice" style="color:#dca73a">
	                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5640</b>만원</span><br/><br/>
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
	                    </div><br/>
	                    <div class="rightSideTop2" style="border:1px solid #9d9d9d;"><br/>	<!-- 판매자 정보 -->
	                        <div class="salesManInfo">
	                        	<h4 style="color:#dca73a;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;판매자 정보</h4>
	                        	<div class="salesPerson" style="display:flex;">
				           			<img src="../resources/assets/img/logo/testimonial.png" alt="" style="width:110px; height:110px; margin:10px 30px 20px 50px;">
				           			<div class="salesMan"><br/><br/>
				           				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;홍길동(abcd1234)<br/>
					           			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;010-0000-0000
				                	</div>
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