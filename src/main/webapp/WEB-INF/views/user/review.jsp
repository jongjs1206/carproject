<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>거래 후기</title>
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

	<%@ include file="../header.jsp"%>	<!-- header -->
	
	<!-- slider Area Start-->
    <div class="slider-area">
      <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="../resources/assets/img/hero/contact_hero.jpg" >
          <div class="container">
              <div class="row ">
                  <div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
                      <div class="hero-caption">
                          <span>내 차 팔기</span>
                          <h2>후기글 등록</h2>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>	<!-- slider Area End-->

   <!--================ 후기글 부분 =================-->
   <section class="blog_area single-post-area section-padding" style="padding:10px; ">
      <div class="container">
            <div class="row">
                <div class="col-lg-16">
                    <div class="reviewform">
                        <div class="team__item__text">
                        <form action="#" method='post'>
                        	<table class="table" style="margin:0 0 20px 100px;">
	                           <tr>
	                           		<th>판매글 정보</th>
	                           		<td width="385px" style="font-size:14px;">판매글 번호 
	                           			<input type="text" id="salesNumber" disabled="disabled" value="111111"></td>
	                           		<td width="385px" style="font-size:14px;">판매자 이름 
	                           			<input type="text" id="salesName" disabled="disabled" value="홍길동"></td>
	                           </tr>
	                           <tr>
	                           		<th>글 제목</th>
	                           		<td colspan=3><input type="text" id="reviewTitle" style="width:500px"></td>
	                           </tr>
	                           <tr>
	                           		<th>이미지 등록</th>
	                           		<td width=100>
	                           			<%
                                    		for(int i = 1; i <= 10; i++){
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
	                           		<th>구매 가격</th>
	                           		<td colspan=3 style="font-size:14px;"><input type="text" id="dealPrice" style="width:500px"> 만원</td>
	                           </tr>
	                           <tr>
	                           		<th>차량 정보</th>
	                           		<td colspan=3>
										<div style="font-size:14px; display: flex; line-height: 33px;">	<!-- 차량번호 -->
											차량번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
											<input type="text" id="carNumber" disabled="disabled" class="carNumber" style="line-height:initial;"></div>
										<hr style="margin:10px 0;">	
										<div style="font-size:14px; display: flex; line-height: 35px;">
											차량명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<select class='carBrand' name='carBrand' disabled="disabled">
		                                          	<option value="제조사">제조사</option>
		                                           	<option value="현대" style="font-size:13px;">현대</option>
		                                           	<option value="제네시스">제네시스</option>
		                                           	<option value="기아">기아</option>
		                                           	<option value="쉐보레(국산)">쉐보레(국산)</option>
		                                           	<option value="GM대우">GM대우</option>
		                                           	<option value="르노삼성">르노삼성</option>
		                                           	<option value="쌍용">쌍용</option>
		                                           	<option value="어울림모터스">어울림모터스</option>
		                                           	<option value="기타 국산차">기타 국산차</option>
		                                    </select>
											<select class='carModel' name='carModel' disabled="disabled"> 
	                                         	<option value="">모델</option>
	                                        </select>
	                                        <select class='carDetailModel' name='carDetailModel' disabled="disabled">
	                                          	<option value="세부모델">세부모델</option>
	                                        </select>
	                                        <select class='carGrade' name='carGrade' disabled="disabled">
	                                          	<option value="등급">등급</option>
	                                        </select>
	                                        <select class='carDetailGrade' name='carDetailGrade' disabled="disabled">
	                                          	<option value="세부등급">세부등급</option>
	                                        </select>	
	                                        </div><hr style="margin:10px 0;"><!-- end of 차량명 -->	
                                        <div style="font-size:14px; display: flex; line-height: 35px;">	<!-- 연식/색상 -->
                                        	연식&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
                                   	    	<input type="date" id="year" style="height:35px; color:#9d9d9d; border-color:#dca73a; 
                                   	    	text-align:center; border-radius: 7px;">
                                   	    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   	    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   	    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   	    	색상&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        	<select class='carColor' name='carColor' disabled="disabled">
	                                    		<option value="선택">선택</option>
	                                    		<option value="검정색">검정색</option><option value="은색">은색</option><option value="금색">금색</option>
	                                    		<option value="남색">남색</option><option value="청색">청색</option><option value="진청색">진청색</option>
	                                    		<option value="흰색">흰색</option><option value="회색">회색</option><option value="진회색">진회색</option>
	                                    		<option value="기타색상">기타색상</option>
	                                    	</select>
	                                    	 
                                        </div><hr style="margin:10px 0;">		<!-- end of 연식/색상 -->
                                        <div style="font-size:14px; display: flex; line-height: 32px;">	<!-- 주행거리/배기량 -->
                                        	주행거리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                        		<input type="text" id="km" disabled="disabled" style="line-height:initial;">&nbsp;&nbsp;km
                                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    		배기량&nbsp;&nbsp;&nbsp;&nbsp; 
                                    			<input type="text" id="cc" disabled="disabled" style="line-height:initial;">&nbsp;&nbsp;cc
                                        </div><hr style="margin:10px 0;">	<!-- end of 주행거리/배기량 -->
                                        <div style="font-size:14px; display: flex; line-height: 32px;">	<!-- 사고여부/판매가격 -->	
	                                    	사고여부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    		<input name="accident" type="radio" id="accident1" value="n" checked="">&nbsp; 무사고&nbsp;&nbsp;&nbsp;&nbsp;
                                     		<input name="accident" type="radio" id="accident2" value="n" >&nbsp; 사고
                                     		<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     		판매가격&nbsp;&nbsp;&nbsp;
                                     		<input type="text" id="salesPrice">&nbsp;&nbsp;만원  -->
                                        </div><hr style="margin:10px 0;">	<!-- end of 사고여부/판매가격 -->	
                                        <div style="font-size:14px; display: flex; line-height: 35px;">	<!-- 변속기/연료 -->	
                                        	변속기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        	<select class='carGear' name='carGear' disabled="disabled">
                                    		<option value="선택">선택</option>
                                    		<option value="자동">자동</option>
                                    		<option value="수동">수동</option>
                                    		</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                    	연료&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                    	<select class='carFuel' name='carFuel' disabled="disabled">
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
	                           <tr><th>후기 남기기</th>
                                   <td colspan=3><textarea id="reviewContext" cols=100 rows=10 placeholder="내용을 입력하세요."></textarea></td>
                               </tr>
		                	</table>
		                	<div class="col-lg-16 text-center">
			                	<a href="../user/reviewDetail.do">
			                	<button type="submit" class="reviewBtn" id="reviewBtn"
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