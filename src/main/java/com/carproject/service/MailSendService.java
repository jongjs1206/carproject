package com.carproject.service;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service("mailService")
public class MailSendService {

	@Autowired
	private JavaMailSender mailSender;
	
	//비밀번호 난수생성
	static char pwCollection[] = new char[] { '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'A', 'B', 'C', 'D', 'E',
			'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
			'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u',
			'v', 'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')' };// 배열에 선언

	public String makeTempPass() {
		String ranPw ="";
		for(
		int i = 0;i<10;i++)
		{
			int selectRandomPw = (int) (Math.random() * (pwCollection.length));
			ranPw += pwCollection[selectRandomPw];
		}return ranPw;

	}

	// 임시 비밀번호 전송
	public void mailSend(String tempPass, String e_mail) {

		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요. 사차원에서 인증번호가 발급되었습니다.</h2><br><br>" 
				+ "<h3> 인증번호는[" + tempPass + "]입니다.</h3>" 
				+ "*기타 사항은 관리자에게 문의 바랍니다.";
		try {
			mail.setSubject("[사차원]:인증번호 발급 메일입니다.");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(e_mail));
			mailSender.send(mail);
			System.out.println("메일성공");
		} catch (MessagingException e) {
			System.out.println("메일실패 :" +e);

		}
	}
	
	// 탈퇴 인증번호 전송
	public void leaveMailSend(String tempPass, String e_mail) {
		
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요. simsim에서 인증번호가 발급되었습니다.</h2><br><br>" 
				+ "<h3> 인증번호는 [" + tempPass + "] 입니다.</h3>" 
				+ "*인증번호를 입력하면 바로 탈퇴 처리가 됩니다.";
		try {
			mail.setSubject("[simsim]:인증번호 발급 메일입니다.");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(e_mail));
			mailSender.send(mail);
			System.out.println("메일성공");
		} catch (MessagingException e) {
			System.out.println("메일실패 :" +e);
			
		}
	}
}
		