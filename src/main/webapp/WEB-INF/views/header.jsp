<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../resources/css/header.css"
	type="text/css">
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
                    <strong>CAR</strong>
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
								<a href="../all/homepage.do"><img
									src="../resources/assets/img/logo/4d-logo.png" width="200"
									height="70" alt=""></a>
							</div>
						</div>
												
						<div class="col-xl-10 col-lg-10">
						<form:form action="${pageContext.request.contextPath}/logout" method="POST">
							<!-- main-menu -->
							<div class="main-menu f-right d-none d-lg-block">
								<nav>
									<ul id="navigation">
										<li><a href="../all/product_list.do">매장</a></li>
										<li><a href="#">내 차 팔기</a>
											<ul class="submenu">
												<li><a href="../user/sales.do">글쓰기</a></li>
												<li><a href="../user/salesDetail.do">내 글 확인</a></li>
												<li>
													<a href="#" onclick="window.open('../user/sendMessage.do', 'window', 'location=no, directories=no, resizable=no, status=no, toolbar=no,menubar=no, width=445, height=500, left=0, top=0, scrollbars=yes');return false">
													쪽지 보내기</a>
												</li>
												<li>
													<a href="../user/MessageDetail.do">쪽지 내용 확인</a>
												</li>
												<li><a href="../user/receiveMessage.do">쪽지함</a></li>
											</ul></li>
										<li><a href="../user/coinInfo.do">자동차 뉴스</a>
											<ul class="submenu">
												<li><a href="../all/carnewsBoardList.do">뉴스목록</a></li>
												<li><a href="../all/carnewsBoardview.do">뉴스페이지</a></li>
											</ul></li>
										<li><a href="#">구매후기</a>
											<ul class="submenu">
                                        		<li><a href="../user/review.do">후기글 쓰기</a></li>
                                        		<li><a href="../user/reviewDetail.do">후기글 확인</a></li>
                                        	</ul>
										</li>
										<li><a href="#">Q&A</a>
											<ul class="submenu">
												<li><a href="#"
													onClick="window.open('find_idpw.do','아이디/비밀번호 찾기','width=500,height=500,toolbar=no,scrollbars=no,left=200,top=100')">아이디/비밀번호찾기</a>
												<li><a href="../user/memInfo.do">memInfo.do</a></li>
												<li><a href="../user/mysale_list.do">mysale_list.do</a></li>
												<li><a href="../user/mywish_list.do">mywish_list.do</a></li>
												<li><a href="../user/mem.do">mem.do</a></li>
												<li><a href="../admin/admin.do">어드민</a></li>
											</ul></li>
											
										<li>
                                        	<a href="#" onclick="window.open('../all/chat.do', 'window', 'location=no, directories=no, resizable=no, status=no, toolbar=no,menubar=no, width=445, height=670, left=0, top=0, scrollbars=yes');return false">
                                        	<i class="far fa-comments" style="color:#dca73a; font-size:25px;"></i> 채팅</a>
                                        </li>
										<li style="width: 40px;"></li>

										<sec:authorize access="isAnonymous()">
											<li><a href="../all/login.do" class="btn more-btn1"
												id="login-color-menu"> Login <i class="ti-angle-right"></i>
											</a></li>
											<li><a href="../all/join.do" class="btn more-btn1"
												id="login-color-menu"> 회원가입 <i class="ti-angle-right"></i>
											</a></li>
										</sec:authorize>

										<sec:authorize access="isAuthenticated()">
												<li><a>${sessionScope.info.m_name}<i class="fas fa-user-tie"></i></a>
											<ul class="submenu">
												<li><a href="../user/sales.do">글쓰기</a></li>
												<li><a href="../user/coin.do">내 코인</a></li>
												<li><a><input type="submit" value="로그아웃"></a></li>
											</ul></li>
										</sec:authorize>
									</ul>
								</nav>
							</div>
						</form:form>
						</div>
						<!-- Mobile Menu -->
						<div class="col-12">
							<div style="position: relative; bottom: 22px;"
								class="mobile_menu d-block d-lg-none"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Header End -->
	</header>

</body>
</html>