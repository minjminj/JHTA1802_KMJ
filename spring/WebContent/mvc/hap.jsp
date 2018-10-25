<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hap</title>
<script>
$('#cal_hap').click(function(){
	var param = $('#frm_hap').serialize();
	$('#result').load('hap.min', param);
});
</script>
</head>
<body>
<form id='frm_hap' name='frm_hap' method='post'>
	<label>x</label><input type='text' name='x' size='3'/>
	<label>y</label><input type='text' name='y' size='3'/>
	<input type='button' name='cal' id='cal_hap' value='계산'/>
</form>
<div id='result'></div>
</body>
</html>