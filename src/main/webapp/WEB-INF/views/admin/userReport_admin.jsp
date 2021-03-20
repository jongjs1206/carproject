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
       <link href="../resources/css/admin/admin.css" rel="stylesheet" type="text/css"/> 
        <link href="../resources/css/user/notelist.css" rel="stylesheet" type="text/css"/> 
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
                        <h2 class="mt-4">신고 목록</h2>
                        <div class="card mb-4">
                            <div class="card-header">
                            <c:choose>
                            <c:when test="${ok eq 'y'}">
                            <a href="userReport_admin.do"><span class="cursor">[<i class="fas fa-flag-checkered"></i>신고목록]</span> </a>
                             <a href="userReport_admin.do?ok=y"><span class="cursor bold">[<i class="fas fa-radiation-alt"></i> 처리완료]</span> </a>
                            </c:when>
                            <c:otherwise>
                            <a href="userReport_admin.do"><span class="cursor bold">[<i class="fas fa-flag-checkered"></i>신고목록]</span> </a>
                                <a href="userReport_admin.do?ok=y"><span class="cursor">[<i class="fas fa-radiation-alt"></i> 처리완료]</span> </a>
                            </c:otherwise>
                            </c:choose>
                            
                            
                            
                                
                                
                                
                                
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    
                                        <!-- 예시 데이터 삽입 -->
                                        <thead>
                                        
                                            <tr>
                                                <th> <input type="button" id="reportingCheckBtn" class="btn btn-primary" value="처리완료"> </th>  
                                                <th>신고번호</th>  
                                                <th>피신고자</th>                                            
                                                <th>신고자</th>
                                                <th>신고내용</th>                                              
                                                <th>일시</th>
                                            </tr>
                                           </thead>
                                         <tbody>
                                        <!-- AdminController에서 blacklist에 있는 값을 반복문으로 모두 불러옴 -->
                                            <c:forEach items="${reportList}" var="report" >
			                                	<tr>
			                                    	<td><input type="checkbox" name="chkbox" class="ck_note"></td>
			                                    	<td>${report.de_num}</td>			                                    
			                                    	<td>${report.to_id}
			                                    	<c:if test="${report.state eq 'black'}"><span style="color : #B9062F;">(블랙유저)</span> </c:if>
			                                    	
			                                    	</td>
			                                    	<td>${report.m_id}</td>
			                                    	<td><a  href="javascript:void(0);" id="${report.de_num}" class="cursor" onclick="showReport(this)">${report.content}</a></td>
			                                    	<td>${report.de_date}</td>			                   
			                                   	 </tr>    
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
        <script type="text/javascript" src="../resources/js/admin/admin_reporting.js"></script>
    </body>
</html>

