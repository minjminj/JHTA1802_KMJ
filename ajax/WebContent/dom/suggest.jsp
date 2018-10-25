<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#suggest {
	position: relative;
}
#suggest #sel {
	position: absolute;
    margin-top: -9px;
    width: 176px;
    left: 36px;
    display: none;
}
</style>
</head>
<body>
<div id='suggest'>
	<h3>JSON을 사용한 제시어 기능</h3>
	<p id='info'>
		검색어를 사용하여 suggest_result.jsp 호출하면, 검색결과가 JSON 타입으로 리턴된다.
	</p>
	<label>검색</label>
	<input type='text' name='findStr' id='findStr' placeholder='성명, 연락처, 이메일로 검색' size='22' autocomplete="off"/>
	<input type='button' value='검색' id='btnFind' class='btn'/>
	<select size='10' name='sel' id='sel'></select>
	<p/>
	
	<div id='result'></div>
</div>

<script>
var xhr;
var str;
var sel = document.getElementById("sel");
var rs = document.getElementById("result");
var btn = document.getElementById("btnFind");
var fs = document.getElementById("findStr");

// 검색어가 변경되거나 입력된 경우
fs.onkeyup = function(ev){
	var findStr = fs.value;
	var param = '?findStr=' + findStr;
	
	if (fs.value.length <= 0){
		sel.style.display = 'none';
	} else {
		sel.style.display = 'block';

		var url = '/ajax/dom/suggest_find.jsp' + param
		if (xhr == null) xhr = new XMLHttpRequest();
		xhr.open('get',url,true);
		xhr.onreadystatechange = function(){
			if (xhr.status == 200 && xhr.readyState == 4){
				var find = JSON.parse(xhr.responseText);
				
				sel.length = 0;
				for (i=0 ; i<find.length-1 ; i++){
					sel.options[i] = new Option(find[i],find[i]);
					
				}
			}
		}
		xhr.send();
	}
	
	if (ev.keyCode == 13){
		a();
	}
}

btn.onclick = a;

sel.ondblclick = b;

sel.onkeyup = function(ev){
	if (ev.keyCode == 13){
		b();
	}
}

function a(){
	if (xhr == null) xhr = new XMLHttpRequest();
	var findStr = fs.value;
	var param = '?findStr=' + findStr;
	var url = '/ajax/dom/suggest_result.jsp' + param;
	xhr.open('get', url, true);
	xhr.onreadystatechange = function(){
		if (xhr.status == 200 && xhr.readyState == 4){
			var temp = xhr.responseText;
			var list = JSON.parse(temp);
			
			str = "<table border='1' width='500px' cellpadding='4' cellspacing='0'>"
			str += "<tr>"
				+ "<th>사번<\/th>"
				+ "<th>성명<\/th>"
				+ "<th>이메일<\/th>"
				+ "<th>연락처<\/th>"
				+ "<th>연봉<\/th>"
				+ "<\/tr>";
			for (i=0 ; i<list.length-1 ; i++){
				str += "<tr>"
					+ "<td>" + list[i].id + "<\/td>"
					+ "<td>" + list[i].name + "<\/td>"
					+ "<td>" + list[i].email + "<\/td>"
					+ "<td>" + list[i].phone + "<\/td>"
					+ "<td aligh='right'>" + list[i].salary + "<\/td>"
					+ "<\/tr>"
			}
			rs.innerHTML = str;
		}
	}
	xhr.send();
}

function b(){
	fs.value = sel[sel.selectedIndex].text;
//	fs.value = sel[sel.selectedIndex].value;
	sel.style.display = 'none';
	fs.focus();
}
</script>
</body>
</html>