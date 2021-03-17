package com.carproject.service;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

import org.springframework.stereotype.Repository;

import com.carproject.domain.SalesVO;

@Repository("ts")
public class tensorSocket {
	
//	public static void main(String[] args) {	
	public String tensor(SalesVO vo) {
	    // 소켓을 선언한다.	
		
		// 최종 리턴할 값을 담을 변수 선언
		String result = "";
		
	    try (Socket client = new Socket()) {	
	      // 소켓에 접속하기 위한 접속 정보를 선언한다.	
	      InetSocketAddress ipep = new InetSocketAddress("127.0.0.1", 9999);
//		      InetSocketAddress ipep = new InetSocketAddress("104.196.231.62", 22);
	      // 소켓 접속!	
	      client.connect(ipep);	
	      // 소켓이 접속이 완료되면 inputstream과 outputstream을 받는다.	
	      try (OutputStream sender = client.getOutputStream(); InputStream receiver = client.getInputStream();) {	
	        	
	        	
	          // 전송할 메시지를 작성한다. (년식, 연료, 배기량, 변속기 정보를 파이썬으로 전송)	
	          String msg = vo.getOld() + " " + vo.getFuel() + " " + vo.getBaeki() + " " + vo.getGear();
	        	
	          // string을 byte배열 형식으로 변환한다.	
	          byte[] data = msg.getBytes();	
	          // ByteBuffer를 통해 데이터 길이를 byte형식으로 변환한다.	
	          ByteBuffer b = ByteBuffer.allocate(4);	
	          // byte포멧은 little 엔디언이다.	
	          b.order(ByteOrder.LITTLE_ENDIAN);	
	          b.putInt(data.length);	
	          // 데이터 길이 전송	
	          sender.write(b.array(), 0, 4);	
	          // 데이터 전송	
	          sender.write(data);	
	          
	          ///////////////////////////////////전송 끝////////////////////////////////////
	          /////////////////////////////////// 수신 시작 //////////////////////////////////
	          
	          data = new byte[4];	
	          // 데이터 길이를 받는다.	
	          receiver.read(data, 0, 4);	
	          // ByteBuffer를 통해 little 엔디언 형식으로 데이터 길이를 구한다.	
	          ByteBuffer b1 = ByteBuffer.wrap(data);	
	          b1.order(ByteOrder.LITTLE_ENDIAN);	
	          int length = b1.getInt();	
	          // 데이터를 받을 버퍼를 선언한다.	
	          data = new byte[length];	
	          // 데이터를 받는다.	
	          receiver.read(data, 0, length);	
	          	
	          // byte형식의 데이터를 string형식으로 변환한다.	
	          msg = new String(data, "UTF-8");	
	          // 콘솔에 출력한다.	
	          System.out.println(msg);	
	          result = msg;
	        
	      }	
	    } catch (Throwable e) {	
	      e.printStackTrace();	
	    } finally {
	    	return result;
	    }
	    
	  }	
	
}
