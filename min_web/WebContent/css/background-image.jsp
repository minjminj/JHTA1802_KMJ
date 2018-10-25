<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>background-image</title>

<style>
	div#div1 {
		width: 400px;
		height: 250px;
		border: 3px solid #aaaaaa;
		box-shadow: 8px 8px 7px #aaaaaa;
		border-radius: 10px 10px 10px 10px;
		
		background-image: url('daniel.jpg');
		background-size: 100px 50px;
	}
	
	div#div2 {
		width: 400px;
		height: 250px;
		border: 1px solid #bb3333;
		border-radius: 7px 7px 7px 7px;
		
		background-image: url('daniel.jpg');
		background-size: 100px 50px;
		background-repeat: repeat-x;
		
	}
	
	div#div3 {
		width: 400px;
		height: 250px;
		border: 1px solid #77ff77;
		border-radius: 30px 0 30px 0;
		
		background-image: url('daniel.jpg');
		background-size: 400px 250px;
		}
	
	div#div4 {
		width: 400px;
		height: 250px;
		
		background-image: url('daniel.jpg');
		background-size: 100px 50px;
		background-attachment: fixed;
		
		font-family: cursive;
		font-size: 30px;
	}
</style>

</head>
<body>
<!-- 1) <div id='div1'/>을 작성하고 
	- 넓이: 400px, 높이 250px
	- 외곽선, 그림자, 라운드 속성을 지정
	- 바탕 이미지를 기본형으로 설정(바탕이미지의 크기는 100*50정도)
	
	2) <div id='div2'/>
	- 실선형 외곽선을 라운드처리하여 작성
	- 바탕이미지는 x축으로만 반복
	
	3) <div id='div3'/>
	- 외곽선의 모양이 좌상, 우하만 라운드 처리
	- 바탕이미지의 크기는 영영크기만큼으로 지정
	
	4) <div id='div4'/>
	- 바탕이미지가 스크롤되지 않도록 조치
	- 궁서체 30px 크기로 임의의 문자열 추가-->

<div id='div1'></div><br/>

<div id='div2'></div><br/>

<div id='div3'></div><br/>

<div id='div4'>오늘은 즐거운 목요일</div>


</body>
</html>