<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>declare1</title>
<script src='declare1.js'></script>
</head>
<body>
<h1>script 태그를 사용한 자바스크립트 선언</h1>
<script>
	alert('hi javascript!!!');
</script>

<h1>태그에 자바스크립트 선언</h1>
<label onclick='alert("라벨에서 클릭함~.~")'>이곳을 마우스로 클릭해 보세요</label>
<br/>
<input type='button' value='CLICK' onclick='location.href="http://www.jobtc.kr"'/>

<h1>외부파일에 자바스크립트를 선언한 후 script 태그로 사용하기</h1>
<input type='button' value='RED' onclick='funcRed()'/>
<input type='button' value='GREEN' onclick='funcGreen()'/>
<input type='button' value='BLUE' onclick='funcBlue()'/>
</body>
</html>