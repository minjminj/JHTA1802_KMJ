<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='loadJson'>
	<h3>JSON 타입의 데이터</h3>
	<p id='info'>
		json 타입의 데이터를 
		<ul>
			<li>객체형</li>
			<li>배열형</li>
			<li>복합형</li>
			<li>DB에서</li>
		</ul>
		형태로 읽어 표현
	</p>
	
	<input type='button' value='객체형' id='btnObject' class='btn'/>
	<input type='button' value='배열형' id='btnArray' class='btn'/>
	<input type='button' value='복합형' id='btnComplex' class='btn'/>
	<input type='button' value='DB' id='btnDB' class='btn'/>
	<input type='button' value='FormToJSON' id='btnFormToJSON' class='btn'/>
	
	<!-- Form for Form to JSON TEST -->
	<br/>
	<label>Form for Form to JSON TEST</label>
		<!-- form 정보를 손쉽게 ajax로 전송하려면 반드시 enctype이 기술되어야 함 -->
	<form name='frmJSON' method='post' enctype='multipart/form-data'>
		<label>아이디</label>
		<input type='text' size='6' name='findStr' value='m'/>
		<br/>
		<label>취미</label>
		<label><input type='checkbox' name='hobby' value='곱먹'/>곱먹</label>
		<label><input type='checkbox' name='hobby' value='막먹'/>막먹</label>
		<label><input type='checkbox' name='hobby' value='육먹'/>육먹</label>
		<label><input type='checkbox' name='hobby' value='양먹'/>양먹</label>
		<label><input type='checkbox' name='hobby' value='회먹'/>회먹</label>
		<label><input type='checkbox' name='hobby' value='소먹'/>소먹</label>
		<label><input type='checkbox' name='hobby' value='삼먹'/>삼먹</label>
	</form>
	
	<div id='result'></div>
</div>

<script>
var btnObj = document.getElementById("btnObject");
var btnAry = document.getElementById("btnArray");
var btnCpl = document.getElementById("btnComplex");
var btnDB  = document.getElementById("btnDB");
var btnFtj = document.getElementById("btnFormToJSON");
var rs = document.getElementById("result");

// 객체형
btnObj.onclick = function(){
	var data = {"key"	: "value",
				"id"	: "a001",
				"name"	: "kim min jeong",
				"phone" : "02-2222-2222",
				"email" : "min@jeong.com"};
	
	var str = "<li>key	 : " + data.key
			+ "<li>id	 : " + data.id
			+ "<li>name	 : " + data.name
			+ "<li>phone : " + data.phone
			+ "<li>email : " + data.email;
	
	rs.innerHTML =str;
}

// 배열형
btnAry.onclick = function(){
	var data = ["백두산", "한라산", "설악산", "금강산", "치악산", "내장산", "지리산"];
	var str = "<ol><li>" + data.join("<li>") + "<\/ol>";
	
	rs.innerHTML = str;
}

// 객체형과 배열형이 혼합된 상태
btnCpl.onclick = function(){
	var data = {"id"	: "a001",
				"name"	: "홍길동",
				"hobby" : ["곱먹","막먹","육먹","양먹","회먹","소먹","삼먹"]}
	
	var str = "<li>아이디: "	+ data.id
			+ "<li>성명: "	+ data.name
			+ "<li>취미: "	+ data.hobby
			+ "<li><font color='blue'>ㅇㄱㄹㅇ: "	+ data.hobby[0] + "<\/font>";
	
	rs.innerHTML = str;
}

// DB
btnDB.onclick = function(){
	var str = "";
	if (xhr == null) xhr = new XMLHttpRequest();
	var url = '/ajax/core/findEmp_result_json.jsp'
	var param = "?findStr=" + document.frmJSON.findStr.value;
	url = url + param;
	
	xhr.open('get', url, true);
	xhr.onreadystatechange = function(){
		if (xhr.status == 200 && xhr.readyState == 4){
			var temp = xhr.responseText;
			
			// 문자열로 되어있는 JSON type을 JSON Object로 변환
			var list = JSON.parse(temp);
			str = "<table border='1' cellpadding='4' cellspacing='0'>";
			
			for (i=0 ; i<list.length-1 ; i++){ // -1을 하는 이유는 forEach뒤에 공갈데이터를 남겨놨기 때문에
				str += "<tr>"
					+ "<td>" + list[i].id + "<\/td>"
					+ "<td>" + list[i].name + "<\/td>"
					+ "<td>" + list[i].phone + "<\/td>"
					+ "<td>" + list[i].salary + "<\/td>"
					+ "<\/tr>";
			} 
			str += "<\/table>";			
		
			rs.innerHTML = str;
		}
	}
	xhr.send();
}

// Form의 파라미터들을 JSON 타입으로 변경하고 다시 form 타입으로
btnFtj.onclick = function(){
	var frm = document.frmJSON;
	var str = "";
	
	var newFrm = new FormData(frm);
	// form 정보를 JSON으로
	var jsonType = JSON.stringify();
	
	if (xhr == null) xhr = new XMLHttpRequest();
	xhr.open('post', '/ajax/core/loadJSON_test.jsp',true);
	xhr.send(newFrm);
	
	xhr.onreadystatechange = function(){
		if (xhr.status == 200 && xhr.readyState == 4){
			var doc = xhr.responseText;
			rs.innerHTML = doc;
		}
	}
}
</script>
</body>
</html>