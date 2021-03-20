<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>내차 팔기 - 판매글 등록</title>
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
	<link rel="stylesheet" href="../resources/assets/css/style.css">
	<script type="text/javascript" src="../resources/js/all/sales.js"></script>
</head>
<body>

	<%@ include file="../header.jsp"%>	<!-- header -->
	<%@ include file="../side.jsp"%>	<!-- 최근 본 목록 -->
		
	<input type="hidden" class='login_on' value='${sessionScope.info.m_id}'/>	
	
	<!-- slider Area Start-->
    <div class="slider-area">
      <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="../resources/img/sales2.jpg" >
          <div class="container">
              <div class="row">
                  <div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
                      <div class="hero-caption">
                          <span>내 차 팔기</span>
                          <h2>판매글 등록</h2>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>	<!-- slider Area End-->

	<!--================ 판매글 부분 =================-->
   	<section class="blog_area single-post-area section-padding" style="padding:10px; ">
      	<div class="container">
            <div class="row">
				<div class="col-lg-16">
					<div class="single-post">
						<form action="uploadSales.do" id="salesForm" method='post'
							class="salesForm" enctype="multipart/form-data">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input type="hidden" name="strOption"
								id="strOption" />
							<table class="table" style="margin: 0 0 20px 60px;">
								<tr>
									<th>글 제목</th>
									<td colspan=3><input type="text" id="title" name="title"
										style="width: 750px" readonly="readonly"
										placeholder="차종 선택시 자동완성됩니다.">
								</tr>
								<tr>
									<th>판매자 정보</th>
									<td width="280px" style="font-size: 14px;">이 름 <input
										type="text" name="m_name" id="m_name" disabled="disabled"
										value="${sessionScope.info.m_name}"></td>
									<td width="280px" style="font-size: 14px;">아 이 디 <input
										type="text" name="m_id" id="m_id" disabled="disabled"
										value="${sessionScope.info.m_id}"></td>
									<td width="280px" style="font-size: 14px;">핸드폰 번호 <input
										type="text" name="tel" id="tel" disabled="disabled"
										value="${sessionScope.info.tel}"></td>
								</tr>
								<!-- 자동차 사진을 로컬에 저장 후, 구글 클라우드로 업로드// sales.js에서 컨트롤러로 넘겨줌 -->
								<tr>
									<input type="hidden" name="m_id"
										value="${sessionScope.info.m_id}" />
									<th>이미지 등록</th>
									<!--  이미지 등록 부분 -->
									<td width=100><img src="../resources/img/photos.png" width="50px" height="50px" id="photo"><span id="phototo"></span>
									</td>
									<td colspan=2 style="font-size: 14px;">
										<!-- 이미지 미리보기 --> <input type="file" name="file" id="picFile"
										accept="image/*" multiple="multiple" /> 이미지 파일은 6개까지 등록할 수
										있습니다.
									</td>
								</tr>
								<!-- 자동차 사진을 로컬에 저장 후, 구글 클라우드로 업로드// sales.js에서 컨트롤러로 넘겨줌 -->
								<tr>
									<th>차량 정보</th>
									<td colspan=3>
										<div
											style="font-size: 14px; display: flex; line-height: 33px;">
											<!-- 차량번호 -->
											<span style="margin-right: 30px;">차량번호</span> <input
												type="text" name="vehicle_num" id="carNumber"
												class="carNumber" style="line-height: initial;">
										</div>
										<hr style="margin: 10px 0;">
										<div style="font-size: 14px; line-height: 35px;">
											<!-- 차량명 -->
											<span style="margin-right: 40px;">차량명</span> <select
												class='carBrand' name="jejosa" id="carBrand"
												style="margin: 0 15px 10px 0; height: 35px;">
												<!-- 제조사 -->
												<option value="제조사">제조사</option>
												<c:forEach var="brand" items="${brandList}">
													<option value="${brand.jejosa}">${brand.jejosa}</option>
												</c:forEach>
											</select><br /> <select class='carModel' name="model" id="carModel"
												style="margin: 0 15px 10px 80px; height: 35px;">
												<!-- 모델 -->
												<option value="모델">모델</option>
											</select> <select class='carDetailModel' name="detail"
												id="carDetailModel"
												style="margin-right: 15px; height: 35px;">
												<!-- 세부모델 -->
												<option value="세부모델">세부모델</option>
											</select><br /> <select class='carGrade' id='carGrade' name='grade1'
												style="margin-right: 15px; margin-left: 80px; height: 35px;">
												<!-- 등급 -->
												<option value="등급">등급</option>
											</select> <input type="hidden" id="selectId" name="g_id">
											<!-- g_id를 담음 -->
											<select class='carDetailGrade' id='carDetailGrade'
												name='grade2' style="margin-right: 15px; height: 35px;">
												<!-- 세부등급 -->
												<option value="세부등급">세부등급</option>
											</select>
										</div>
										<hr style="margin: 10px 0;"> <!-- end of 차량명 -->
										<div
											style="font-size: 14px; display: flex; line-height: 35px;">
											<!-- 연식/색상 -->
											<span style="margin: 0 5px 0 0px;">연식</span> <select
												id="carYear" class="carYear" name="old"
												style="margin: 0 230px 0 50px;">
												<c:forEach var="year" items="${arr}">
													<option value="${year}">${year}</option>
												</c:forEach>
											</select>
											<span>색상</span> <select class='carColor' name='color'
												style="margin-left: 25px;">
												<option value="선택">선택</option>
												<option value="검정색">검정색</option>
												<option value="은색">은색</option>
												<option value="금색">금색</option>
												<option value="남색">남색</option>
												<option value="청색">청색</option>
												<option value="진청색">진청색</option>
												<option value="흰색">흰색</option>
												<option value="회색">회색</option>
												<option value="진회색">진회색</option>
												<option value="기타색상">기타색상</option>
											</select>
										</div>
										<hr style="margin: 10px 0;"> <!-- end of 연식/색상 -->
										<div
											style="font-size: 14px; display: flex; line-height: 32px;">
											<!-- 주행거리/배기량 -->
											<span>주행거리</span> <input type="text" id="km" name="mile"
												style="line-height: initial; margin: 0 5px 0 30px;">km
											<span style="margin-left: 115px;">배기량</span> <input
												type="text" id="cc" name="baeki"
												style="line-height: initial; margin: 0 5px 0 20px;">cc
										</div>
										<hr style="margin: 10px 0;"> <!-- end of 주행거리/배기량 -->
										<div
											style="font-size: 14px; display: flex; line-height: 32px;">
											<!-- 사고여부/판매가격 -->
											<span style="margin-right: 30px;">사고여부</span> <input
												class="accident" name="accident" type="radio" id="accident1"
												value="no" checked="">&nbsp;
											무사고&nbsp;&nbsp;&nbsp;&nbsp; <input class="accident"
												name="accident" type="radio" id="accident2" value="yes">&nbsp;
											사고 <span style="margin-left: 155px; margin-right: 7px;">판매가격</span>&nbsp;&nbsp;&nbsp;
											<input type="text" name="price" id="salesPrice"
												class="salesPrice"
												style="line-height: initial; margin-right: 5px;">만원
										</div>
										<hr style="margin: 10px 0;"> <!-- end of 사고여부/판매가격 -->
										<div
											style="font-size: 14px; display: flex; line-height: 35px;">
											<!-- 변속기/연료 -->
											<span>변속기</span> <select class='carGear' id="carGear"
												name='gear' style="margin: 0 240px 0 40px;">
												<option value="선택">선택</option>
												<option value="자동">자동</option>
												<option value="수동">수동</option>
											</select> <span>연료</span> <select class='carFuel' id='carFuel'
												name="fuel" style="margin-left: 30px;">
												<option value="선택">선택</option>
												<option value="가솔린">가솔린</option>
												<option value="디젤">디젤</option>
												<option value="LPG">LPG</option>
												<option value="가솔린/LPG겸용">가솔린/LPG겸용</option>
												<option value="가솔린/CNG겸용">가솔린/CNG겸용</option>
												<option value="가솔린 하이브리드">가솔린 하이브리드</option>
												<option value="LPG 하이브리드">LPG 하이브리드</option>
												<option value="디젤 하이브리드">디젤 하이브리드</option>
												<option value="CNG">CNG</option>
												<option value="전기">전기</option>
												<option value="수소">수소</option>
												<option value="기타">기타</option>
											</select>
										</div> <!-- end of 변속기/연료 -->
								</tr>
								<!-- end of 차량정보 -->
								<tr>
									<th>차량옵션선택</th>
									<td colspan=3>
										<table class="option_table">
											<tr>
												<th scope="row" id="outside"
													style="text-align: center; font-size: 14px; padding: 5px; font-weight: initial;">외관</th>
												<th scope="row" id="inside"
													style="text-align: center; font-size: 14px; padding: 5px; font-weight: initial;">내관</th>
												<th scope="row" id="safe"
													style="text-align: center; font-size: 14px; padding: 5px; font-weight: initial;">안전</th>
												<th scope="row" id="convenience"
													style="text-align: center; font-size: 14px; padding: 5px; font-weight: initial;">편의</th>
												<th scope="row" id="multimedia"
													style="text-align: center; font-size: 14px; padding: 5px; font-weight: initial;">멀티미디어</th>
											</tr>
											<tr style="font-size: 12px; font-weight: lighter;">
											
												<!-- --------------------차량옵션 start------------------- -->											
												<!-- 
													<li><input type="checkbox" id="options_1" name="option"> 선루프</li>
												 -->
												<!-- 
													<li>
														<c:if test="${result_option.get(0) eq '0'}">
															<input type="checkbox" id="options_1" name="option">
														</c:if>
														<c:if test="${result_option.get(0) eq '1'}">
															<input type="checkbox" id="options_1" name="option" checked>
														</c:if>
														 선루프
													</li>
												 -->											
											 
												<!-- 외관 -->
												<td class="outside">
													<c:forEach var="i" begin="0" end="13">
														<li><input type="checkbox" id="options_'${i+1}'"
															name="option"> ${option_name[i]}</li>
													</c:forEach>
												</td>
												<!-- 내장 -->
												<td class="inside">
													<c:forEach var="i" begin="14" end="30">
														<li><input type="checkbox" id="options_'${i+1}'"
															name="option"> ${option_name[i]}</li>
													</c:forEach>												
												</td>
												<!-- 안전 -->
												<td class="safe">
													<c:forEach var="i" begin="31" end="48">
														<li><input type="checkbox" id="options_'${i+1}'"
															name="option"> ${option_name[i]}</li>
													</c:forEach>												
												</td>
												<!-- 편의 -->
												<td class="comfort">
													<c:forEach var="i" begin="49" end="65">
														<li><input type="checkbox" id="options_'${i+1}'"
															name="option"> ${option_name[i]}</li>
													</c:forEach>												
												</td>
												<!-- 멀티미디어 -->
												<td class="multimedia">
													<c:forEach var="i" begin="66" end="77">
														<li><input type="checkbox" id="options_'${i+1}'"
															name="option"> ${option_name[i]}</li>
													</c:forEach>												
												</td>
											</tr>
											
											<!-- --------------------차량옵션 end------------------- -->
											
										</table> <!-- end of option_table -->
									</td>
								</tr>
								<tr>
									<th>설명글</th>
									<td colspan=3><textarea id="salesContext" name="content"
											class="salesContext" cols=100 rows=10
											placeholder="내용을 입력하세요."></textarea></td>
								</tr>
							</table>
							<div class="uploadBtn" style="margin: 50px 0;">
								<a id="enrollCar"><span style="margin-left: 550px; cursor:pointer;">등록하기</span></a>
							</div>
							<c:if test="${sales.m_id == sessionScope.info.m_id}">
								<!-- 수정 / 삭제하기 버튼 : m_id가 같을 때만 보이게 -->
								<div class="modify-delete" style="margin: 50px 0;">
									<a href="../user/sales.do" id="modifyCar"><span
										class="modifyBtn" style="margin-left: 450px; cursor:pointer;">수정하기</span></a> <a
										href="product_list.do" id="deleteCar"><span
										class="deleteBtn" style="margin-left: 50px; cursor:pointer;">삭제하기</span></a>
								</div>
							</c:if>
						</form>
					</div>
				</div>
				<!-- end of salesform -->
			</div>	<!-- end of row -->
        </div>	<!-- end of container -->
   </section>	<!--================ end of 판매글 =================-->
   
   <!-- 챗봇 -->
  	<div id="frogue-container" class="position-right-bottom"
      data-chatbot="4e13c93c-d37f-4fa8-ad40-ce2fc1707a9f"
      data-user="사용자ID"
      data-init-key="value"
      ></div>
	<!-- data-init-식별키=값 으로 셋팅하면 챗플로우에 파라미터와 연동가능. 식별키는 소문자만 가능 -->
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
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