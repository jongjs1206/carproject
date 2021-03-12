<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<tbody id="ajaxData">
	<c:forEach items="${salesList}" var="sale">

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
						value="반려"></td>
				</c:when>
				<c:otherwise>
					<td align="center"></td>
				</c:otherwise>
			</c:choose>
		</tr>

	</c:forEach>

</tbody>

