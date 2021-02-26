<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Dreams Template">
<meta name="keywords" content="Dreams, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>Insert title here</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700;800&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/style.css" type="text/css">
<link rel="stylesheet" href="../resources/css/member_style.css" type="text/css">
</head>
<body>
	
	
    <!-- 로그인 -->
<div class="container"> 
	 <div class="box-login">
        <div id="wrap">
                <div class="header_wrap" data-testid="header">
                    <h1 class="Header_logo_big__2fSem"><a href="/mycar/all/homepage.do"><img src="" alt="logo" class="Header_img__20HzF"></a></h1>
                </div>
                <div class="Layout_contents__2nVdg Layout_normal__2IFQF">
                    <c:url value="/login" var="loginUrl" />
					<form:form action='${loginUrl}' method='post'>
                        <div>
                            <div class="">
                                <div class="AlignBoxInput_uialign_block__3ZoMq">
                                    <div class="AlignBoxInput_uialign_item__3Gy6x col1">
                                        <div class="InputText_uiinput_txt__3jtqA" data-testid="wrap_input"><label for="id" class="blind">아이디</label>
                                            <div class="InputText_inner_square__38iB2 InputText_normal__1Fp25"><input type="text" id="id" name="id" maxlength="20" data-testid="input" inputmode="" value="">
                                                <div class="InputText_placeholder_text__13dap" role="button">아이디</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="AlignBoxInput_uialign_item__3Gy6x col1">
                                        <div class="InputText_uiinput_txt__3jtqA" data-testid="wrap_input" style="margin-top: 10px;"><label for="password" class="blind">비밀번호</label>
                                            <div class="InputText_inner_square__38iB2 InputText_normal__1Fp25"><input type="password" id="password" name="password" maxlength="" data-testid="input" inputmode="" value="">
                                                <div class="InputText_placeholder_text__13dap" role="button">비밀번호</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="" style="margin-top: 15px;">
                                <div class="AlignBoxInput_uialign_inline__1-PtZ">
                                    <div class="AlignBoxInput_uialign_item__3Gy6x col2"><span class="dIB" style="margin-right: 10px;"><span class="InputCheckBox_uiinput__3nGZz"><input type="checkbox" id="autid" name="autoid"><label for="autid" class="txt_item InputCheckBox_label_size14__39GjL"><span class="">아이디 저장</span></label></span></span></div>
                                </div>
                            </div>
                            <div class=" " style="margin-top: 30px;"><button type="button" class="Button_uibtn__1tGCl Button_uibtn_silver__3Ho2C Button_uibtn_size_h50__cWPtg" disabled=""> 로그인 </button></div>
                        </div>
                    </form:form>
                    <div class="LoginMyFindButton_area__245Jy"><a class="LoginMyFindButton_link__fee2S" href="/mycar/all/find_idpw.do">아이디/비밀번호 찾기</a><a class="LoginMyFindButton_link__fee2S" href="/mycar/all/join.do">회원가입</a></div>
                    <div class="LoginSnsButton_tit_area__bRqmB"><strong class="LoginSnsButton_tit__1kT5i">간편하게 시작하기</strong></div>
                    <div class="LoginSnsButton_btn_area__1HZfa">
                        <div class=" " style="margin-top: 15px;"><button type="button" class="Button_uibtn__1tGCl Button_uibtn_white__3l1tT Button_uibtn_size_h50__cWPtg"><span class="Icon_uiico__3CpFs Icon_login_sns_naver_s__23ZSw " style="vertical-align: bottom; margin: 0px 6px 17px 0px;">네이버</span> 네이버로 시작하기 </button></div>
                        <div class=" " style="margin-top: 15px;"><button type="button" class="Button_uibtn__1tGCl Button_uibtn_white__3l1tT Button_uibtn_size_h50__cWPtg"><span class="Icon_uiico__3CpFs Icon_login_sns_kakao_s__2oyHe " style="vertical-align: bottom; margin: 0px 6px 16px 0px;">카카오</span> 카카오로 시작하기 </button></div>
                        <div class=" " style="margin-top: 15px;"><button type="button" class="Button_uibtn__1tGCl Button_uibtn_white__3l1tT Button_uibtn_size_h50__cWPtg"><span class="Icon_uiico__3CpFs Icon_login_sns_google_s__3yoFR " style="vertical-align: bottom; margin: 0px 6px 15px -15px;">구글</span> 구글로 시작하기 </button></div>
                    </div>
                    <p class="LoginSnsButton_login_warning__IPZhy">공용 PC에서는 소셜로그인 시 계정 관리에 유의해주세요.</p>
                </div>
                <div class="Footer_footer_wrap__SixRg"><span class="Footer_copyright__15QJ2">© 사차원</span></div>
            </div>
           
    
    </div>
		<!--end of container  -->
    
</div>

    
    
    
    <!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search End -->
	
	
    <!-- Js Plugins -->
    <script src="../resources/js/jquery-3.3.1.min.js"></script>
    <script src="../resources/js/bootstrap.min.js"></script>
    <script src="../resources/js/jquery.nice-select.min.js"></script>
    <script src="../resources/js/jquery.magnific-popup.min.js"></script>
    <script src="../resources/js/jquery-ui.min.js"></script>
    <script src="../resources/js/jquery.slicknav.js"></script>
    <script src="../resources/js/owl.carousel.min.js"></script>
    <script src="../resources/js/main.js"></script>
</body>
</html>