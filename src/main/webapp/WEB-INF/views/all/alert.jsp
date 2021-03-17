<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 코인비보유자 alert용 페이지 </title>
</head>
<body>

<input type="hidden" class='login_on' value='${sessionScope.info.m_id}'/>	

<script type="text/javascript">
	var msg = "코인 충전 후 글 작성하실 수 있습니다.";
	console.log(msg);
	alert(msg);
	var url = "../user/coin.do?m_id=${sessionScope.info.m_id}";
	console.log(url);
	window.location.href = url;
</script>

</body>
</html>