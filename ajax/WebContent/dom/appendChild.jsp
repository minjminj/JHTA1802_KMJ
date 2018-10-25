<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='append_child'>
	<h3>Append Child</h3>
	<p id='info'>
		appendChild()와 removeChild()를 사용하여 Element를 추가하거나 제거
	</p>
	
	<input type='button' value='Append' onclick='append()' class='btn'/>
	<input type='button' value='Remove' onclick='removeAll()' class='btn'/>
	<p/>
	
	<div id='result'></div>
	
</div>
<script>
var cnt = 0;
var rs = document.getElementById("result");
function append(){
	var ele = makePanel();
	rs.appendChild(ele);
}

function removeAll(){
	rs.innerHTML = '';
	console.log('remove');
}

function remove(ev){
	var ele = ev.srcElement;
	var pDiv = ele.parentNode;
	
	rs.removeChild(pDiv);
}

// 하나의 div 안에 input, button을 추가하여 반환
function makePanel(){
	var div = document.createElement("div");
	var input = document.createElement("input");
	var btn = document.createElement("input");
	
	//text 상자의 속성 지정
	input.setAttribute("type", "text");
	input.setAttribute("name", "id" + cnt);
	input.setAttribute("value", "aaaa" + cnt)
	cnt++;
	
	// 삭제 버튼 속성 지정
	btn.setAttribute("type", "button");
	btn.setAttribute("value", "Del");
	btn.setAttribute("class", "btn");
	btn.addEventListener("click", remove); // btn.onclick = remove;
	
	div.appendChild(input);
	div.appendChild(btn);
	return div;
}
</script>
</body>
</html>