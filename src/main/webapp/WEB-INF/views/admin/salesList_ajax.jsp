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
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>
<body>
            
            <!-- 대시보드 내용 -->


<div>
	<table class="table table-bordered" id="dataTable" width="100%"
		cellspacing="0">

		<!-- 예시 데이터 삽입 -->
		<thead>

			<tr>
				<th>ㅁ</th>
				<td>썸네일</td>
				<th>판매자</th>
				<th>판매차량</th>
				<th>날짜(등록/게시)</th>
				<th><select name="searchStatus" id="searchStatus">
						<option value="상태선택" selected="selected">상태선택</option>
						<option value="등록대기">등록대기</option>
						<option value="게시중">게시중</option>
						<option value="게시종료">게시종료</option>
						<option value="판매완료">판매완료</option>
						<option value="삭제">삭제</option>
				</select></th>
				<th></th>
			</tr>
		</thead>


		<tbody>
			<c:forEach items="${sale_list}" var="sale">

				<tr>
					<th><input type="checkbox"></th>
					<td>img</td>
					<td>${sale.m_id}</td>
					<td>${sale.title}</td>
					<td>${sale.w_date}</td>
					<td>${sale.status}</td>
					<c:set var="status" value="${sale.status}" />
					<c:choose>
						<c:when test="${status eq '등록대기'}">
							<td align="center"><input type="button"
								class="btn btn-primary" onclick="location.href='editsales.do'"
								value="게시/반려"></td>
						</c:when>
						<c:otherwise>
							<td align="center"></td>
						</c:otherwise>
					</c:choose>
				</tr>

			</c:forEach>

		</tbody>
	</table>
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