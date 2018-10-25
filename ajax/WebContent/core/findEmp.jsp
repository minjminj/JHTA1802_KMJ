<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>findEmp</title>
</head>
<body>
<div id='find_emp'>
	<h3>성명의 일부분을 입력받아 ajax를 사용하여 findEmp_result.jsp 호출</h3>
	<div id='info'>
		DB Employees 테이블에서 정보 검색
	</div>
	<form name='frm'>
		<label>이름 검색</label>
		<input type='text' name='findStr'id = 'findStr' size='12'/>
		<input type='button' value='검색' id='btn' class='btn'/>
		<br/>
	</form>
	<hr/>
	<div id='result'>
	
	</div>
	
	<script>
		var xhr;
		var btn = document.getElementById("btn");
		var findStr = document.getElementById("findStr");
		var rs = document.getElementById("result");
		
		btn.onclick = function(){
			if (xhr == null) xhr = new XMLHttpRequest();
			var param = '?findStr=' + document.frm.findStr.value;
			var url = '/ajax/core/findEmp_result.jsp' + param;
			
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