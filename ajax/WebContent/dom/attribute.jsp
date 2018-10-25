<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
#target {
	border: 1px solid ivory;
	padding: 20px;
	box-sizing: border-box;
	width: 70%;
	display: block;
}
</style>
</head>
<body>
<div id='attribute'>
	<h3>Attribute</h3>
	<p id='info'>
		특정 태그의 속성값을 설정하거나 취소하는 예
	</p>
	<font id='target'>
		이곳의 문자 색상과 정렬상태값이 버튼으로 설정됩니당~*_*
	</font>
	<p/>
	<input type='color' name='textColor' id='textColor'/>
	[
		<label><input type='radio' name='text_align' class='align' value='left'/>왼쪽정렬</label>
		<label><input type='radio' name='text_align' class='align' value='center'/>가운데정렬</label>
		<label><input type='radio' name='text_align' class='align' value='right'/>오른쪽정렬</label>
	]
	<p/>
	<input type='button' value='확인' onclick='run()' class='btn'/>
</div>
<script>
	function run(){
		var target = document.getElementById("target");
		var color = document.getElementById("textColor");
		// 문자 색상 변경
		target.setAttribute("color", color.value);
		var pos = target.innerHTML.indexOf(']');
		if (pos == -1) pos = target.innerHTML.length;
		var txt = target.innerHTML.substring(0, pos);
		target.innerHTML = txt + "]]] color: " + target.getAttribute("color");
		
		//정럴 상태값 설명
		var alignNodes = document.getElementsByClassName('align');
		for (i=0 ; i<alignNodes.length ; i++){
			if (alignNodes[i].checked){
				target.setAttribute("align", alignNodes[i].value);
			}
		}
	}
</script>
</body>
</html>