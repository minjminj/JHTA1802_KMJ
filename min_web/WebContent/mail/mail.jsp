<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mail</title>

<style>
div {
	font-family: 'Do Hyeon', sans-serif;
	background: #C8C8A9;
}

.label {
		display: inline-block;
		width: 55px;
		text-align: right;
		vertical-align: top;
}
	
.btn {
	width: 100px; 
	height: 40px;
	margin-left: 65px; 
	font-family: 'Do Hyeon', sans-serif;
	border: 0;
	background: #C8C8A9;
	font-size: 15px;
}
	
.btn:hover {
	font-family: 'Do Hyeon', sans-serif;
	border: 1px solid white;
	background: black;
	color: white;
	font-size: 15px;
}	

</style>
</head>
<body>

<div>
	<h3>메일 발송</h3>
	
	<form name='frmMail' method='post' enctype='multipart/form-data' action='mail_send.jsp'>
		<label class='label'>발신자 </label>
		<input type='email' name='sender'/><br/>
		
		<label class='label'>수신자 </label>
		<input type='email' name='receiver' value='${param.email }'/><br/>
		
		<label class='label'>제목 </label>
		<input type='text' name='subject'/><br/>
		
		<label class='label'>내용 </label>
		<textarea rows='20' cols='60' name='content'></textarea><br/>
		
		<label class='label'>첨부파일</label>
		<input type='file' name='atitle' size='9'/><p/>
		
		<input type='submit' name='btnSend' value='전송'  class='btn'/>
		<input type='button' name='btnCancle' value='취소'  class='btn'/>
	</form>
</div>
<script>
window.onload = function(){
	document.frmMail.btnCancle.onclick = function(){
		self.close();
	}
}
</script>
</body>
</html>