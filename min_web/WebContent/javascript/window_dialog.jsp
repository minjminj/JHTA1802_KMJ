<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>window_dialog</title>
<link href="https://fonts.googleapis.com/css?family=Eater|Gaegu" rel="stylesheet">
<style>
	#title {
		font-family: 'Gaegu', cursive;
		border-left:10px solid #ff5555;
		padding-left:10px;
		box-sizing:border-box;
		background:#ffeeee;
	}
	
	div {
		width:300px;
		text-align: center;
	}
	
	#btn_alret, #btn_prompt, #btn_comfirm {font-family: 'Eater', cursive;}
</style>
<script>
window.onload = function(){
	var btnAlert = document.getElementById('btn_alret');
	var btnPrompt = document.getElementById('btn_prompt');
	var btnComfirm = document.getElementById('btn_comfirm');
	
	btnAlert.onclick = function(){
		alert("OK");
	}
	
	btnPrompt.onclick = function(){
		var v = prompt("당신의 나이는? ", '이십팔');
		alert(v);
	}
	
	btnComfirm.onclick = function(){
		var yn = confirm("정말 삭제하시겠습니까?");S
		if (yn){
			alert('삭제가 시작되었습니다.또르르또르르흑흑');
		} else{
			alert('삭제가 취소되었습니다.휴살았다')
		}
	}
}
</script>
</head>
<body>
<div>
<h3 id='title'>javascript에서의 창 3가지</h3>

	<input type='button' value='Alert' id='btn_alret'/>
	<input type='button' value='Prompt' id='btn_prompt'/>
	<input type='button' value='Confirm' id='btn_comfirm'/>

</div>
</body>
</html>