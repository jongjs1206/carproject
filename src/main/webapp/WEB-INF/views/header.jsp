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
                               <a href="#"><img src="../resources/assets/img/logo/4d-logo.png" width="200" height="70" alt=""></a>
                            </div>
                        </div>
                    <div class="col-xl-8 col-lg-8">
                            <!-- main-menu -->
                            <div class="main-menu f-right d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">                                                                                                                                     
                                        <li><a href="../all/product_list.do">국산차</a></li>
                                        <li><a href="#">수입차</a></li>
                                        <li><a href="#">내 차 팔기</a>
                                        	<ul class="submenu">
                                        		<li><a href="../user/sale.do">글쓰기</a></li>
                                        		<li><a href="../user/salesDetail.do">내 글 확인</a></li>
                                        	</ul>
                                       	</li>
                                        <li><a href="../user/coinInfo.do">자동차 뉴스</a>
                                            <ul class="submenu">
                                                <li><a href="../all/carnewsBoardList.do">뉴스목록</a></li>
                                                <li><a href="../all/carnewsBoardview.do">뉴스페이지</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">구매후기</a></li>
                                        <li><a href="#">Q&A</a></li>
                                        <li><a href="#">메뉴모음</a>
                                            <ul class="submenu">
                                                <li><a href="#" onClick="window.open('find_idpw.do','아이디/비밀번호 찾기','width=500,height=500,toolbar=no,scrollbars=no,left=200,top=100')">아이디/비밀번호찾기</a>
                                                <li><a href="../user/memInfo.do">memInfo.do</a></li>
                                                <li><a href="../user/mysale_list.do">mysale_list.do</a></li>
                                                <li><a href="../user/mywish_list.do">mywish_list.do</a></li>
                                                <li><a href="../user/user.do">user.do</a></li>
                                                <li><a href="../admin/admin.do">어드민</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">채팅</a></li>
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
                                <a href="../user/login.do" class="btn more-btn1" id="login-color-menu"> Login <i class="ti-angle-right"></i> </a>
                                <a href="../all/join.do" class="btn more-btn1" id="login-color-menu"> 회원가입 <i class="ti-angle-right"></i> </a>
                            
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