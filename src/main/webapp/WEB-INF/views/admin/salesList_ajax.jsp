<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<script>

$.ajax({
	type : 'post',
	async : true,
	url : '../admin/salesList_ajax.do',
	beforeSend : function(xhr)
	{	
		xhr.setRequestHeader(header, token);
	},
	contentType: "application/x-www-form-urlencoded;charset=utf-8",
	dataType : 'html',
 	data : {"startDate" : startDate.val(),
 			"endDate": endDate.val(),
 			"status" : searchStatus.val(),
 			"byTitle" : byTitle.val()
 	
 	},
 	success : function(result){
 	alert('ajax4');
 	
 	},
 	
 	
error:function(data, status, opt)
{
    alert("code:"+data.status+"\n"+"message:"+data.responseText+"\n"+"error:"+opt);
 		
 	}
 	
 }) 





</script>