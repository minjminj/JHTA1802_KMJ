<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='b_insert'>
	<h3>게시판입력</h3>
	<form name='frm' id='frm' method='post' enctype='multipart/form-data'>
		<label>작성자</label>
		<input type='text' name='id' value='park'/><br/>
		<label>제목</label>
		<input type='text' name='subject' size='50' value='할로'/><br/>
		<label>내용</label>
		<textarea name='doc' rows='10' cols='40'>목욜이다~~~~말복이쥐롱</textarea><br/>
		<label>첨부파일</label>
		<div id='attfileZone'>
			<img src='http://placehold.it/160x120' id='img' name='img'/><br/>
			<output id='output'></output>
			<input type='file' name='attfile' id='attfile'/>
		</div>
		<label>암호</label>
		<input type='password' name='pwd' value='1111'/>
		<p/>
		<input type='button' id='btnSend'   value='저장'/>
		<input type='button' id='btnCancle' value='취소'/>
	</form>
</div>
</body>
</html>