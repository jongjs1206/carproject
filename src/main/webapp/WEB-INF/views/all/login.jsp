<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">


<meta name="google-signin-client_id" content="720645188606-a3u36ofdsi5rp6goo6g3i9emjk0eahrd.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

<title>Hotel</title>
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
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
const googleLogin = function doGoogleLogin() {
	alert('클릭!');
	location.href = '/carproject/all/googleLogin.do';
}
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

<link rel="stylesheet" href="../resources/css/all/join_login.css"
	type="text/css">

<script type="text/javascript" src="../resources/js/all/find_idpw.js"></script>
<script type="text/javascript" src="../resources/js/all/login.js"></script>


</head>
<body>

	<%@ include file="../header.jsp"%>

	<main class="background_color">


		<!-- Application Form Section Begin -->
<div class="container"> 
	 <div class="box-login">
        <div id="wrap">
			<div class="loginLogo">
				<a href="/carproject/all/homepage.do"><img
					src="../resources/img/logo.png" alt="logo"></a>
			</div>
                <div class="Layout_contents__2nVdg Layout_normal__2IFQF">
                    <c:url value="/login" var="loginUrl" />
					<form:form action='${loginUrl}' method='post' id='login'>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
                        <div>
                            <div class="">
                                <div class="AlignBoxInput_uialign_block__3ZoMq">
                                    <div class="AlignBoxInput_uialign_item__3Gy6x col1">
                                        <div class="InputText_uiinput_txt__3jtqA" data-testid="wrap_input">
                                        <div class="InputText_placeholder_text__13dap" role="button">아이디</div>
                                            <div class="InputText_inner_square__38iB2 InputText_normal__1Fp25">
                                            <input type="text" id="m_id" name="m_id" maxlength="20" data-testid="input" inputmode="" value="">
                                            <span>${user.m_id}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="AlignBoxInput_uialign_item__3Gy6x col1">
                                        <div class="InputText_uiinput_txt__3jtqA" data-testid="wrap_input" style="margin-top: 10px;">
                                        <div class="InputText_placeholder_text__13dap" role="button">비밀번호</div>
                                            <div class="InputText_inner_square__38iB2 InputText_normal__1Fp25">
                                            <input style="font-family: '고딕';" type="password" id="m_pw" name="m_pw" maxlength="" data-testid="input" inputmode="" value="">
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${param.error != null}">
								<p class='error'>아이디와 비밀번호가 잘못되었습니다.</p>
							</c:if>
                            <div class=" " style="margin-top: 30px;"><button type="submit" class="Button_uibtn__1tGCl Button_uibtn_silver__3Ho2C Button_uibtn_size_h50__cWPtg"> 로그인 </button></div>
                        </div>
                    </form:form>
                    <div class="LoginMyFindButton_area__245Jy">
                    	<a class="LoginMyFindButton_link__fee2S" href="#" id="popup_idpw">
                    		아이디/비밀번호 찾기
                   		</a>
                   		<a class="LoginMyFindButton_link__fee2S" href="../all/join.do">
                   			회원가입
                 		</a>
                	</div>
              
                    <div class="LoginSnsButton_tit_area__bRqmB"><strong class="LoginSnsButton_tit__1kT5i">간편하게 시작하기</strong></div>
                    <div class="LoginSnsButton_btn_area__1HZfa">
                        <div class=" " style="margin-top: 15px;"><button type="button"  class="Button_uibtn__1tGCl Button_uibtn_white__3l1tT Button_uibtn_size_h50__cWPtg"><span class="Icon_uiico__3CpFs Icon_login_sns_naver_s__23ZSw " style="vertical-align: bottom; margin: 0px 6px 17px 0px;">네이버</span> 네이버로 시작하기 </button></div>
                        <div class=" " style="margin-top: 15px;"><button type="button" class="Button_uibtn__1tGCl Button_uibtn_white__3l1tT Button_uibtn_size_h50__cWPtg"><span class="Icon_uiico__3CpFs Icon_login_sns_kakao_s__2oyHe " style="vertical-align: bottom; margin: 0px 6px 16px 0px;">카카오</span> 카카오로 시작하기 </button></div>
                    
                        
                        <div class=" " style="margin-top: 15px;">
                        	<!--  <button type="button" onclick="${google_url}" -->
                        	 <button type="button" onclick="googleLogin();"
                        	 class="Button_uibtn__1tGCl Button_uibtn_white__3l1tT Button_uibtn_size_h50__cWPtg">
                        	 	<span class="Icon_uiico__3CpFs Icon_login_sns_google_s__3yoFR " style="vertical-align: bottom; margin: 0px 6px 15px -15px;">구글</span> 구글로 시작하기 
                        	 </button>
                        </div>
                    </div>
                    <p class="LoginSnsButton_login_warning__IPZhy">공용 PC에서는 소셜로그인 시 계정 관리에 유의해주세요.</p>
                </div>
         
                <div class="Footer_footer_wrap__SixRg"><span class="Footer_copyright__15QJ2">© 사차원</span></div>
            </div>
          
    
    </div>
		<!--end of container  -->
    
</div>	





	</main>

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