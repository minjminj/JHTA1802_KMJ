<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>gugudan</title>
</head>
<body>
<div id='gugudan'>
	<h3>안녕, 여기는 gugudan page야~</h3>
	<div id='info'>
		Ajax를 사용한 구구단 프로그램
	</div>
	<form name='frm' method='post'>
		<label>구구단</label>
		<input type='text' size='4' name='dan' value='5'/>
		<!-- <input type='submit' value='실행' id='btn'/> 
		submit의 형태때문에 자기자신 페이지를 클릭될때마다 reload함.. but ajax를 활용하면 페이지를 reload하지 않아야 하는것이 point!
		그래서 ajax를 활용할때는 submit보다는 button 형식을 활용해 method를 사용한다. -->
		<input type='button' value='실행' id='btn' class='btn'/>
		<br/>
	</form>
	<hr/>
	<div id='result'></div>
	
	<script>
		var btn = document.getElementById("btn");
		var xhr;
		btn.onclick = function(){
			xhr = new XMLHttpRequest();
			var param = document.frm.dan.value;
			var url = '/ajax/core/gugudan_process.jsp' + '?dan=' + param;
			xhr.open('post', url, true);
			xhr.onreadystatechange = function(){
				if (xhr.status == 200 && xhr.readyState == 4){
					var str = xhr.responseText;
					var rs = document.getElementById('result');
					rs.innerHTML = str;
				}
			}
			xhr.send(); // send()를 open 바로 뒤에 위치시켜도 상관은 없지만, 로직의 흐름상 event다음에 위치시키는 것이 좋다
		}
	</script>
</div>
</body>
</html>