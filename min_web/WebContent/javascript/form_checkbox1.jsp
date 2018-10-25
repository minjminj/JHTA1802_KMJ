<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>form_checkbox1</title>

<script>
window.onload = function(){
	mm = document.frm;
	mm.btn.onclick = function(){
		mm.te.value = '';
		for (var k in mm.celb){
			if (mm.celb[k].checked){
				mm.te.value += 'My Pick: ' + mm.celb[k].value + '\n';
			}
		}
	}
}
</script>
</head>
<body>
<h3>마음에 드는 연예인을 고르시오</h3>
<form name='frm' method='post'>
	<textarea name='te' rows="5" cols="30"></textarea>
	<div id='cb'>
		<label><input type='checkbox' name='celb' value='강다니엘'>강다니엘</label>
		<label><input type='checkbox' name='celb' value='강동원'>강동원</label>
		<label><input type='checkbox' name='celb' value='윤아'>윤아</label>
		<label><input type='checkbox' name='celb' value='유재석'>유재석</label>
		<label><input type='checkbox' name='celb' value='박원'>박원</label>
		<label><input type='checkbox' name='celb' value='아이린'>아이린</label>
		<label><input type='checkbox' name='celb' value='강호동'>강호동</label>
	</div>
	<input type='button' name='btn' value='MyPick'>
	<input type='reset' value='취소'>
</form>
</body>
</html>