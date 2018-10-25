<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#screen {
	position: relative;
	width: 400px;
 	overflow: hidden; 
	display: block;
}
#screen>#btnNext, #screen>#btnPre{
	position: absolute;
	width: 80px;
	height: 100px;
	font-size: 70px;
	background: none;
	top: 130px;
	z-index: 10;
	color: white;
	border: none;
	opacity: 0.2;
}

#screen>#btnNext {
	right: 0;
}

#screen>#btnNext:hover, #screen>#btnPre:hover {
	opacity: 0.7;
}

#screen>#btnNext:active, #screen>#btnPre:active{
	border: 0;
}

#screen #slideMain {
	width: 2000px;
}

#screen .slide{
	display: inline-block;
	float: left;
}

/* #screen .slide:first-child { */
/* 	display: block; */
/* } */
</style>
</head>
<body>
<div id='screen'>
		<input type='button' value='&lt' id='btnPre'/>
		<input type='button' value='&gt' id='btnNext'/>
	
	<div id='slideMain'>
		<div class='slide'>
			<span>1번 화면</span><br/>
			<img src='./image/dani4.jpg' width='400px' height='350px'/>
		</div>
		
		<div class='slide'>
			<span>2번 화면</span><br/>
			<img src='./image/dani1.jpg' width='400px' height='350px'/>
		</div>
		
		<div class='slide'>
			<span>3번 화면</span><br/>
			<img src='./image/dani2.jpg' width='400px' height='350px'/>
		</div>
		
		<div class='slide'>
			<span>4번 화면</span><br/>
			<img src='./image/dani3.jpg' width='400px' height='350px'/>
		</div>
		
		<div class='extern_doc'>
			<span>4번 화면</span><br/>
		</div>
		
		<div class='slide'>
			<span>5번 화면</span><br/>
			<img src='./image/dani5.jpg' width='400px' height='350px'/>
		</div>
	</div>
	
</div>
<script>
$(function(){
	var pos = 0; // 첫번째 slide
	
	// 네번째 slide에는 외부에서 문서를 읽어들여 표시
	$('.extern_doc').load('./filter/filter.jsp #filter');
	
//	// 모든 .slide가 배열형태로 .slide에 대입됨.
//	var slides = $('#screen .slide').get();
//	// 여기선 pos가 index역할
// 	$('#btnNext').click(function(){
// 		$(slides[pos]).slideUp(800);
// 		pos++;
// 		if (pos >= slides.length) pos = 0;
// 		$(slides[pos]).fadeIn(800);
// 	});
	
// 	$('#btnPre').click(function(){
// 		$(slides[pos]).slideUp(800);
// 		pos--;
// 		if (pos < 0) pos = slides.length -1;
// 		$(slides[pos]).fadeIn(800);
// 	});

	// pos로 스크롤 이동
	$('#btnNext').click(function(){
		pos -= 400;
		if (pos <= -2000) pos = 0;
		console.log(pos);
		$('#slideMain').animate({marginLeft:pos}, 500);
	});
	$('#btnPre').click(function(){
		pos += 400;
		if (pos > 0) pos = -1600;
		console.log(pos);
		$('#slideMain').animate({marginLeft:pos}, 500);
	});
	
});
</script>
</body>
</html>