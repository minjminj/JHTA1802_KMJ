<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous">
</script>

<script>
//window.onload = function(){}
$(document).ready(function(){ // $(function)으로도 같은 역할로 사용할 수 있다.
	// var main = document.getElementById("cdn_test");
	// var btn = main.getElementById("btn");
	//btn.onclick = function(){//TODO};
	$('#cdn_test > #btn').click(function(){
		$('#cdn_test > #result').html('CDN으로 jQuery library 연결 테스트 성공!!');
	});
});
</script>
</head>
<body>
<div id='cdn_test'>
	<h3>jQuery library test</h3>
	<p id='info'>
		jQuery 사이트를 방문하여 적당한 라이브러리의 CDN을 복사하여 현재 페이지에 적용한 후 정상적으로 작동하는지 테스트
	</p>
	
	<input type='button' value='Library Test' id='btn'>
	<div id='result'></div>
</div>
</body>
</html>