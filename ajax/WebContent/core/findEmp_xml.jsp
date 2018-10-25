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
		오라클의 employees 데이터를 xml로 전달받아 처리하는 예
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
			var url = '/ajax/core/findEmp_result_xml.jsp' + param;
			
			xhr.open('get', url, true);
			xhr.onreadystatechange = function(){
				if (xhr.status == 200 && xhr.readyState == 4){
					var xml = xhr.responseXML;
					var id 		= xml.getElementsByTagName("id");
					var name 	= xml.getElementsByTagName("name");
					var phone 	= xml.getElementsByTagName("phone");
					var salary	= xml.getElementsByTagName("salary");
					
					var str = "<table border='1' cellpadding='4' cellspacing='0'>"
							+ "<tr><th>아이디<\/th><th>성명<\/th><th>연락처<\/th><th>급여<\/th><\/tr>";
					for (i=0 ; i<id.length ; i++){
						str += "<tr>"
							+ "<td>" + id.item(i).firstChild.nodeValue + "<\/td>"
							+ "<td>" + name.item(i).firstChild.nodeValue + "<\/td>"
							+ "<td>" + phone.item(i).firstChild.nodeValue + "<\/td>"
							+ "<td>" + salary.item(i).firstChild.nodeValue + "<\/td>"
							+ "<\/tr>"
					}
					
					str += "<\/table>"
					rs.innerHTML = str;
				}
			}
			xhr.send();  
		}
	</script>
</div>
</body>
</html>