<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hobby</title>
<link href="https://fonts.googleapis.com/css?family=Eater|Gaegu" rel="stylesheet">
<style>
* {font-family: 'Gaegu', cursive;}
#title {
	border-left:10px solid pink;
	padding-left:10px;
	box-sizing:border-box;
	background:#eeeeee;
	color: #222222;
}
.la {
	background-color: #999999;
	color: white;
	border: 1px solid #cccccc;
	text-align: right;
	width: 100px;
	display: inline-block;
}

.in {
	border: 0px;
	border-bottom: 1.5px solid #999999;
	box-shadow:0.3px 0px 0.3px #999999;
}

#tr {
	vertical-align: top;
}

#sub {
    margin-left: 125px;
}

</style>
</head>
<body>
<h3 id='title'>아이디, 성명, 취미(checkbox), 여행희망지역(select, multiple)을 입력받아 동일한 페이지에 출력</h3>
<form name='frm' method='post'>
	<label class='la'>아이디</label>
	<input class='in' type='text' name='mid'/><br/>
	<label class='la'>성명</label>
	<input class='in' type='text' name='irum'/><br/>
	
	<label class='la'>취미</label>
	<label><input type='checkbox' name='hob' value='자기'>자기</label>
	<label><input type='checkbox' name='hob' value='곱창먹기'>곱창먹기</label>
	<label><input type='checkbox' name='hob' value='삼겹살먹기'>삼겹살먹기</label>
	<label><input type='checkbox' name='hob' value='소고기먹기'>소고기먹기</label>
	<label><input type='checkbox' name='hob' value='회먹기'>회먹기</label><br/>
	
	<br/>
	<label class='la' id='tr'>희망여행지역</label>
	<select multiple='multiple' name='trip' size='9'>
		<optgroup label='Asia'>Asia
			<option value='thailand'>Thailand</option>
			<option value='indo'>Indo</option>
			<option value='veitnam'>Veitnam</option>
		</optgroup>
		<optgroup label='Europe'>Europe
			<option value='italy'>Italy</option>
			<option value='spain'>Spain</option>
			<option value='england'>England</option>
			<option value='chezk'>Chezk</option>
			<option value='germany'>Germany</option>
		</optgroup>
		<optgroup label='NorthAmerica'>NorthAmerica
			<option value='canada'>Canada</option>
			<option value='unitedstate'>UnitedState</option>
			<option value='mexico'>Mexico</option>
		</optgroup>
	</select><br/><br/>
	
	<input type='submit' value='전송' id='sub'/>
</form>
<hr/>

<%
	request.setCharacterEncoding("utf-8");
//	if (request.getMethod().equals("GET")) return;
	
	String id = request.getParameter("mid");
	String irum = request.getParameter("irum");
	String[] hob = request.getParameterValues("hob");
	String[] trip = request.getParameterValues("trip");
	
	out.print("<li>아이디: " + id);
	out.print("<li>성명  :" + irum);
	out.print("<li>취미  : " + Arrays.toString(hob));
	out.print("<li>희망여행지역: " + Arrays.toString(trip));
%>
</body>
</html>