<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>form_select</title>

<script>
window.onload = function(){
mm = document.frm;
mm.sel.onchange = change;
mm.btn.onclick = back;
}
function change(){
	
	mm.te.style.backgroundColor = mm.sel.value;
}
function back(){
	mm.te.style.backgroundColor = mm.btn.value;
}

</script>
</head>
<body>
<h3>Select를 이용하여 바탕색 바꾸기</h3>
<form name='frm' method='post'>
	<textarea name='te' rows='5' cols='30'></textarea><br/><br/>
	<select name='sel' onchange='change()'>
		<option value='#ff0000'>빨강
		<option value='#ffff00'>노랑
		<option value='#ff00ff'>보라
		<option value='#0000ff'>파랑
		<option value='#aaaaaa'>회색
	</select>
	<input type='button' name='btn' value='white'>
</form>

</body>
</html>