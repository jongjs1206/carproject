<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> header.jsp </title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/c11219882f.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <strong>CAR</b>
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->

    <header>
        <!-- Header Start -->
       <div class="header-area header-sticky">
            <div class="main-header ">
                <div class="container">
                    <div class="row align-items-center">
                        <!-- logo -->
                        <div class="col-xl-2 col-lg-2">
                            <div class="logo">
                               <a href="#"><img src="../resources/assets/img/logo/logo.png" alt=""></a>
                            </div>
                        </div>
                    <div class="col-xl-8 col-lg-8">
                            <!-- main-menu -->
                            <div class="main-menu f-right d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">                                                                                                                                     
                                        <li><a href="#">국산차</a></li>
                                        <li><a href="#">수입차</a></li>
                                        <li><a href="#">내 차 팔기</a></li>
                                        <li><a href="#l">자동차 뉴스</a>
                                            <ul class="submenu">
                                                <li><a href="#">Blog</a></li>
                                                <li><a href="#">Blog Details</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Q&A</a>
                                            <ul class="submenu">
                                                <li><a href="#">Rooms</a>
                                                <li><a href="#">Element</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>             
                        <div class="col-xl-2 col-lg-2">
                            <!-- header-btn -->
                            <div class="header-btn">
                            <!-- 
                                <a href="#" class="btn btn1 d-none d-lg-block ">Login</a>
                                -->
                                <a href="join.do" class="btn more-btn1" id="login-color-menu"> Login/회원가입 <i class="ti-angle-right"></i> </a>
                            </div>
                        </div>
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
        <!-- Header End -->
    </header>
</body>
</html>