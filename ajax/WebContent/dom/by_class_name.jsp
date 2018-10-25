<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='by_class_name'>
	<h3>by_class_name</h3>
	<p id='info'>
		checkbox의 class 속성을 사용하여 체크박스를 선택한 후 체크되어 있는 요소만 관련 정보를 출력
	</p>
	
	<form name='frm' id='frm'>
	<label>당신의 취미 생활은?</label>
	<br/>
		<label><input type='checkbox' class='chk' value='곱먹'/>곱먹</label>
		<label><input type='checkbox' class='chk' value='막먹'/>막먹</label>
		<label><input type='checkbox' class='chk' value='육먹'/>육먹</label>
		<label><input type='checkbox' class='chk' value='양먹'/>양먹</label>
		<br/>
		<label><input type='checkbox' class='chk' value='회먹'/>회먹</label>
		<label><input type='checkbox' class='chk' value='소먹'/>소먹</label>
		<label><input type='checkbox' class='chk' value='삼먹'/>삼먹</label>
		<label><input type='checkbox' class='chk' value='초먹'/>초먹</label>
		<p/>
		
		<input type='button' value='RUN' onclick='hobby()' class='btn'/>
		<input type='button' value='전체선택' onclick="hobby('all')" class='btn'/>
		<input type='button' value='전체선택안함' onclick="hobby('none')" class='btn'/>
	</form>
	<p/>
	<div id='result'></div>
</div>
<!-- 체크박스만  체크되어 있는 요소의 value값을 result에 출력 -->

<script>
function hobby(hi){
	var rs = document.getElementById("result");
	var data = document.getElementById("frm");
	var nodes = data.getElementsByClassName("chk");
	var str = '';
	
	for (i=0 ; i<nodes.length ; i++){
		if (hi == 'all'){
			nodes[i].checked = true;
		} else if (hi == 'none'){
			nodes[i].checked = false;
		}
		
		if (nodes[i].checked) 
			str += '<li>'  + nodes[i].value + '<\/br>';
	}
	rs.innerHTML = str;
}
</script>
</body>
</html>