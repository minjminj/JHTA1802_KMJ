<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='nodeInfo' class='nodeInfo_class'>
	<h3>Node Information</h3>
	<p id='info'>
		특정 Node의 정보를 Element Interface를 사용하여 확인한다.
	</p>
	<b>Here Information >>> </b>
	<div id='div1' class='div1' style='color:blue'>
		Element interface를 사용한 Node의 정보
	</div>
	<p/>
	<input type='button' value='Information' onclick='info()' class='btn'/>
	
	<div id='result'></div>
	
</div>

<script>
	function info(){
		var rs = document.getElementById("result");
		var str = '';
		var rootNode = document.getElementById("nodeInfo");
		
		str = '<ul><li>Root Node Name: <\/b>' + rootNode.nodeName
			+ '<li>Root Node ID: <\/b>' + rootNode.id
			+ '<li>Root Node Class Name: <\/b>' + rootNode.className;
			+ '<li>Root Node Type: <\/b>' + rootNode.nodeType;
			+ '<\/ul>'
			
		// rootNode의 childNode 중에서 div인 것만 가져와 정보를 표시해 주기
		var childNodes = rootNode.getElementsByTagName("p");
		
		str += '<ul>'
			+ '<li><b> child node length: <\/b>' + childNodes.length
			+ '<\/ul>';
			
		for (i=0 ; i<childNodes.length ; i++){
			str += '<ul><li><b>child noid id: <\/b>' + childNodes.item(i).id
				+ '<li><b> child node value: <\/b>' + childNodes.item(i).textContent
				+ '<\/ul>';
		}
		 	
		rs.innerHTML = str;
	}
</script>
</body>
</html>