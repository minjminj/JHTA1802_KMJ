<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	$('#id_phone').accordion();
	$('#id_phone').css({'margin-top':'10px'});

	$('#id_phone #idFind').click(function(){
		var param = $('#frm_find_id').serialize();
		$('#content').load('../find.std', param);
	});
	
	$('#id_phone #phoneFind').click(function(){
		var param = $('#frm_find_phone').serialize();
		$('#content').load('../find.std', param);
	});
});
</script>
</head>
<body>
<div id='find'>
	<h3>아이디 비밀번호 찾기(by id or phone)</h3>
	
	<div id='id_phone'>
		<h3>아이디로 찾기</h3>
			<div>
				<form id='frm_find_id'>
					<input type='text' name='id'/>
					<input type='hidden' name='phone' value="phone"/>
					<input type='button' name='idFind' id='idFind' value='이메일로 아이디/비밀번호 전송'/>
				</form>
			</div>
		<h3>연락처로 찾기</h3>
			<div>
				<form id='frm_find_phone'>
					<input type='text' name='phone'/>
					<input type='hidden' name='id' value="id"/>
					<input type='button' name='phoneFind' id='phoneFind' value='이메일로 아이디/비밀번호 전송'/>
				</form>
			</div>
	</div>
	
	
</div>
</body>
</html>