<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>form_radio2</title>
<link rel='stylesheet' href='../css/form_radio2.css' type='text/css' media='screen and (min-width:1000px)'/>

<script>
window.onload = function(){
	mm = document.frm;
	mm.btn.onclick = click;
}
	
function click(){

	mm.te.value = '아이디: ' + mm.id.value + '\n '
				+ '성명: ' + mm.na.value + ' \n '
				+ '주소: ' + mm.ar.value + ' \n '
				+ '성별: ' + mm.sex.value;
}
</script>

</head>
<body>
<div>
<h3>아이디, 성명, 주소를 text 상자로, 성별은 radio로 입력받아 아래와 같이 textarea에 출력</h3>
<h6><li>css를 사용하여 textarea의 외곽선을 라운드 처리</h6>
<h6><li>css를 사용하여 각 입력 상자의 외곽선을 아래만 선으로 처리</h6>
<form name='frm' method='post'>
	<label>아이디: </label>
	<input class='a' type='text' name='id' size='6'><br/><br/>
	<label>성 명: </label>
	<input class='a' type='text' name='na' size='6'><br/><br/>
	<label>주 소: </label>
	<input class='a' type='text' name='ar' size='30'><br/><br/>
	<label>성 별:</label>
	<label class='b'><input class='b' type='radio' name='sex' value='Female'>Female</label>
	<label class='b'><input class='b' type='radio' name='sex' value='Male'>Male</label><br/><br/>
	<p id = 'btn_div'>
	<input id='btn' type='button' name='btn' value='SEND'><br/><br/>
	
	<textarea class='c' name='te' rows='5' cols='40'></textarea>
	</p>
</form>
</div>
</body>
</html>