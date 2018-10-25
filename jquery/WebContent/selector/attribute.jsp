<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selector attribute</title>

<script>
	$().ready(function(){
		$('#btn').click(function(){
			$('#min div').css('border', '1px solid #ffaaaa');
			$('#min p').css({'color':'white', 'background':'aquamarine'});
			$('#min').css({'border':'3px solid #FFF', 'padding':'10px'});
			$('.min > span').css({'display':'inline-block','width':'100px','height':'70px','color':'red'});
			$('#min, .min').css({'display':'inline-block'});
		});
	});
</script>
</head>
<body>
<div id='selector_ attribute'>
	<h3>id, class 또는 속성을 사용한 요소 선택</h3>
	<p id='info'>
		태그에 선언되어 있는 속성들을 사용하여 요소를 선택하는 방법
	</p>
	
	<div id='min'>
		<p> P 1</p>
		<div>DIV 1</div>
		<p>P 2</p>
	</div>
	<div class='min'>
		<span>SPAN 1</span>
		<div>DIV 2</div>
		<span>SPAN 2</span>
	</div>
	<p/>
	<input type='button' value='RUN' id='btn'/>
	
</div>
</body>
</html>