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
                            
                             <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsethree" aria-expanded="false" aria-controls="collapseAdd">
                             <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>게시글관리
                             </a>
                             <div class="collapse" id="collapsethree" aria-labelledby="headingOne" data-parent="#sidenavAccordion" style="">
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
                    <div class="container-fluid">
                        <h2 class="mt-4">회원목록</h2>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                회원 정보
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    
                                        <!-- 예시 데이터 삽입 -->
                                        <thead>
                                     
                                            <tr>
                                                <th>아이디</th>
                                                <th>이름</th>
                                                <th>성별</th>
                                                <th>이메일</th>
                                                <th>생년월일</th>
                                                <th>휴대폰번호</th>
                                                <th>상태</th>  
                                            </tr> 
                                        </thead>
                                        <tbody>
                                    		<!-- AdminController에서 list에 있는 값을 반복문으로 모두 불러옴 -->
			                                  <c:forEach var="row" items="${list}">
			                                  <tr>
			                                      <td>${row.m_id}</td>
			                                      <td>${row.m_name}</td>
			                                      <td>${row.gender}</td>
			                                      <td>${row.email}</td>
			                                      <td>${row.birth}</td>
			                                      <td>${row.tel}</td>
			                                    <td align="center"><input type="button" class="btn btn-primary" onclick="location.href='modifyuser.do?id=${row.m_id}'" value="수정하기"></td>                                  </tr>    
			                                  </c:forEach>
                                        </tbody> 
                                    </table>
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
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/admin/datatables-demo.js"></script>
    </body>
</html>
