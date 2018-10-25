<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	$().ready(function(){
		var sub_menu;
		var content;
		
		// sessionStorage에 페이지 정보를 저장 -> 새로고침 했을때 원래 보던 페이지를 그대로 보여줌
		if(sessionStorage.getItem("sub_menu") != null){
			//sessionStorage = 로컬저장소! session과는 다른개념 
			sub_menu = sessionStorage.getItem("sub_menu");
			$('#sub_menu').load(sub_menu);
		}
		
		if(sessionStorage.getItem("content") != null){
			content = sessionStorage.getItem("content");
			loadPage(content);
		}
		
			//$('#center').hide();
			$('#main_item > span').click(function(ev){
			$('#center').show(function(){
				$(this).bounceInDown;
			});
			var item = $(this).text();
			sub_menu = './sub_menu.jsp #'+item;
			
			$('#sub_menu').load(sub_menu);
			sessionStorage.setItem("sub_menu", sub_menu);
			
		});
	});
	
	function loadPage(page){
		$('#content').load(page);
		sessionStorage.setItem("content", page);
	}
	
</script>
</head>
<body>
<div id='main_item'>
	<span>ALL</span>
	<span>Board</span>
	<span>Core</span>
	<span>Selector</span>
	<span>Filter</span>
	<span>Traverse</span>
	<span>Manipulation</span>
	<span>Event</span>
	<span>Effect</span>
	<span>Interaction</span>
	<span>Widget</span>
	<span>Ajax</span>
	<span>Parsing</span>
</div>
</body>
</html>