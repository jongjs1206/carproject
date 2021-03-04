<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <link href="../resources/css/admin/styles.css" rel="stylesheet" type="text/css"/> <!-- css파일 import -->
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>
 
    <!-- 페이지 내용 부분 -->
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        
            <!-- 상단 제목 -->
            <a class="navbar-brand" href="./admin.do">관리자 페이지</a>  
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"></button>   
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
            </form>
            <!-- 회원 아이콘 드롭다운 메뉴 -->
            <ul class="navbar-nav ml-auto ml-md-0"> 
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                            <div class="sb-sidenav-menu-heading"><h4>메뉴</h4></div>  
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>회원관리
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion" style="">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="userlist.do">회원목록</a>
                                    <a class="nav-link" href="withdrawal.do">탈퇴회원목록</a>
                                    <a class="nav-link" href="blacklist.do">블랙리스트목록</a> 
                                    <a class="nav-link" href="adminlist.do">관리자목록</a> 
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseone" aria-expanded="false" aria-controls="collapseAdd">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>코인현황
                            </a>
                            <div class="collapse" id="collapseone" aria-labelledby="headingOne" data-parent="#sidenavAccordion" style="">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="dailycoin.do">일별코인충전</a>
                                    <a class="nav-link" href="monthlycoin.do">월별코인충전</a>  
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsetwo" aria-expanded="false" aria-controls="collapseAdd">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>방문현황
                            </a>
                            <div class="collapse" id="collapsetwo" aria-labelledby="headingOne" data-parent="#sidenavAccordion" style="">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="dailysales.do">일일방문현황</a> 
                                    <a class="nav-link" href="monthlysales.do">월별방문현황</a> 
                                </nav>
                            </div>
                            
                             <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsethree" aria-expanded="false" aria-controls="collapseAdd">
                             <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>게시글관리
                             </a>
                             <div class="collapse" id="collapsethree" aria-labelledby="headingOne" data-parent="#sidenavAccordion" style="">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="salesarticlelist.do">판매글</a>
                                    <a class="nav-link" href="userinquiry.do">고객문의</a>
                                    <a class="nav-link" href="carnews.do">자동차뉴스</a>
                                    <a class="nav-link" href="purchasereview.do">구매후기</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
            
            <!-- 대시보드 내용 -->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid"> 
                    <ul></ul> 
                        <div class="row"> 
                            <div class="col-xl-3 col-md-6">
                            
                                <!-- 메인페이지 카드 메뉴 1 -->
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">판매글</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="salesarticlelist.do">자세히 보기</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 메인페이지 카드 메뉴 2 -->
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">고객문의</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="userinquiry.do">자세히 보기</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 메인페이지 카드 메뉴 3 -->
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">자동차 뉴스</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="carnews.do">자세히 보기</a> 
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div> 
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 메인페이지 카드 메뉴 4 -->
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">구매후기</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="purchasereview.do">자세히 보기</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 그래프 부분-->
                        <div class="row">
                            <!-- 꺾은선 그래프 -->
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area mr-1"></i>
                                        일별 코인 충전 현황 
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            
                            <!-- 막대 그래프 -->
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar mr-1"></i> 
                                        월별 코인 충전 현황
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            
                            <!-- 꺾은선 그래프 -->
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area mr-2"></i>
                                        일일 방문 현황(엘라스틱 서치)
                                    </div>
                                    <div class="card-body"><canvas id="sellAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            
                            <!-- 막대 그래프 -->
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar mr-2"></i>
                                        월별 방문 현황(엘라스틱 서치)
                                    </div>
                                    <div class="card-body"><canvas id="sellBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/admin/chart-area-demo.js"></script>
        <script src="../resources/js/admin/chart-bar-demo.js"></script>
        <script src="../resources/js/admin/chart-area-sell.js"></script>
        <script src="../resources/js/admin/chart-bar-sell.js"></script>
    </body>
</html>

