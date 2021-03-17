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
     	<%@ include file="./side.jsp"%>
            
            <!-- 대시보드 내용 -->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid"> 
                    <ul></ul> 
                        <div class="row"> 
							<!-- 메인페이지 카드 메뉴 1 -->
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">판매글</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="salesList.do">자세히 보기</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 메인페이지 카드 메뉴 2 -->
                            <!-- <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">고객문의</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="userinquiry.do">자세히 보기</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div> -->
                            
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
                           <!--  <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">구매후기</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="purchasereview.do">자세히 보기</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                        
                        <!-- 그래프 부분-->
                        <div class="row">
                            <!-- 꺾은선 그래프 -->
                            <div class="col-xl-6" style="padding: 0 30px 0 25px;">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar mr-1"></i>
                                        일별 코인 충전 현황 
                                    </div>
                                    <div class="card-body" style="width:700px; height:400px;">
                                    	<canvas id="dailymyChart" width="700px;" height="350px;" style="padding:0 0 0 10px;">
                                    	</canvas>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 막대 그래프 -->
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area mr-1"></i> 
                                        월별 코인 충전 현황
                                    </div>
                                    <div class="card-body" style="width:700px; height:400px;">
                                    	<canvas id="monthlymyChart" width="700px" height="350px" style="padding:0 0 0 30px;">
                                    	</canvas>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 꺾은선 그래프 -->
                            <!-- <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area mr-2"></i>
                                        일일 방문 현황(엘라스틱 서치)
                                    </div>
                                    <div class="card-body"><canvas id="sellAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div> -->
                            
                            <!-- 막대 그래프 -->
                            <!-- <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar mr-2"></i>
                                        월별 방문 현황(엘라스틱 서치)
                                    </div>
                                    <div class="card-body"><canvas id="sellBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div> -->
                        
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
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/admin/datatables-coin.js"></script>
        
        
        <!-- 차트용 스크립트 시작-->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		<script src="https://cdn.jsdelivr.net/gh/emn178/chartjs-plugin-labels/src/chartjs-plugin-labels.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-colorschemes@0.4.0/dist/chartjs-plugin-colorschemes.min.js"></script>
		<!-- 일별 차트용 스크립트 시작 -->
		<script>
		var ctx = document.getElementById('dailymyChart');
		var myChart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: [
					<c:forEach items="${coinchart}" var="coin">
						'${coin.day}',
					</c:forEach> 
				],
				datasets: [{
					label: '일별',
					data: [
						<c:forEach items="${coinchart}" var="coin">
		        			'${coin.price}',
						</c:forEach> 
					],
					backgroundColor: [
						'rgba(255, 99, 132, 0.2)',
			        	'rgba(54, 162, 235, 0.2)',
			        	'rgba(54, 162, 235, 0.2)',
			        	'rgba(255, 206, 86, 0.2)',
			        	'rgba(255, 206, 86, 0.2)',
			        	'rgba(255, 206, 86, 0.2)',
			        	'rgba(255, 206, 86, 0.2)',
			        	'rgba(255, 206, 86, 0.2)',
			        	'rgba(255, 206, 86, 0.2)'
					],
					borderColor: [
						'rgba(255, 99, 132, 1)',
			        	'rgba(54, 162, 235, 1)',
			        	'rgba(54, 162, 235, 1)',
			        	'rgba(255, 206, 86, 1)',
			        	'rgba(255, 206, 86, 1)',
			        	'rgba(255, 206, 86, 1)',
			        	'rgba(255, 206, 86, 1)',
			        	'rgba(255, 206, 86, 1)',
			        	'rgba(255, 206, 86, 1)'
					],
					borderWidth: 1
				}]
			},
			options: {
				responsive: false
			}
		});
		</script>	<!-- 일별 차트용 스크립트 끝 -->
		
		<!-- 월별 차트용 스크립트 시작 -->
		<script>
		var ctx = document.getElementById('monthlymyChart');
		var myChart = new Chart(ctx, {
			type: 'line',
			data: {
				labels: [
					<c:forEach items="${monthlycoin}" var="coin">
						'${coin.day}',
					</c:forEach> 
				],
				datasets: [{
					label: '월별',
					data: [
						<c:forEach items="${monthlycoin}" var="coin">
		        			'${coin.price}',
						</c:forEach> 
					],
					backgroundColor: 'rgba(17, 46, 65, 0.2)',
					borderColor: '#112e41',
					borderWidth: 1,
					fill:true
				}]
			},
			options: {
				responsive: false
			}
		});
		</script>	<!-- 월별 차트용 스크립트 끝-->

    </body>
</html>