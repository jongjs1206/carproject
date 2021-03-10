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
        <title>관리자페이지_ajax</title>
        <link href="../resources/css/admin/styles.css" rel="stylesheet" type="text/css"/> <!-- css파일 import -->
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>

    <!-- 페이지 내용 부분 -->
    <body class="sb-nav-fixed">


            
            <!-- 대시보드 내용 -->
     

                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    
                                        <!-- 예시 데이터 삽입 -->
                                        <thead>
                                     
                                            <tr>
                                                <th>이미지 파일</th>
                                                <th>판매자 아이디</th>                                                
                                                <th>차량정보</th>
                                                <th>차량옵션</th>
                                                <th>설명글</th>
                                                <th>상태</th>  
                                            </tr> 
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>판매자 아이디1</td>
                                                <td>이미지 파일1</td>
                                                <td>차량정보1</td>
                                                <td>차량옵션1</td>
                                                <td>설명글1</td>
                                                <td align="center"><input type="button" class="btn btn-primary" onclick="location.href='editsales.do'" value="수정하기"></td>  
                                            </tr> 
                                            <tr>
                                                <td>판매자 아이디2</td>
                                                <td>이미지 파일2</td>
                                                <td>차량정보2</td>
                                                <td>차량옵션2</td>
                                                <td>설명글2</td>
                                                <td align="center"><input type="button" class="btn btn-primary" onclick="location.href='editsales.do'" value="수정하기"></td>  
                                            </tr>
                                            <tr>
                                                <td>판매자 아이디3</td>
                                                <td>이미지 파일3</td>
                                                <td>차량정보3</td>
                                                <td>차량옵션3</td>
                                                <td>설명글3</td>
                                                <td align="center"><input type="button" class="btn btn-primary" onclick="location.href='editsales.do'" value="수정하기"></td>  
                                            </tr>
                                        </tbody> 
                                    </table>
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
