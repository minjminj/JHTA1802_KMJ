package bean;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

// 메일 전송에 사용되는 계정의 정보
public class MyAuthenticator extends Authenticator{
	PasswordAuthentication pa;

	public PasswordAuthentication getPasswordAuthentication() {
		String user = "adiiiii@naver.com";
		String pwd = "Alswjd12#";
		pa = new PasswordAuthentication(user, pwd);
		
		return pa;
	}
	
	

}
