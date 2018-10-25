<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>form_text</title>

<script>
window.onload=function(){
	// 버튼이 클릭되었을때 copyfunc 함수를 실행
	document.frm.btn.onclick = copyfunc;
}

function copyfunc(){
	var ff = document.frm;
	ff.copy.value = ff.ori.value;
}
</script>

</head>
<body>
<h1>text 입력값 제어</h1>
<form name='frm' method='post'>
	<label>원본: </label>
	<input type='text'  name='ori' value='kim'><br/>
	<label>사본: </label>
	<input type='text' name='copy'value=''/>
	<p/>
	<input type='button' value='COPY' name='btn'>

</form>
</body>
</html>