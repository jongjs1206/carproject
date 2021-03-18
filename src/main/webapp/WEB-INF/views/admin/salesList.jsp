<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <link href="../resources/css/admin/admin.css" rel="stylesheet" type="text/css"/>      
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
     
            <input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
          
            <div id="layoutSidenav_content">
                    <div class="container-fluid">
                        <h2 class="mt-4">판매글</h2>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                판매 정보 (첫 로딩 시 최근 한달)
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                <input type="date" id="startDate">
                                <span><i class="fas fa-wave-square"></i></span>                            
                                
                                <input type="date" id="endDate">
                                <a id="searchDates"><i class="fas fa-search"></i></a>

                               
                               <div  id="indexListAjax">                         
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    
                                        <!-- 예시 데이터 삽입 -->
                                        <thead>
                                     
                                            <tr>
                                            	<td>num</td>                                                
                                                <td>썸네일</td>
                                                <th>이미지분석</th>
                                                <th>판매자</th>
                                                <th>판매차량</th>
                                                <th>날짜(등록/게시)</th>
                                                <th><select name="searchStatus" id="searchStatus">
												<option value="상태선택">상태선택</option>
												<option value="등록대기">등록대기</option>
												<option value="게시중">게시중</option>
												<option value="게시종료">게시종료</option>
												<option value="판매완료">판매완료</option>
												<option value="반려">반려</option>
												</select> 
                                                
                                                </th>
                                                <th></th>
                                                <th></th>  
                                            </tr> 
                                        </thead>
                                        
                                        
                                        <tbody>
                                        	<c:forEach items="${salesList}" var="sale">
                                        		
                                            <tr>                                      
                                           		<td>${sale.sell_id}</td>
                                                <td><img src="${sale.image}img1.png" alt="썸네일" style="width: 70px"></td>
                                                <td>
                                                	<c:choose>
                                                		<c:when test="${sale.analysis eq 'True'}">
                                                			${sale.analysis}
                                               			</c:when>
                                               			<c:when test="${sale.analysis eq 'False'}">
                                                			<b>${sale.analysis}</b>
                                               			</c:when>
                                                	</c:choose>
                                                </td>
                                                <td>${sale.m_id}</td>
                                                <td><a href="../all/salesDetail.do?num=${sale.sell_id}">${sale.title}</a></td>
                                                <td>${sale.w_date}</td>
                                                <td>${sale.status}</td>
                                                <c:set var="status" value="${sale.status}" />
													<c:choose>
														<c:when test="${status eq '등록대기'}">
															<td align="center">											
															<input type="button" class="btn btn-primary" onclick="location.href='setPosting.do?sellid=${sale.sell_id}' " value="등록">									
															</td>
														</c:when>
														<c:otherwise>											
															<td align="center"></td>
														</c:otherwise>
													</c:choose>
												<td>
													<c:if test="${status eq '등록대기'}">
														<input type="button" class="btn btn-danger" onclick="location.href='returnPosting.do?sellid=${sale.sell_id}' " value="반려">
													</c:if>
												</td>
											</tr> 
                                           
                                            </c:forEach>
                                            
                                        </tbody> 
                                    </table>
                                </div>
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
		<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/admin/datatables-demo.js"></script>
        <script type="text/javascript" src="../resources/js/admin/admin_salesList.js"></script>
    </body>
</html>