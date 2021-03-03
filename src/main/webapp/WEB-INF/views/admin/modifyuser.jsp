<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<!-- 브라우저 최상단 탭 명 -->

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>관리자페이지</title>
    <link href="../resources/css/admin/styles.css" rel="stylesheet" type="text/css" /> <!-- css파일 import -->
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"
        crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
        crossorigin="anonymous"></script>
    
    <script type="text/javascript">
 
		/* ajax를 통한 비밀번호 수정처리 */
		function updateAuth() {
		    
		    var m_id = $("#m_id").val();
		    var auth = $("#auth").val();
		    
		    var param = {"m_id":m_id, "auth":auth}
		    
	        $.ajax({
	            anyne:true,
	            type:'POST',
	            data: JSON.stringify(param),
	            url:"/modifyuser",
	            dataType: "text",
	            contentType: "application/json; charset=UTF-8",
	            success : function(data) {    
	                alert("권한이 변경되었습니다.");
	                location.href="/adminlist";
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                alert("ERROR : " + textStatus + " : " + errorThrown);
	            }        
	        })
		}
		    
		
	</script>
</head>

<!-- 페이지 내용 부분 -->

<body class="sb-nav-fixed" style="overflow:hidden">

	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
		
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- 상단 제목 -->
        <a class="navbar-brand" href="./admin.do">관리자 페이지</a>
        <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"></button>
        <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        </form>
        <!-- 회원 아이콘 드롭다운 메뉴 -->
        <ul class="navbar-nav ml-auto ml-md-0">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user fa-fw"></i></a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                
                    <!-- 메인페이지 이동 -->
                        <a class="dropdown-item" href="../all/homepage.do">메인 페이지 이동</a> 
                        <div class="dropdown-divider"></div>
                </div>
            </li>
        </ul>
    </nav>
    
    <!-- 좌측 메뉴 -->
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">
                            <h4>메뉴</h4>
                        </div>
                        <a class="nav-link collapsed" href="#" data-toggle="collapse"
                            data-target="#collapseLayouts" aria-expanded="false"
                            aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>회원관리
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                            data-parent="#sidenavAccordion" style="">
                            <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="./userlist.do">회원목록</a>
                                    <a class="nav-link" href="./withdrawal.do">탈퇴회원목록</a> 
                                    <a class="nav-link" href="./blacklist.do">블랙리스트목록</a>
                                    <a class="nav-link" href="./adminlist.do">관리자목록</a>  
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseone" aria-expanded="false" aria-controls="collapseAdd">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>코인현황
                            </a>
                            <div class="collapse" id="collapseone" aria-labelledby="headingOne" data-parent="#sidenavAccordion" style="">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="./dailycoin.do">일별코인충전</a>
                                    <a class="nav-link" href="./monthlycoin.do">월별코인충전</a>
                                </nav>
                        </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsetwo" aria-expanded="false" aria-controls="collapseAdd">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>방문현황
                            </a>
                            <div class="collapse" id="collapsetwo" aria-labelledby="headingOne" data-parent="#sidenavAccordion" style="">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="./dailysales.do">일일방문현황</a>
                                    <a class="nav-link" href="./monthlysales.do">월별방문충전</a>
                            </nav>
                        </div>

                        <a class="nav-link collapsed" href="#" data-toggle="collapse"
                            data-target="#collapsethree" aria-expanded="false" aria-controls="collapseAdd">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>게시글관리
                        </a>
                        <div class="collapse" id="collapsethree" aria-labelledby="headingOne"
                            data-parent="#sidenavAccordion" style="">
                            <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="./salesarticlelist.do">판매글</a>
                                    <a class="nav-link" href="./userinquiry.do">고객문의</a> 
                                    <a class="nav-link" href="./carnews.do">자동차뉴스</a>
                                    <a class="nav-link" href="./purchasereview.do">구매후기</a>
                            </nav>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
        
        <!-- 대시보드 내용 -->
        <div id="layoutSidenav_content">
            <main>
                <form action="modifyuser.do" method="post">
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="form-group row">
                        
                        <!-- 아이디 -->                       
                        <div class="form-group col-md-12"></div> 
                        <div class="form-group col-md-12"></div> 
                        <div class="form-group col-md-12"></div> 
                        <div class="form-group col-md-12"></div> 
                        <div class="form-group col-md-12"></div> 
                        <div class="form-group col-md-12"></div> 
                        
                        <div class="form-group col-md-3"></div>
                        
                        <div class="form-group col-md-6">
                            <label for="inputEmail3">ID</label>
                            <input type="ID" class="form-control" id="inputID" name="inputId" value=${update.m_id} readonly>
                        </div>
                        
                        <div class="form-group col-md-3"></div>
                        
                        <!-- 성별 -->
                        <div class="form-group col-md-3"></div>                                
                        <div class="form-group col-md-3">
                            <label for="inputState">성별</label>
                            <select id="inputGender" name="inputGender" class="form-control">
                                <option selected>남</option>
                                <option>여</option>
                            </select>
                        </div>                   
                        
                        <!-- 이름 -->                             
                        <div class="form-group col-md-3">
                            <label for="inputAddress">이름</label>
                            <input type="text" class="form-control" id="inputName" name="inputName" size="40px"
                                value=${update.m_name}>
                        </div>
                        <div class="form-group col-md-3"></div> 
                                                                                     
                        <!-- 이메일 -->
                        <div class="form-group col-md-3"></div>                                
                        <div class="form-group col-md-6">
                            <label for="inputAddress">이메일</label>
                            <input type="text" class="form-control" id="inputEmail" name="inputEmail" size="40px"
                                value=${update.email}>
                        </div>
                        <div class="form-group col-md-3"></div>
                        
                        
                        <!-- 전화번호 -->
                        <div class="form-group col-md-3"></div>                                
                        <div class="form-group col-md-3">
                            <label for="inputAddress">휴대폰번호</label>
                            <input type="text" class="form-control" id="inputPhone" name="inputPhone" size="40px"
                                value=${update.tel}> 
                            </select>
                        </div>     
                        
                        <!-- 생년월일 -->                        
                        <div class="form-group col-md-3">
                            <label for="inputAddress">생년월일</label>
                            <input type="text" class="form-control" id="inputBirth" name="inputBirth" size="40px"
                                value=${update.birth}>
                        </div>

                        <div class="form-group col-md-3"></div> 
                        <div class="form-group col-md-12"></div> 
                        
                        <!-- Button -->
                        <div class="form-group col-md-3"></div>          
                        <div class="form-group col-md-2">     
                          <button type="submit" class="btn btn-primary">수정하기</button>
                        </div>   
                        </form>
                        <div class="form-group col-md-2">  
                          <input type="button" class="btn btn-primary" onclick="location.href='setAdmin.do?id=${update.m_id}'" value="관리자부여"> 
                        </div> 
                         <div class="form-group col-md-2">   
                          <input type="button" class="btn btn-primary" onclick="location.href='setBlacklist.do?id=${update.m_id}'" value="블랙리스트추가">
                        </div>                                                                     
                    </div>

                 
            </main>
            
            <!-- 최하단 footer -->
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; 사차원</div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    
    <!-- javascript 파일 import -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
        crossorigin="anonymous"></script>
    <script src="../resources/js/admin/chart-area-demo.js"></script>
    <script src="../resources/js/admin/chart-bar-demo.js"></script>
    <script src="../resources/js/admin/chart-area-demo.js"></script>
    <script src="../resources/js/admin/chart-bar-demo.js"></script>
</body>

</html>