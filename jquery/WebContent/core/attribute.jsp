<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='attribute'>
	<ul>
		<li>한식</li>
		<li>양식</li>
		<li>중식</li>
		<li>분식</li>
		<li>외식</li>
		<li>조식</li>
		<li>석식</li>
		<li>학식</li>
	</ul>
	
	<input type='button' value='remove Attribute' id='btnRemove' class='btn'/><p/>
	<input type='button' value='add Attribute' 	  id='btnAdd' class='btn'/><p/>
	<input type='button' value='toggle Attribute' id='btnToggle' class='btn'/>
</div>

<script>
$(function(){
	$('#attribute ul li').addClass('menu_item');
});

$('#btnRemove').click(function(){
	$('#attribute ul li').removeClass('menu_item');
});

$('#btnAdd').click(function(){
	$('#attribute ul li').addClass('add_class');	
});

$('#btnToggle').click(function(){
	$('#attribute ul li').toggleClass('menu_item');
});
</script>
</body>
</html>