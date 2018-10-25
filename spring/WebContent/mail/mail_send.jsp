<%@page import="javax.mail.Transport"%>
<%@page import="javax.activation.DataHandler"%>
<%@page import="javax.activation.FileDataSource"%>
<%@page import="javax.mail.internet.MimeBodyPart"%>
<%@page import="javax.mail.internet.MimeMultipart"%>
<%@page import="javax.mail.Multipart"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="bean.MyAuthenticator"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 메인 css파일 -->
<link rel='stylesheet' type='text/css' href='../main.css'/>

<!-- jquery -->
<script src='../lib/jquery-3.3.1.min.js'></script>
<script src='../css/jquery-ui.min.js'></script>
<link href='../css/jquery-ui.css' rel='stylesheet' type='text/css'/>
</head>
<body>
<div id='index'>
	<header><%@include file='../header.jsp'%></header>
	
	<div id='center'>
		<div id='menu'><%@include file='../menu.jsp'%></div>
		<div id='content'>
			<div id='mail_send'>
				<h3>메일 전송 결과</h3>
				
				<%
					request.setCharacterEncoding("utf-8");
					String uploadPath = "c:/temp/"; // 메일 전송시 사용된 첨부파일의 임시 경로
					String encoding = "utf-8";
					int fileSize = 1024*1024*50; // 최대파일 크기 50Mb
					MultipartRequest multi = null;
					
					// 메일과 관련된 변수
					String sender = "";
					String receiver = "";
					String subject = "";
					String content = "";
					String file = null;
					
					try{
						multi = new MultipartRequest(request, uploadPath, fileSize, encoding, new DefaultFileRenamePolicy());
						
						// 첨부파일
						Enumeration em = multi.getFileNames();
						if (em != null){ // 첨부파일이 있는 경우
							String tag = (String)em.nextElement();
							file = multi.getFilesystemName(tag);	// 실제 저장된 파일명
						}
						
						sender = multi.getParameter("sender");
						receiver = multi.getParameter("receiver");
						subject = multi.getParameter("subject");
						content = multi.getParameter("content");
						
						// 메일 전송을 위한 로직
						String mailServer = "smtp.naver.com";
						
						Properties prop = new Properties(); // key = value 로 만드는 기능! 단, 둘 다 문자열 타입.
						prop.put("mail.smtp.starttls.enable", "true"); // 메일 전송서버 활성화
						prop.put("mail.transport.protocol", "smtp"); // 메일 전송시 사용되는 프로토콜
						prop.put("mail.smtp.port", "465" );
						prop.put("mail.smtp.auth", "true");
						prop.put("mail.smtp.user", receiver);
						prop.put("mail.smtp.host", mailServer);
						prop.put("mail.smtp.ssl.enable", "true"); // ssl 보안연결 활성화
						
						// 기본 메시지 설정
						Session mailSession = Session.getInstance(prop, new MyAuthenticator());
						Message message = new MimeMessage(mailSession);
						message.setFrom(new InternetAddress(sender));
						message.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
						message.setSubject(subject);
						message.setSentDate(new Date());
						
						// 문자열과 이미지를 동시에 전송
						Multipart part = new MimeMultipart();
						MimeBodyPart text = new MimeBodyPart();
						text.setContent(content, "text/html;charset=utf-8");
						part.addBodyPart(text);
						
						// 첨부파일을 메일에 추가
						if (file != null){
						MimeBodyPart img = new MimeBodyPart();
						FileDataSource source = new FileDataSource(uploadPath + file);
						img.setDataHandler(new DataHandler(source));
						img.setFileName(source.getName());
						part.addBodyPart(img);
						}
						
						message.setContent(part);
						Transport.send(message);
						
						
					} catch (Exception ex){
						out.print(ex.toString());
					} finally {
						// 임시 파일을 삭제
						if (file != null){
							File deFile = new File(uploadPath + file);
							if (deFile.exists()){ deFile.delete(); }
						}
					}
				%>
			</div>
		</div>
	<footer><%@include file='../footer.jsp'%></footer>
</div>

</div>
</body>
</html>