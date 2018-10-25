<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='each'>
	<h3>each</h3>
	<div id='info'>
		each()함수를 사용하여 1개 이상의 동일한 속성을 갖는 요소를 반복하면서 지정된 내용을 처리한다.<br/>
		버튼을 클릭하면 span안에 있는 문자들의 색상을 바꾼다.
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
</div>
<script>
var bg = ['#ff0000', '#00ff00', '#0000ff', '#ffff00', '#ff00ff', '#00ffff'];

$('#each #btn').click(function(){
	$('#each span').each(function(index){
		$(this).css('color', bg[index]);
	});
});
</script>
</body>
</html>