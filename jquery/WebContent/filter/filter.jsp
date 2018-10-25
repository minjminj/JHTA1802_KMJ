<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	$().ready(function(){
		$('#btn').click(function(){
			$('li:nth-child(3n)').css('text-decoration', 'underline');
			$('li:nth-child(3n)').append("<img src='./filter/111111.JPG' width=15px/>");
		});
	});
</script>
</head>
<body>
<div id='filter_filter'>
	<p id='info'>
		:nth-child()를 사용하여 3번째 항목마다 밑줄을 나타내도록 함
	</p>
	<ul>
		<li>북한산</li>
		<li>인왕산</li>
		<li>지리산</li>
		<li>용왕산</li>
		<li>태백산</li>
		<li>한라산</li>
		<li>백두산</li>
		<li>설악산</li>
		<li>무등산</li>
		<li>용두산</li>
	</ul>
	<input type='button' value='Mountain' id='btn'/>
</div>
</body>
</html>