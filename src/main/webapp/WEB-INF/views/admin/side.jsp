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
        <title>side</title>
        <link href="../resources/css/admin/styles.css" rel="stylesheet" type="text/css"/> <!-- css파일 import -->
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
		integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
		crossorigin="anonymous"></script>
	        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript">
        $(function(){        	

        	$('#ga4').click(function(){
        		url = 'https://analytics.google.com/analytics/web';
        		alias = '애널리틱스';
        		window.open(url, alias);
        	}) 
        })
        
        </script>
        
    </head>
  
 
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
                                    <a class="nav-link" href="member_user.do">회원목록</a> 
                                    <a class="nav-link" href="member_blacklist.do">블랙리스트목록</a>
                                    <a class="nav-link" href="member_admin.do">관리자목록</a> 
									<a class="nav-link" href="userReport_admin.do">신고목록	</a>  
                                </nav>
                            </div>
                           <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsethree" aria-expanded="false" aria-controls="collapseAdd">
                             <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>게시글관리
                             </a>
                             <div class="collapse" id="collapsethree" aria-labelledby="headingOne" data-parent="#sidenavAccordion" style="">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="salesList.do">판매글</a>                          
                                    <a class="nav-link" href="carnews.do">자동차뉴스</a>                              
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
                            <a id="ga4" class="nav-link collapsed" data-toggle="collapse" data-target="#collapsetwo" aria-expanded="false" aria-controls="collapseAdd"
                            	style="cursor: pointer;">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>애널리틱스
                            </a>
                            <div class="collapse" id="collapsetwo" aria-labelledby="headingOne" data-parent="#sidenavAccordion" style="">
                            </div>
                            

                        </div>
                    </div>
                </nav>
            </div>
</html>