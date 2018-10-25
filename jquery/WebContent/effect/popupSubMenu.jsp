<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#menu1, #menu2 {
	box-sizing: border-box;
	width: 180px;
	position: relative;
	margin: 3px;
	margin-left: 10px;
}

#sub1, #sub2 {
	box-sizing: border-box;
	position: relative;
/* 	border-radius: 6px; */
/* 	margin-bottom: 5px; */
	text-align: center;
	background-color: #fff6da;
}

#sub1:hover, #sub2:hover, #item1:hover, #item2:hover {
	cursor: url(ap22.JPG), auto;
}

#item1, #item2 {
	box-sizing: border-box;
	background-color: #d5eeff;
	position: absolute;
	width: 100%;
/* 	border-radius: 6px; */
}

</style>
</head>
<body>
<div id='popup'>
	<input type='button' value='  i  ' id='btnInfo'class='btn'/>
	<div id='info'>
		toggle event를 활용하여 팝업 메뉴를 구성
	</div>
	<hr/>
	<div id='menu'>
		<input type='button' value='가로 모드' id='btnHorizontal' class='btn'/>
		<input type='button' value='세로 모드' id='btnVertical' class='btn'/>
		<p/>
		<div id='menu1'>
			<div id='sub1'>파일메뉴</div>
			<div id='item1'>
				<ul>
					<li>파일 읽기</li>
					<li>파일 저장</li>
					<li>새이름으로 저장</li>
					<li>파일명 변경</li>
				</ul>
			</div>
		</div>
		<div id='menu2'>
			<div id='sub2'>편집메뉴</div>
			<div id='item2'>
				<ul>
					<li>파일 읽기</li>
					<li>파일 저장</li>
					<li>새이름으로 저장</li>
					<li>파일명 변경</li>
				</ul>
			</div>
		</div>
	</div>
	
</div>
<script>
$(function(){
	// info영역에 대해서 버튼이 클릭되면 보였다 안보였다 하게 만듦 ㅎㅎ
	$('#info').hide();
	$('#btnInfo').click(function(){
		$('#info').slideToggle();
	});
	
	// item1은 숨겨져 있다가 sub1이 클릭되면 나타남
	$('#item1').hide();
	$('#sub1').click(function(){
		$('#item2').hide(400);
		$('#item1').slideToggle(800); 
	});
	
	// item2은 숨겨져 있다가 sub2이 클릭되면 나타남
	$('#item2').hide();
	$('#sub2').click(function(){
		$('#item1').hide(400);
		$('#item2').slideToggle(800);
	});
	
	// 가로모드 배치
	$('#btnHorizontal').click(function(){
		$('#menu > div').css('display','inline-block');
		$('#menu2').css('margin-left', '0');
		$('#item1, #item2').css('position','absolute');
	});
	
	// 세로모드 배치
	$('#btnVertical').click(function(){
		$('#menu > div').css('display','block');
		$('#menu2').css('margin-left', '10px');
		$('#item1, #item2').css('position','absolute');
	});
});
</script>
</body>
</html>