<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">


<title>Hotel</title>
<script type="text/javascript">

const m_id = ${userinfo.m_id};
const m_pw = ${userinfo.m_pw};

alert(m_id)
alert(m_pw)

//$('#login').submit();

</script>
</head>
<body>

<input type="text" id="m_id" name="m_id" value="${userinfo.m_id}">
<input type="text" id="m_pw" name="m_pw" value="${userinfo.m_pw}">


</body>
</html>