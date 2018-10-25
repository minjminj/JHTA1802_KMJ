<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='get'>
	<h3>get</h3>
	<div id='info'>
		get()을 사용하여 특정 요소를 배열형태로 가져올때 사용
	</div>
	
	<span>A</span>
	<span>B</span>
	<span>C</span>
	<span>D</span>
	<span>E</span>
	<span>F</span>
	
	<p/>
	<input type='button' value='RUN' id='btn'/>
	<p/>
	<div id='result'></div>
</div>
<script>
// span 태그들을 가로모드에서 세로모드로
$(function(){
	$('#get #btn').click(function(){
		var spans = $('#get span').get();
		
		$('#result').html('<li>size= ' + spans.length);
		$('#result').append("<br/>");
		$('#result').append(spans.join('<br/>'));
		
		//span 태그중에서 첫번째 가져옴
		var ele = $('#get span').get(0);
		$('#result').append("<p/> text= " + ele.innerHTML);
	});
	
});
</script>
</body>
</html>