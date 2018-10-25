<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='loadText'>
	<h3>load Text | HTML file</h3>
	<p id='info'>
		text 또는 html 문서를 읽기 위한 예, 기본적으로 text 파일을 읽지만 html속성이 들어 있으면 특별한 처리외에 모두 구현된다.
	</p>
	<input type='button' value='load Text' id='btnload' class='btn'/>
	<hr/>
	<div id='result'></div>
</div>
<script>
	var xhr;
	var btn = document.getElementById("btnload");
	var rs = document.getElementById("result");
	
	btn.onclick = function(){
		if (xhr == null) xhr = new XMLHttpRequest();
		var url = '/ajax/core/text.txt';
		xhr.open('get', url, true);
		xhr.send();
		xhr.onreadystatechange = function(){
			if (xhr.status == 200 && xhr.readyState == 4){
				rs.innerHTML = xhr.responseText;
				//rs.innerHTML = '<xmp>' + xhr.responseText + '<\/xmp>';
			}
		}
	}
</script>
</body>
</html>