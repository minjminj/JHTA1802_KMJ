<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	$('#tabs').tabs();
	$('#tabs').css({'height':'400px'});
	$('#key_event').load('./event/key.jsp');
	$('#one_event').load('./event/one.jsp');
	$('#trigger_event').load('./event/trigger.jsp');
});
</script>

</head>
<body>
<div id='tab'>
	<h3>tabs</h3>
	<div id='info'>
		jquery의 tabs()를 사용하여 메뉴를 탭형태로 구성
	</div>
	<div id='tabs'>
		<!-- 탭의 목록 -->
		<ul>
			<li><a href='#key_event'>Key</a></li>
			<li><a href='#one_event'>One</a></li>
			<li><a href='#trigger_event'>Trigger</a></li>
			<li><a href='#mobile'>Mobile</a></li>
		</ul>
		
		<div id='key_event'></div>
		<div id='one_event'></div>
		<div id='trigger_event'></div>
		<div id='mobile'></div>
		
		 
	</div>
</div>
</body>
</html>