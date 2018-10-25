<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>gugudan</title>
<script>
$('#cal').click(function(){
	var param = $('#frm').serialize();
	$('#result').load("gugudan.min", param);
});
</script>
</head>
<body>
<form id='frm' name='frm' method='post'>
	<input type='text' name='dan'/>
	<input type='button' name='cal' id='cal' value='계산'/>
</form>
<div id='result'></div>
</body>
</html>