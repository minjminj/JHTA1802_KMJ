<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#layout {
	position: relative;
	width: 420px;
    height: 620px;
}

#layout > div {
	width: 200px;
	height: 300px;
	overflow: hidden;	
	position: absolute;
}

#layout #right_top {
	right: 0;
}

#layout #bottom {
	width: 420px; 		
	height: 300px;
	bottom: 0;
}

#layout #bottom img {
	width: 100%;
	height: 100%;
}

#layout #left_top img, #layout #right_top img {
	width: 100%;
	height: 100%;
}

.second {
	display: none;
}


</style>
</head>
<body>
<div id='win8'>
	<input type='button' value='  i  ' id='btnInfo'class='btn'/>
	<div id='info'>CSS와 hover이벤트를 사용한 간단한 win8 style layout구성</div>
	<hr/>
	
	<div id='layout'>
		
		<div id='left_top'>
			<img src='./image/dani1.jpg' class='first'/>
			<img src='./image/dani4.jpg' class='second'/>
		</div>
		
		<div id='right_top'>
			<img src='./image/dani2.jpg' class='first'/>
			<img src='./image/dani5.jpg' class='second'/>
		</div>
		
		<div id='bottom'>
			<img src='./image/dani3.jpg' class='first'/>
			<img src='./image/dani6.jpg' class='second'/>
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
	
	$('#left_top').hover(function(){
		$('#left_top > .first').slideToggle(300, function(){
			$('#left_top > .second').slideToggle(500);
		});
	});
	$('#right_top').hover(function(){
		$('#right_top > .first').slideToggle(300, function(){
			$('#right_top > .second').slideToggle(500);
		});
	});
	$('#bottom').hover(function(){
		$('#bottom > .first').slideToggle(300, function(){
			$('#bottom > .second').slideToggle(500);
		});
	});
});
</script>
</body>
</html>