<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sum</title>
</head>
<body>
<div id='sum'>
	<h3> x~y의 합 </h3>
	<div id='info'>
		두 수 x,y를 입력받아 x~y의 합계를 계산함.
	</div>
	
	<form name='frm'>
		<label>X</label>
		<input type='text' name='x' value='1'/>
		<br/>
		<label>Y</label>
		<input type='text' name='y' value='100'/>
		<br/>
		<input type='button' value='계산' id='btn' class='btn'/>
	</form>
	
	<div id='result'></div>
	
	<script>
		var xhr;
		var btn = document.getElementById("btn");
		var rs = document.getElementById("result");
		var ff = document.frm;
		btn.onclick = function(){
			if (xhr == null) xhr = new XMLHttpRequest();
			var x = ff.x.value;
			var y = ff.y.value;
			var param = "?x=" + x + "&y=" + y;
			var url = "/ajax/core/sum_result.jsp" + param;
		
			xhr.open('get', url, true);
			xhr.onreadystatechange = function(){
				if (xhr.status == 200 && xhr.readyState == 4){
					var str = xhr.responseText;
					rs.innerHTML = str;
				}
			}
			xhr.send();
		}
	</script>
</div>
</body>
</html>