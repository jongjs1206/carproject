<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="https://kit.fontawesome.com/c11219882f.js"	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/all/chat.css">
<script type="text/javascript" src="../resources/js/all/chat.js"></script>
<title>채팅</title>

</head>
<body>
	<div class="chat_wrap">
    <div class="header">
        CHAT
    </div>
    <div class="chat">
        <ul>
            
        </ul>
    </div>
    <div class="input-div">
        <textarea placeholder="Press Enter for send message."></textarea>
    </div>
 
    <!-- format -->
 
    <div class="chat format">
        <ul>
            <li>
                <div class="sender">
                    <span></span>
                </div>
                <div class="message">
                    <span></span>
                </div>
            </li>
        </ul>
    </div>
</div>
	
</body>
</html>