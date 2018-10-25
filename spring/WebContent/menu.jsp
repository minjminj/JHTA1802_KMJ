<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function go(url){
	$('#content').load(url);
}
</script>
</head>
<body>
<div id='menu'>
<h3>메뉴</h3>
	<fieldSet>
	<legend>MVC</legend>
		<ul>
			<li onclick='go("./mvc/gugudan.jsp")'>구구단</li>
			<li onclick='go("./mvc/hap.jsp")'>x+y=?</li>
			<li onclick='go("./mvc/amount.jsp")'>금액계산</li>
		</ul>
	</fieldSet>
	
	<fieldSet>
	<legend>STUDENT</legend>
		<ul>
			<li onclick='go("list.std")'>목록</li>
<!-- 			<li onclick='go("./mvc/hap.jsp")'>x+y=?</li> -->
<!-- 			<li onclick='go("./mvc/amount.jsp")'>금액계산</li> -->
		</ul>
	</fieldSet>
	
	<fieldSet>
	<legend>BAORD</legend>
		<ul>
			<li onclick='go("list.brd")'>목록</li>
<!-- 			<li onclick='go("./mvc/hap.jsp")'>x+y=?</li> -->
<!-- 			<li onclick='go("./mvc/amount.jsp")'>금액계산</li> -->
		</ul>
	</fieldSet>
</div>
</body>
</html>