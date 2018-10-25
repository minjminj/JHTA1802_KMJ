<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel='stylesheet' type='text/css' href='myStyle.css'/>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>declare</title>
<style>
	div {
		border:3px solid #0000ff;
		width:300px; height:100px;
		font-size:30px;
	}
	div.c1	{
		background-color:#dddd00;
	}
	#n1 {
		background-color:#9999ff;
	}
</style>
</head>
<body>
<h1>CSS를 선언하는 방법 3가지</h1>

<!-- 1) tag에 직접 css 선언 -->
<font style='font-size:80px; color:#0000ff'>김민정</font><br/>
<input type='text' value='kim m.j' style='color:#ff0000'/>

<!-- 2) <style/>안에서 css 선언  -->
<div class='c1'>김민정</div>				<!-- calss는 중복될 수 있지만 id값은 중복되면 안된다, id는 고유하기 때문에 div#n1에서 div생략가능 -->
<div id='n1'>김민영</div>
<div class='c1'>홍길동</div>

<span>수박</span>
<span>복숭아</span>
<span>망고</span>
<span>딸기</span>
<span>사과</span>

</body>
</html>