<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='mail'>
	<h3>메일 발송</h3>
	
	<form name='frmMail' method='post' enctype='multipart/form-data' action='./mail/mail_send.jsp'>
		<label class='label'>발신자 </label>
		<input type='email' name='sender' value='adiiiii@naver.com' readonly='readonly'/><br/>
		
		<label class='label'>수신자 </label>
		<input type='email' name='receiver' value='${param.email }'/><br/>
		
		<label class='label'>제목 </label>
		<input type='text' name='subject'/><br/>
		
		<label class='label'>내용 </label>
		<textarea rows='20' cols='60' name='content'></textarea><br/>
		
		<label class='label'>첨부파일</label>
		<input type='file' name='atitle' size='9'/><p/>
		
		<input type='submit' name='btnSend'   id='btnSend'   value='전송'  class='btn'/>
		<input type='button' name='btnCancle' id='btnCancle' value='취소'  class='btn'/>
	</form>
</div>
<script>
$('#mail #btnCancle').click(function(){
	$('#content').load('list.std');
});

</script>
</body>
</html>