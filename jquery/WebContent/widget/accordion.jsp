<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	$('#accordion').accordion();
	$('#accordion').css({'margin-top':'10px'});
});
</script>
</head>
<body>
<div id='layout_accordion'>
	<h3>Accordion</h3>
	<div id='info'>
		accordion()을 사용해서 간단하게 accordion 타입의 메뉴 생성
	</div>
	
	<div id='accordion'>
		<!-- h태그 안에 있는 내용이 accordion의 제목역할 -->
		<h3>WEB</h3>
		<div>
			<ul>
				<li>html</li>
				<li>css</li>
				<li>javascript</li>
			</ul>
		</div>
		
		<h3>FRAMEWORK</h3>
		<div>
			<ul>
				<li>ajax</li>
				<li>jquery</li>
				<li>mybatis</li>
				<li>spring</li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>