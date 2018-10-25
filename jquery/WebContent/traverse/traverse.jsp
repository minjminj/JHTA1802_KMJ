<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	$().ready(function(){
		$('#btn').click(function(){
			/* 이건 필터 기능으로 구현!
			$('li:nth-child(3n)').css('text-decoration', 'underline');
			$('li:nth-child(3n)').append("<img src='./filter/111111.JPG' width=15px/>");
			*/
			
			// traverse 기능으로 구현
			$('#traverse li').filter(function(index){
				if (index%3 == 0){
					$(this).css({
					'background-color': '#aaaaaa',
					'width' : '60px',
					'text-decoration' : 'underline'
							});
					$(this).append("<img src='./filter/111111.JPG' width=15px/>");
				}
			});
		});
	});
</script>
</head>
<body>
<div id='traverse'>
	<p id='info'>
		traverse: 필터의 기능을 확정된 함수형태로 제공하는 요소들이 대다수임. <br/>
		필터의 :nth-child(3n) 기능을 .filter의 형태로 바꾸어봄
	<ul>
		<li>북한산</li>
		<li>인왕산</li>
		<li>지리산</li>
		<li>용왕산</li>
		<li>태백산</li>
		<li>한라산</li>
		<li>백두산</li>
		<li>설악산</li>
		<li>무등산</li>
		<li>용두산</li>
	</ul>
	<input type='button' value='Mountain' id='btn'/>
</div>
</body>
</html>