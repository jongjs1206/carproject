<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 판매 리스트</title>
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
<link rel="stylesheet" type="text/css" href="../resources/css/all/my_sales.css">

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
<script type="text/javascript" src="../resources/js/user/my_sales.js"></script>

</head>
<body>
	
	<%@ include file="../header.jsp"%>	<!-- header -->
	<%@ include file="../side.jsp"%>	<!--side menu -->
	
	<!-- slider Area Start-->
    <div class="slider-area">
      <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="../resources/img/my_sales_banner.jpg" >
          <div class="container">
              <div class="row ">
                  <div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
                      <div class="hero-caption">
                          <span>내가 쓴 판매글 목록 </span>
                          <h2>내 판매글</h2>
                      </div>
                  </div>
              </div>
          </div>
      </div>
	</div>	
	<!-- slider Area End-->
	
	<input type="hidden" class='login_on' value='${sessionScope.info.m_id}'/>	

	<section class="">       
		<div class="container">         
			<form action="#">

			</form>
		</div>
	</section>
    <!--================Blog Area =================-->
    
   
    

    <!--================Blog Area =================-->
    <section class="blog_area section-padding">
        <div class="container">
        
        
        

			<!-- tag_status -->
			<div class="container saleHeader">
				  
                    <!-- select in date -->
                   <div class="datePicker">
               
                  <input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				 <div><a id="datepickerReset"> <i class="fas fa-sync-alt"></i></a></div>
                    <div class="single-select-box mb-30">
                        <!-- select out date -->
                        <div class="boking-tittle">                          
                        </div>
                        <div class="boking-datepicker">
                            <input id="datepicker1" type="date"  placeholder="" />                             
                        </div>
                   </div>            
                      
                    <!-- Single Select Box -->
                    <div class="single-select-box mb-30">
                        <!-- select out date -->
                        <div class="boking-tittle">
                         
                        </div>
                        <div class="boking-datepicker">
                            <input id="datepicker2"  type="date" placeholder="" />
                        </div>
                     
                   </div>
                    <div><a id="datepickerBtn"> <i class="fas fa-search"></i></a>
                    </div>
                
                  
                  </div>                
				<div class="statusBtn" id="statusBtn">
				<a href="javascript:void(0);" onclick="statusOn(this)">등록대기</a>
				<a href="javascript:void(0);" onclick="statusOn(this)">게시중</a>
				<a href="javascript:void(0);" onclick="statusOn(this)">게시종료</a>
				<a href="javascript:void(0);" onclick="statusOn(this)">판매완료</a>
				<a href="javascript:void(0);" onclick="statusOn(this)">삭제</a>
		  </div>
				<!-- 검색창 -->
			<div class="divSearch">
	
				<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<span id="resetSearch" class="form-icon"> <a> <i class="fas fa-sync-alt"></i></a></span>
					<input type="text" id="byTitle" name="byTitle" placeholder=" 제목 검색 "/> 						
						<a id="btnSearch"> <i class="fas fa-search"></i></a>
			
			</div>
</div>

        




			<!-- title -->
            
			
			<div class="sale-info">
				<span>제목</span>
				<span>찜</span>
				<!-- <span>삭제 </span> -->
			</div>
			
			
			
			<!-- 이 안에 DB 내용 가져올 예정 ↓↓↓↓↓  -->
		<div id="indexListAjax">
		
			<c:forEach items="${sale_list}" var="sale">
			<div class="blog_details news-container">
				<a class="d-inline-block news-thumb"
					href="../all/salesDetail.do?num=${sale.sell_id}"> <img
					src="${sale.image}img1.png" alt="썸네일" style="width: 250px">
				</a> 
				<a class="" href="../all/salesDetail.do?num=${sale.sell_id}">
					<div>
						<span class="date">${sale.w_date}</span> 
						<span class="status">${sale.status}</span>
					</div>
					<div>
					<h2>${sale.title}</h2>
					</div>
					<div class="car-estimate">
						<span>${sale.price} 만원</span>
					</div>
				</a>
				<div class="cnt">12</div>
		    	<!-- <div class="deleteBtn"><a><i class="far fa-trash-alt fa-lg" aria-hidden="true"></i></a></div> -->
			</div>
			</c:forEach>
		</div>
			<!-- 이 안에 DB 내용 가져올 예정 ↑↑↑↑↑  -->



		</div> <!-- end of container -->
    </section>

	<!-- ### 페이징 시작 ### -->
<!-- 	<nav class="blog-pagination justify-content-center d-flex">
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
	</nav> -->
	<!-- ### 페이징 끝 ### -->
                


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