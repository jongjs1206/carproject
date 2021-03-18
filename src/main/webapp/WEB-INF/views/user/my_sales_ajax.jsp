<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax </title>


</head>
<body>
	
 		
			<!-- 이 안에 DB 내용 가져올 예정 ↓↓↓↓↓  -->
	<div id="indexListAjax">
		<!-- js로 총 게시물 개 수 넘기기 -->		
		<input type="hidden" id="totalcnt" value="${cnt}"/>
		<input type="hidden" id="totalpage" value="${totalpage}"/>

		<c:if test="${cnt eq 0}">
		<div class="nothingToInsert">	
		<h2>등록한 판매글이 없습니다.</h2>
		</div>
		</c:if>
		
		
		<c:forEach items="${sale_list}" var="sale">
			<div class="blog_details news-container">
				<a class="d-inline-block news-thumb"
					href="../all/salesDetail.do?num=${sale.sell_id}"> <img
					src="${sale.image}img1.png" alt="썸네일" style="width: 250px">
				</a> 
				<a class="" href="../all/salesDetail.do?num=${sale.sell_id}">
					<div>
						<span class="date">${sale.w_date}</span> 
						<span class="status">${sale.status}</span>
					</div>
					<div>
					<h2>${sale.title}</h2>
					</div>
					<div class="car-estimate">
						<span>${sale.price} 만원</span>
					</div>
				</a>
			</div>
		</c:forEach>
	</div>
			<!-- 이 안에 DB 내용 가져올 예정 ↑↑↑↑↑  -->


</body>
</html>