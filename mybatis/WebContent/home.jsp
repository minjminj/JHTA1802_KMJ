<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='home'>
	<a id='index_jsp' href='#'>MYBATIS</a>
	<ul>
		<li><a href='index.jsp'>MYBATIS</a></li>
		<li><a href='../jquery/index.jsp'>jquery</a></li>
		<li><a href='../ajax/index.jsp'>ajax</a></li>
		<li><a href='../min_web/page/index.jsp'>min</a></li>
	</ul>	
</div>	

<script>
$('#home ul').hide();
$('#index_jsp').click(function(){
	$('#home ul').slideToggle(500);
	$('#home li').click(function(){
		$('#home ul').hide();
	});
});
</script>
</body>
</html>