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
			$('.ok').css({'background':'#fff6da'});
			$('#selector_dom  li').css({'margin-top':'10px','width':'46px'});
			$('#selector_dom li[class!="ok"]').css('color', '#a2792f');
		});
	});
</script>
</head>
<body>
<div id='selector_dom'>
	<ul>
		<li>이봉기</li>
		<li class='ok'>김민수</li>
		<li class='ok'>정락권</li>
		<li class='ok'>김민정</li>
		<li>남기성</li>
		<li class='ok'>박형민</li>
		<li>최규하</li>
		<li>김동기</li>
	</ul>
	<input type='button' value='뚜루뚜루뚜' id='btn'>
</div>
</body>
</html>