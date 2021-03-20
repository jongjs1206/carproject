
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import net.sf.json.JSONObject;

// WebSocket 호스트 설정
@ServerEndpoint("/carsocket")
public class CarSocket {
// 접속 된 클라이언트 WebSocket session 관리 리스트
	private static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<>());
// 메시지에서 유저 명을 취득하기 위한 정규식 표현
	private static Pattern pattern = Pattern.compile("^\\{\\{.*?\\}\\}");

// WebSocket으로 브라우저가 접속하면 요청되는 함수
	@OnOpen
	public void handleOpen(Session userSession) {
// 클라이언트가 접속하면 WebSocket세션을 리스트에 저장한다.
		sessionUsers.add(userSession);
// 콘솔에 접속 로그를 출력한다.
		System.out.println("client is now connected");
	}

// WebSocket으로 메시지가 오면 요청되는 함수
	@OnMessage
	public void handleMessage(String message, Session userSession) throws IOException {
		// 메시지 내용을 콘솔에 출력한다.
		System.out.println(message);
		// 초기 유저 명
		String name = "anonymous";
		// 메시지로 유저 명을 추출한다.
		Matcher matcher = pattern.matcher(message);
		// 메시지 예: {{유저명}}메시지
		if (matcher.find()) {
			name = matcher.group();
		}
		// 클로져를 위해 변수의 상수화
		final String msg = message.replaceAll(pattern.pattern(), "");
		final String username = name.replaceFirst("^\\{\\{", "").replaceFirst("\\}\\}$", "");
		// session관리 리스트에서 Session을 취득한다.
		sessionUsers.forEach(session -> {
			// 리스트에 있는 세션과 메시지를 보낸 세션이 같으면 메시지 송신할 필요없다.
			if (session == userSession) {
				return;
			}
			try {
				// 리스트에 있는 모든 세션(메시지 보낸 유저 제외)에 메시지를 보낸다. (형식: 유저명 => 메시지)
				session.getBasicRemote().sendText(msg);
				String userDeviceIdKey = "eAfX4CvITNG_HscEZewPoG:APA91bEXZHcohMYfY599FbAjpccKq2c3KG8pJYY8lzhAgWsoHNyif406ad2GhPxCWFQP6vnp8JunKDmnEe4mJTP5wOcsU0be8X0dMKppOpJpc-g_WP66BRNCPveOEuwZQRedIc8wir4e";
				 
				 //Method to send Notifications from server to client end.
				 // firebase.google.com 사이트에서 해당 프로젝트 > 설정 > 클라우드 메세지 > 서버 키 토큰 복사
				String AUTH_KEY_FCM = "AAAA6ZboNbs:APA91bHoKUmUmMHnHGSraWvjCj7l42aR3_2cakx1By2Z4dTBcKNeDMVLPsjYnOaNs0BjdCyuAixF4UZzkpae1gyRUzdnSc1uV-QMUtmRFv3X7z39O4KyMylftL3Rfnj2QA_tVXYDTLy2";
				String API_URL_FCM = "https://fcm.googleapis.com/fcm/send";


				String authKey = AUTH_KEY_FCM;   // You FCM AUTH key
				String FMCurl = API_URL_FCM;     

				URL url = new URL(FMCurl);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();

				conn.setUseCaches(false); 
				conn.setDoInput(true);
				conn.setDoOutput(true);

				conn.setRequestMethod("POST");
				conn.setRequestProperty("Authorization","key="+authKey);
				conn.setRequestProperty("Content-Type","application/json");

				JSONObject json = new JSONObject();
				json.put("to",userDeviceIdKey.trim());
				JSONObject info = new JSONObject();
				info.put("title", "충돌!!!!");   // Notification title
				info.put("body", "지금 블랙박스에 흔들림이 있었습니다."); // Notification body
				json.put("notification", info);

				OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
				System.out.println(">" + json.toString());
				wr.write(json.toString());
				wr.flush();
				conn.getInputStream();  
			} catch (IOException e) {
				// 에러가 발생하면 콘솔에 표시한다.
				e.printStackTrace();
			}
		});
	}

// WebSocket과 브라우저가 접속이 끊기면 요청되는 함수
	@OnClose
	public void handleClose(Session userSession) {
// session 리스트로 접속 끊은 세션을 제거한다.
		sessionUsers.remove(userSession);
// 콘솔에 접속 끊김 로그를 출력한다.
		System.out.println("client is now disconnected...");
	}
}
