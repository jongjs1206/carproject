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

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;



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
	
	
  public String googleRedirect() {
  
    String googleRedirect = googleUrl+"?scope=email&access_type=offline&response_type=code&client_id="+googleId+"&redirect_uri="+redirect;
  
	  return googleRedirect;
  }
  
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

public void getGoogleEmail(String access_token) {
	
	
}

}
