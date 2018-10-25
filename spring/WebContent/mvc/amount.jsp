<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$('#cal_amt').click(function(){
	var param = $('#frm_amt').serialize();
	$('#result').load('amt.min', param);
});
</script>
</head>
<body>
<form id='frm_amt' name='frm_amt' method='post'>
	<label>수량 </label><input type='text' name='amt' size='3'/>
	<label>단가 </label><input type='text' name='ea' size='3'/>
	
	<input type='button' name='cal' id='cal_amt' value='계산'/>
</form>
<div id='result'></div>
</body>
</html>