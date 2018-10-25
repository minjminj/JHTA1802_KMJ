<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selector_struct</title>

<style>
	div span{
		display:inline-block;
		border:1px solid #aaaaaa;
		padding:5px;
		width:85px;
		text-align:center;
		float:left;
		box-shadow:2px 2px 10px #dddddd;
		box-sizing:border-box;
		cursor:pointer;
	}
	div span:hover{
		background-color:#223322;
	}
	div span:first-child{
		border-radius:10px 0 0 10px;
	}
	div span:last-child{
		border-radius:0 10px 10px 0;
	}
	
	div span:nth-of-type(2n){
		background-color:#aaaaaa;
	}
	
	div span:nth-of-type(2n+1){
		background-color:#cccccc;
	}

</style>
</head>
<body>
<!-- 1)하나의 div영역안에 span태그를 7개를 좌우로 나열
	2) span 태그의 넓이는 일정하게
	3) 마우스가 올라가면 바탕색을 변경
	4) 각각의 span태그엔 그림자를 추가
		(box-shadow:x축, y축, 퍼짐크기, 그림자색)
	5) 첫번째 span에는 좌측 모서리를 라운딩
	6) 마지막 span에는 우측 모서리를 라운딩
	7) span태그의 홀수번째와 짝수번째의 바탕색을 서로 다른색으로 -->
	
	<div>
		<span>일요일</span>
		<span>월요일</span>
		<span>화요일</span>
		<span>수요일</span>
		<span>목요일</span>
		<span>금요일</span>
		<span>토요일</span>
	
	</div>
</body>
</html>