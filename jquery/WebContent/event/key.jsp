<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='key'>
	
	<label>테스트 문자열: </label>
	<input type='text' name='msg' id='msg'/>
	<p/>
	
	<div id='result'></div>
</div>
<script>
$(function(){
	$('#key #msg').bind('keyup keydown', function(ev){
		var msg = '<li>key type: ' + ev.type
				+ '<li>key code: ' + ev.keyCode;
		$('#result').html(msg);
	});
});
</script>
</body>
</html>