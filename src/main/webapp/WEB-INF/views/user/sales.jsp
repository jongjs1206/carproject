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
	
	<!-- slider Area Start-->
    <div class="slider-area">
      <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="../resources/assets/img/hero/contact_hero.jpg" >
          <div class="container">
              <div class="row ">
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
                    <div class="salesform">
                        <div class="team__item__text">
                        <form action="#" method='post'>
                        	<table class="table" style="margin:0 0 20px 100px;">
	                           <tr>
	                           		<th>판매자 정보</th>
	                           		<td width="280px" style="font-size:14px;">이  름 <input type="text" id="name" disabled="disabled" value="홍길동"></td>
	                           		<td width="280px" style="font-size:14px;">아 이 디 <input type="text" id="id" disabled="disabled" value="abcd1234"></td>
	                           		<td width="280px" style="font-size:14px;">핸드폰 번호 
	                           			<input type="text" id="tel" disabled="disabled" value="010-0000-0000"></td>
	                           </tr>
	                           <tr>
	                           		<th>이미지 등록</th>
	                           		<td width=100>
	                           			<%
                                    		for(int i = 1; i <= 20; i++){
                                    	%>
                                    		<img src="../resources/img/photos.png" width="50px" height="50px" id="photo<%=i%>">
	                                   	<%
		                                   	}
		                                %>
	                           		</td>
	                           		<td colspan=2 style="font-size:14px;">
										<input type="file" maxlength="100" size="100" name='file' multiple='multiple'></td>
	                           </tr>
	                           <tr>
	                           		<th>차량 정보</th>
	                           		<td colspan=3>
										<div style="font-size:14px; display: flex; line-height: 33px;">	<!-- 차량번호 -->
											차량번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
											<input type="text" id="carNumber" class="carNumber" style="line-height:initial;"></div>
										<hr style="margin:10px 0;">	
										<div style="font-size:14px; display: flex; line-height: 35px;">
											차량명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<select class='carBrand' name='carBrand'>
			                                          	<option value="">제조사</option>
			                                           	<!-- <option value="현대" style="font-size:13px;">현대</option>
			                                           	<option value="제네시스">제네시스</option>
			                                           	<option value="기아">기아</option>
			                                           	<option value="쉐보레(국산)">쉐보레(국산)</option>
			                                           	<option value="GM대우">GM대우</option>
			                                           	<option value="르노삼성">르노삼성</option>
			                                           	<option value="쌍용">쌍용</option>
			                                           	<option value="어울림모터스">어울림모터스</option>
			                                           	<option value="기타 국산차">기타 국산차</option> -->
			                                    </select>
											<select class='carModel' name='carModel' > 
	                                         	<option value="">모델</option>
	                                        </select>
	                                        <select class='carDetailModel' name='carDetailModel' >
	                                          	<option value="세부모델">세부모델</option>
	                                        </select>
	                                        <select class='carGrade' name='carGrade' >
	                                          	<option value="등급">등급</option>
	                                        </select>
	                                        <select class='carDetailGrade' name='carDetailGrade' >
	                                          	<option value="세부등급">세부등급</option>
	                                        </select>	
	                                        </div><hr style="margin:10px 0;"><!-- end of 차량명 -->	
                                        <div style="font-size:14px; display: flex; line-height: 35px;">	<!-- 연식/색상 -->
                                        	연식&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
                                        	<input type="date" id="carYear" style="height:35px; color:#9d9d9d; border-color:#dca73a; 
                                        		text-align:center; border-radius: 7px;">
                                   	    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   	    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   	    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   	    	색상&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        	<select class='carColor' name='carColor' >
	                                    		<option value="선택">선택</option>
	                                    		<option value="검정색">검정색</option><option value="은색">은색</option><option value="금색">금색</option>
	                                    		<option value="남색">남색</option><option value="청색">청색</option><option value="진청색">진청색</option>
	                                    		<option value="흰색">흰색</option><option value="회색">회색</option><option value="진회색">진회색</option>
	                                    		<option value="기타색상">기타색상</option>
	                                    	</select>
                                        </div><hr style="margin:10px 0;">		<!-- end of 연식/색상 -->
                                        <div style="font-size:14px; display: flex; line-height: 32px;">	<!-- 주행거리/배기량 -->
                                        	주행거리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                        	<input type="text" id="km" style="line-height:initial;">&nbsp;&nbsp;km
                                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    		배기량&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" id="cc" style="line-height:initial;">&nbsp;&nbsp;cc
                                        </div><hr style="margin:10px 0;">	<!-- end of 주행거리/배기량 -->
                                        <div style="font-size:14px; display: flex; line-height: 32px;">	<!-- 사고여부/판매가격 -->	
	                                    	사고여부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    		<input class="accident" type="radio" id="accident1" value="n" checked="">&nbsp; 무사고&nbsp;&nbsp;&nbsp;&nbsp;
                                     		<input class="accident" type="radio" id="accident2" value="n" >&nbsp; 사고
                                     		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     		판매가격&nbsp;&nbsp;&nbsp;
                                     		<input type="text" id="salesPrice" style="line-height:initial;">&nbsp;&nbsp;만원 
                                        </div><hr style="margin:10px 0;">	<!-- end of 사고여부/판매가격 -->	
                                        <div style="font-size:14px; display: flex; line-height: 35px;">	<!-- 변속기/연료 -->	
                                        	변속기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        	<select class='carGear' name='carGear' >
                                    		<option value="선택">선택</option>
                                    		<option value="자동">자동</option>
                                    		<option value="수동">수동</option>
                                    		</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                    	연료&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                    	<select class='carFuel' name='carFuel' >
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
                                        </div>	<!-- end of 변속기/연료 -->					                           		
	                           </tr> <!-- end of 차량정보 -->
	                           <tr><th>차량옵션선택 </th>
	                           		<td colspan=3>
		                           		<table class="option_table">
		                           			<tr>
												<th scope="row" id="outside" 
													style="text-align:center; font-size:14px; padding:5px; font-weight: initial;">외관</th>
												<th scope="row" id="inside" 
													style="text-align:center; font-size:14px; padding:5px; font-weight: initial;">내관</th>
												<th scope="row" id="safe" 
													style="text-align:center; font-size:14px; padding:5px; font-weight: initial;">안전</th>
												<th scope="row" id="convenience" 
													style="text-align:center; font-size:14px; padding:5px; font-weight: initial;">편의</th>
												<th scope="row" id="multimedia" 
													style="text-align:center; font-size:14px; padding:5px; font-weight: initial;">멀티미디어</th>
											</tr>
											<tr style="font-size:12px; font-weight: lighter;">
												<td class="checkOption">	<!-- 외관 -->
													<li><input type="checkbox" id="options_38" name="options[]" > 선루프</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 파노라마선루프</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 알루미늄휠</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 전동사이드미러</li>
													<li><input type="checkbox" id="options_38" name="options[]" > HID램프</li>
													<li><input type="checkbox" id="options_38" name="options[]" > LED헤드램프</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 어댑티드헤드램프</li>
													<li><input type="checkbox" id="options_38" name="options[]" > LED리어램프</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 데이라이트</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 하이빔어시스트</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 압축도어</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 자동슬라이딩도어</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 전동사이드스탭</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 루프랙</li>
												</td>
												<td class="checkOption">	<!-- 내장 -->
													<li><input type="checkbox" id="options_38" name="options[]" > 가죽시트</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 전동시트(운전석)</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 전동시트(동승석)</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 열선시트(앞좌석)</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 열선시트(뒷좌석)</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 통풍시트</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 메모리시트</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 폴딩시트</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 마사지시트</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 워크인시트</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 요추받침</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 하이패스룸미러</li>
													<li><input type="checkbox" id="options_38" name="options[]" > ECM룸미러</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 뒷자석에어벤트</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 패들쉬프트</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 전동햇빛가리개</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 엠비언트라이트</li>
												</td>
												<td class="checkOption">	<!-- 안전 -->
													<li><input type="checkbox" id="options_38" name="options[]" > 동승석에어백</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 측면에어백</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 커튼에어백</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 무릎에어백</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 승객감지에어백</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 브레이크잠금방지(ABS)</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 차체자세제어장치(ESC)</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 후방센서</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 전방센서</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 후방카메라</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 전방카메라</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 어라운드뷰</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 타이어공기압감지(TPMS)</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 차선이탈경보(LDWS)</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 자동긴급제동</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 전자제어서스펜션(ECS)</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 후측방경보</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 미끄럼방지(TCS)</li>
												</td>
												<td class="checkOption">	<!-- 편의 -->
													<li><input type="checkbox" id="options_38" name="options[]" > 스마트키</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 열선핸들</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 리모컨핸들</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 자동에어컨</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 좌우독립에어컨</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 오토라이트</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 크루즈컨트롤</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 스마트크루즈컨트롤</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 스탑앤고</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 전동트렁크</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 스마트트렁크</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 전자주차브레이크(EPB)</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 경사로밀림방지</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 헤드업디스플레이(HUD)</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 무선충전</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 자동주차</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 냉장고</li>
												</td>
												<td class="checkOption">	<!-- 멀티미디어 -->
													<li><input type="checkbox" id="options_38" name="options[]" > 네비게이션(순정)</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 네비게이션(비순정)</li>
													<li><input type="checkbox" id="options_38" name="options[]" > USB</li>
													<li><input type="checkbox" id="options_38" name="options[]" > AUX</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 블루투스</li>
													<li><input type="checkbox" id="options_38" name="options[]" > MP3</li>
													<li><input type="checkbox" id="options_38" name="options[]" > DMB</li>
													<li><input type="checkbox" id="options_38" name="options[]" > CD플레이어</li>
													<li><input type="checkbox" id="options_38" name="options[]" > AV시스템</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 뒷좌석TV</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 텔레매틱스</li>
													<li><input type="checkbox" id="options_38" name="options[]" > 스마트폰미러링</li>
												</td>
											</tr>
		                           		</table>	<!-- end of option_table -->
	                           		</td>
	                           </tr>
	                           <tr><th>설명글</th>
                                   <td colspan=3><textarea id="salesContext" cols=100 rows=10 placeholder="내용을 입력하세요."></textarea></td>
                               </tr>
		                	</table>
		                	<div class="col-lg-16 text-center">
			                	<a href="../user/salesDetail.do">
			                	<button type="submit" class="updateBtn" 
				                	style="border-radius: 12px; background-color:#dca73a; border:0; color:white; text-align:center; 
				                	width:100px; height:50px; margin:20px 0 30px 200px;">
			                	등록하기</button></a>
		                	</div>
                        </form>
                    	</div>
                    </div>	<!-- end of salesform -->
                </div>
            </div>	<!-- end of row -->
        </div>	<!-- end of container -->
   </section>	<!--================ end of 판매글 =================-->
   
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