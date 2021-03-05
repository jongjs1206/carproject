package com.carproject.service;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;



@Service("snsLoginService")
public class SnsLoginService {
	
	
	@Value("#{config['google.url']}")
	private String googleUrl;
	@Value("#{config['google.client-id']}")
	private String googleId;
	@Value("#{config['google.clientsecret']}")
	private String googleSecret;
	@Value("#{config['google.scope']}")
	private String googleScope;
	@Value("#{config['google.redirect']}")
	private String redirect;
	
//google login redirect url
  public String googleRedirect() {
  
    String googleRedirect = googleUrl+"?scope=email+profile&access_type=offline&response_type=code&client_id="+googleId+"&redirect_uri="+redirect;

  
	  return googleRedirect;
  }
  
 //코드 받아서 token 받기
public String getToken(String code) {
	
	
	 try {
         URL url = new URL("https://oauth2.googleapis.com/token");
         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
         conn.setRequestMethod("POST");
         conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
         conn.setDoOutput(true);

         Map<String, Object> params = new HashMap<>();
         params.put("code", code);
         params.put("client_id", googleId);
         params.put("client_secret", googleSecret);
         params.put("redirect_uri", redirect);
         params.put("grant_type", "authorization_code");

         String parameterString = params.entrySet().stream()
                 .map(x -> x.getKey() + "=" + x.getValue())
                 .collect(Collectors.joining("&"));

         BufferedOutputStream bous = new BufferedOutputStream(conn.getOutputStream());
         bous.write(parameterString.getBytes());
         bous.flush();
         bous.close();

         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

         StringBuilder sb = new StringBuilder();
         String line;

         while ((line = br.readLine()) != null) {
             sb.append(line);
         }

         if (conn.getResponseCode() == 200) {
             return sb.toString();
            
         }
         return "구글 로그인 요청 처리 실패";
     } catch (IOException e) {
         throw new IllegalArgumentException("알 수 없는 구글 로그인 Access Token 요청 URL 입니다 :: " );
     }
	
}

// id token에서 email 정보 추출
public String getGoogleInfo(String googleLoginInfo, String key) {
	
	JsonParser Parser = new JsonParser();
	JsonObject jsonObj = (JsonObject) Parser.parse(googleLoginInfo);

	String id_token = jsonObj.get("id_token").getAsString();
	String[] load = id_token.split("\\.");

    byte[] payload = Base64.decodeBase64(load[1]);
    JsonObject jsonPayload =  (JsonObject) Parser.parse(new String(payload));
    
	return jsonPayload.get(key).getAsString();
}

}
