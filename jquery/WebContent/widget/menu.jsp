<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	$('#menu').menu();
	$('#menu').css({'width':'200px', 'margin-top':'10px', 'margin-left':'10px', 'font-size':'20px'});
	$('#menu a').css('text-decoration','none');
});
</script>
</head>
<body>
<div id='layout_menu'>
	<h3>MENU</h3>
	<div id='info'>
		menu()를 사용하여 다단계 메뉴와 활성화/비활성화 상태의 메뉴를 구현한다.
	</div>
	
	<ul id='menu'>
		<li><a href='#'>web</a>
			<ul>
				<li><a href='#'>html</a></li>	
				<li><a href='#'>css</a></li>	
				<li><a href='#'>javascript</a></li>	
				<li><a href='#'>jsp</a>
					<ul>
						<li><a href='#'>bean</a></li>
						<li><a href='#'>servlet</a></li>
						<li><a href='#'>jstl</a></li>
					</ul>	
				</li>			
			</ul>
		</li>
		<li><a href='#'>application</a></li>
		<li><a href='#'>framework</a></li>
		<li><a href='#'>database</a></li>
	</ul>
</div>
</body>
</html>