<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='one'>
	<input type='button' value='Sevral' id='btnSevral' class='btn'/>
	<input type='button' value='One'    id='btnOne'	   class='btn'/>
	
	<div id='result'></div>
</div>
<script>
$(function(){
	var cnt = 0;
	$('#one #btnSevral').click(function(){
		cnt ++;
		$('#result').html(cnt + '번째 클릭됨.');
	});
	$('#one #btnOne').one('click', function(){
		cnt ++;
		$('#one #result').html(cnt + '번째 클릭됨.');
	})
});

</script>
</body>
</html>