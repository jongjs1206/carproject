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
       <%@ include file="./side.jsp"%>
            
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
                                                <th>코인</th>
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
			                                      <td>${row.coin}</td>
			                                    <td align="center"><a href='../admin/modifyuser.do?id=${row.m_id}'><input type="button" class="btn btn-primary" value="수정하기"></a></td>                                  </tr>    
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