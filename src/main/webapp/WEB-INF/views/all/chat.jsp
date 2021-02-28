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
	
	.my-chat{
		text-align: right;
		background: #F3BD00;
		border-radius: 10px 10px 10px 10px;
	}
	
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
	<form>
	<div id="chatTitle">채팅 <i class="far fa-comments" style="color:#dca73a;font-size:25px;"></i></div>
	<div id="messageArea"></div>
	<input type="text" id="message" />
	<input type="button" id="sendBtn" value="전송"/>
		<!-- 유저 명을 입력하는 텍스트 박스(기본 값은 anonymous(익명)) -->
		<input id="user" type="text" value="anonymous">
		<!-- 송신 메시지를 작성하는 텍스트 박스 -->
		<input id="textMessage" type="text">
		<!-- 메세지를 송신하는 버튼 -->
		<input onclick="sendMessage()" value="Send" type="button">
		<!-- WebSocket 접속 종료하는 버튼 -->
		<input onclick="disconnect()" value="Disconnect" type="button">
	</form>
	<br />
	<!-- 콘솔 메시지의 역할을 하는 로그 텍스트 에리어.(수신 메시지도 표시한다.) -->
	<textarea id="messageTextArea" rows="10" cols="50"></textarea>
	<script type="text/javascript">
		// 「WebSocketEx」는 프로젝트 명
		// 「broadsocket」는 호스트 명
		// WebSocket 오브젝트 생성 (자동으로 접속 시작한다. - onopen 함수 호출)
		var webSocket = new WebSocket(
				"ws://localhost:8080/carproject/all/chat");
		// 콘솔 텍스트 에리어 오브젝트
		var messageTextArea = document.getElementById("messageTextArea");
		// WebSocket 서버와 접속이 되면 호출되는 함수
		webSocket.onopen = function(message) {
			// 콘솔 텍스트에 메시지를 출력한다.
			messageTextArea.value += "Server connect...\n";
		};
		// WebSocket 서버와 접속이 끊기면 호출되는 함수
		webSocket.onclose = function(message) {
			// 콘솔 텍스트에 메시지를 출력한다.
			messageTextArea.value += "Server Disconnect...\n";
		};
		// WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
		webSocket.onerror = function(message) {
			// 콘솔 텍스트에 메시지를 출력한다.
			messageTextArea.value += "error...\n";
		};
		/// WebSocket 서버로 부터 메시지가 오면 호출되는 함수
		webSocket.onmessage = function(message) {
			// 콘솔 텍스트에 메시지를 출력한다.
			messageTextArea.value += message.data + "\n";
		};
		// Send 버튼을 누르면 호출되는 함수
		function sendMessage() {
			// 유저명 텍스트 박스 오브젝트를 취득
			var user = document.getElementById("user");
			// 송신 메시지를 작성하는 텍스트 박스 오브젝트를 취득
			var message = document.getElementById("textMessage");
			// 콘솔 텍스트에 메시지를 출력한다.
			messageTextArea.value += user.value + "(me) => " + message.value
					+ "\n";
			// WebSocket 서버에 메시지를 전송(형식 「{{유저명}}메시지」)
			webSocket.send("{{" + user.value + "}}" + message.value);
			// 송신 메시지를 작성한 텍스트 박스를 초기화한다.
			message.value = "";
		}
		// Disconnect 버튼을 누르면 호출되는 함수
		function disconnect() {
			// WebSocket 접속 해제
			webSocket.close();
		}
	</script>
</body>
</html>



