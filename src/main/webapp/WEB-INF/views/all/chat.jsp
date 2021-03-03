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
<title>채팅</title>
<style type="text/css">
	*{
		font-family: 나눔고딕;
	}
	/* #messageWindow{
		background: black;
		color: greenyellow;
	} */
	#message{		/* 입력창 */
		margin: 0 0 0 10px;
		width: 300px;
		height: 20px
	}
	#sendBtn{		/* 전송버튼 */
		background: white;
		background: #dca73a;
		width:45px;
		height:30px;
		color:#0C2B4B;
		border:none;
	}
/* 	#mainMessageArea{
		width:600px;
		height:680px;
		border:1px solid black;
		margin:10px;
		display: inline-block;
	} */
	#messageArea{		/* 채팅창 */
		vertical-align: bottom;
		border: 1px solid black;
		margin:10px;
		min-height: 500px;
		max-height: 500px;
		width: 355px;
		overflow: auto;
		overflow-x: hidden;
		background: #112e41;
	}
	#chatTitle{
		font-family: 나눔고딕;
		font-size: 25px;
		margin:10px;
	}
	
	.chat{
		font-size: 13px;
		color:black;
		margin: 5px;
		min-height: 20px;
		padding: 5px;
		min-width: 10px;
		text-align: left;
        height:auto;
        word-break : break-all;
        background: #ffffff;
        width:auto;
        display:inline-block;
        border-radius: 10px 10px 10px 10px;
	} 
	
	/* .notice{
		color:#607080;
		font-weight: bold;
		border : none;
		text-align: center;
		background-color: #9bbbd4;
		display: block;
	} */

	.my-chat{
		text-align: right;
		background: #F3BD00;
		border-radius: 10px 10px 10px 10px;
	}
	
	/* #bottom-container{
		margin:10px;
	}
	 */
	.chat-info{
		color: #556677;
		font-size: 7px;
		text-align: right;
		padding: 5px;
		padding-top: 0px;
	}
	
	.chat-box{		/* 상대방 말풍선 */
		text-align:left;
	}
	.my-chat-box{	/* 내 말풍선 */
		text-align: right;
	}
</style>
</head>

<body>
	<div id="chatTitle">채팅 <i class="far fa-comments" style="color:#dca73a;font-size:25px;"></i></div>
	<div id="messageArea"></div>
	<input type="text" id="message" />
	<input type="button" id="sendBtn" value="전송"/>
</body>
<script type="text/javascript">
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});

	var socket = new SockJS("http://localhost:8080/mycar/chat/chat/");
	socket.onmessage = onMessage;
	//socket.onclose = onClose;
	
	// 메시지 전송
	function sendMessage() {
		socket.send($("#message").val());
		
		var chatMsg = message.value;
		if(chatMsg == ''){
			return;
		}
		var date = new Date();
		var dateInfo = date.getFullYear() + '년' + date.getMonth() + '월' + date.getDate() + '일 ' + date.getHours() + '시' + date.getMinutes() + '분'
		var $chat = $("<div class='my-chat-box'><div class='chat my-chat'>" + chatMsg + "</div></div>" + "</div><div class='chat-info'>" + dateInfo + "</div></div>");
		$('#messageArea').append($chat);
		socket.send(chatMsg);
		message.value = "";
		$('#messageArea').scrollTop($('#messageArea')[0].scrollHeight+20);
	}
	
	// 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		$("#messageArea").append(data + "<br/>");
	}
	
	// 채팅방을 나갔을 때
	/* function onClose(evt) {
		$("#messageArea").append("퇴장하셨습니다.");
	} */
</script>

<script type="text/javascript">
	$(function(){
		$('#message').keydown(function(key){
			if(key.keyCode == 13){
				$('#message').focus();
				sendMessage();
			}
		});
		$('#sendBtn').click(function(){
			sendMessage();
		});
	})
</script>
</html>



