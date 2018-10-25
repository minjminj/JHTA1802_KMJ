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
	<h3>Append Child2</h3>
	<p id='info'>
		첨부파일을 추가하거나 삭제함
	</p>
	
	<input type='button' value='Attached File Add' onclick='append()' class='btn'/>
	<input type='button' value='Attached File All Delete' onclick='removeAll()' class='btn'/>
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

function loadImage(ev){
	var evTag = ev.srcElement;
	var parent = evTag.parentNode;
	var file = parent.getElementsByClassName("file").item(0);
	
	file.click();
	
	file.onchange = function(ev2){
		var f = ev2.srcElement;
		var url = f.files[0];
		
		var reader = new FileReader();
		reader.readAsDataURL(url);
		reader.onload = function(e){
			evTag.src = e.target.result;
		}
	}
	
}

// 하느의 div 안에 input, button을 추가하여 반환
function makePanel(){
	var div = document.createElement("div");
	var img = document.createElement("img");
	var file = document.createElement("input");
	var btn = document.createElement("input");
	var br = document.createElement("br");
	
	// div
	div.setAttribute("style", "display:inline-block;margin:10px;position:relative");
	
	// image tag 속성 지정
	img.setAttribute("width", "120px");
	img.setAttribute("height", "170px");
	img.setAttribute("name", "img" + cnt);
	img.setAttribute("src", "http://placehold.it/120x170")
	img.addEventListener("click", loadImage);
	
	// file tag 속성 지정
	file.setAttribute("type", "file");
	file.setAttribute("name", "file" + cnt);
	file.setAttribute("class", "file")
	file.setAttribute("style", "display:none");
	
	// 삭제 버튼 속성 지정
	btn.setAttribute("type", "button");
	btn.setAttribute("value", "Del");
	btn.setAttribute("class", "btn");
	btn.setAttribute("style", 	"position:absolute;opacity: 0.6;right:0;bottom:0")
	btn.addEventListener("click", remove); // btn.onclick = remove;
	
	cnt++;
	
	div.appendChild(img);
	div.appendChild(file);
	div.appendChild(br);
	div.appendChild(btn);
	return div;
}
</script>
</body>
</html>