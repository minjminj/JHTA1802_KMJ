<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>form_radio</title>
<script>
window.onload = function(){
	var mm = document.frm;
	mm.btn.onclick = function(){
		for (var k in mm.chk){
			if (mm.chk[k].checked){
				mm.te.style.backgroundColor = mm.chk[k].value;
				mm.te.style.color = '#ffffff';
				mm.te.value = mm.chk[k].value;
				break;
			}		// 크롬에서는 for문이나 ischecked에 대한 로직이 없어도 radio특성 상 체크된 value를 자동으로 인식함.
		}
	}
}
</script>
</head>
<body>
<h3>Box 색상을 고르시오.</h3>
<form name='frm' method='post'>
	<textarea name='te' rows='5' cols='40'></textarea><br/><br/>
	<label><input type='radio' name='chk' value='#000000'>검정</label>
	<label><input type='radio' name='chk' value='#ff0000'>빨강</label>
	<label><input type='radio' name='chk' value='#00ff00'>초록</label>
	<label><input type='radio' name='chk' value='#0000ff'>파랑</label><br/>
	<label><input type='radio' name='chk' value='#ffff00'>노랑</label>
	<label><input type='radio' name='chk' value='#00ffff'>하늘</label>
	<label><input type='radio' name='chk' value='#ff00ff'>보라</label><br/><br/>
	
	<input type='button' name='btn' value='Which color do you want?'>
</form>
</body>
</html>