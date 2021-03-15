$(function() {

   
        $(document).on('keydown', '.msg', function(e){
            	if(e.keyCode == 13 && !e.shiftKey) {
                	e.preventDefault();
               	 	sendMessage();
            	}
        });
    
		var webSocket = new WebSocket(
				"ws://localhost:8080/carproject/chatsocket");
		// 콘솔 텍스트 에리어 오브젝트
		var messageTextArea = $(".chat>ul");
		
		
		/// WebSocket 서버로 부터 메시지가 오면 호출되는 함수
		webSocket.onmessage = function(message) {
			// 콘솔 텍스트에 메시지를 출력한다.
			messageTextArea.append('<li class="left"><div class="sender">'
			+message.data.split("=>")[0]+'</div></li>');
			messageTextArea.append('<li class="left" ><div class="message">'
			+message.data.split("=>")[1]
			+'</div></li>')
		};
		// Send 버튼을 누르면 호출되는 함수
		function sendMessage() {
			// 유저명 텍스트 박스 오브젝트를 취득
			var user;
			// 송신 메시지를 작성하는 텍스트 박스 오브젝트를 취득
			var message = $(".msg");
			// 콘솔 텍스트에 메시지를 출력한다.
			if($('.login_name').val()==''){
				messageTextArea.append('<li class="right"><div class="sender">'
				+'익명'
				+'</div></li>')
				user = '익명'
			}else{
				messageTextArea.append('<li class="right"><div class="sender">'
				+$('.login_name').val()
				+'</div></li>')
				user = $('.login_name').val()
			}
			messageTextArea.append('<li class="right" ><div class="message">'
			+message.val()
			+'</div></li>')
			// WebSocket 서버에 메시지를 전송(형식 「{{유저명}}메시지」)
			webSocket.send("{{" + user + "}}" + message.val());
			// 송신 메시지를 작성한 텍스트 박스를 초기화한다.
			message.val("");
		}
		
})	// end of 전체 function()
