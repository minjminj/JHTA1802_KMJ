<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='loadXML'>
	<h3>XML file LOAD</h3>
	<p id='info'>
		XML 형태 파일을 읽어 파서 없이 화면에 표시
	</p>
	<input type='button' value='XML File Load' id='btnLoad' class='btn'/>
	<p/>
	<div id='result'></div>
</div>
<script>
var xhr;
var rs = document.getElementById("result");
var btn = document.getElementById("btnLoad");

btn.onclick = function(){
	if (xhr == null) xhr = new XMLHttpRequest();
	xhr.open('get', '/ajax/core/file.xml', true);
	xhr.send();
	xhr.onreadystatechange = function(){
		if (xhr.status == 200 && xhr.readyState == 4){
			var xml= xhr.responseXML;
			
			var name = xml.getElementsByTagName("성명");
			var address = xml.getElementsByTagName("주소");
			var phone = xml.getElementsByTagName("연락처");
			var zip = xml.getElementsByTagName("우편번호");
			
			var str = "";
			for (var i=0 ; i<name.length ; i++){
				str += "<ul>"
					+ "<li>성명: "	+ name.item(i).firstChild.nodeValue
					+ "<li>주소: " 	+ address.item(i).firstChild.nodeValue
					+ "<li>연락처: "  + phone.item(i).firstChild.nodeValue
					+ "<li>우편번호: " + zip.item(i).firstChild.nodeValue
					+ "<\/ul>"
			}
					
// 			var str =
// 					"<ul>"
// 					+ "<li>성명: "	+ name.item(0).firstChild.nodeValue
// 					+ "<li>주소: " 	+ address.item(0).firstChild.nodeValue
// 					+ "<li>연락처: "  + phone.item(0).firstChild.nodeValue
// 					+ "<li>우편번호: " + zip.item(0).firstChild.nodeValue
// 					+ "<\/ul>"
			rs.innerHTML = str;
		}
	}
	
}

</script>
</body>
</html>