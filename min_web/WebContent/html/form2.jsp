<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>form2</title>
</head>
<body>
<h3>HTML에 추가된 input 속성들</h3>
<form name = 'frm' method = 'post'>
	
	<label>color</label>
		<input type = 'color' name = 'color'/><br/>
	
	<label>date</label>
		<input type = 'data' name = 'date'/><br/>
	
	<label>datetime</label>
		<input type = 'datetime' name = 'datetime'/><br/>
	
	<label>datetime-local</label>
		<input type = 'datetime-local' name = 'datetime-local'/><br/>
	
	<label>email</label>
		<input type = 'email' name = 'email'/><br/>

	<label>month</label>
		<input type = 'month' name = 'month'/><br/>

	<label>number</label>
		<input type = 'number' name = 'number'/><br/>
	
	<label>range</label>
		<input type = 'range' name = 'range' min = '0' max = '100' value = '50'/><br/>
	
	<label>search</label>
		<input type = 'search' name = 'search'/><br/>
	
	<label>tel</label>
		<input type = 'tel' name = 'tel'/><br/>
	
	<label>time</label>
		<input type = 'time' name = 'time'/><br/>
	
	<label>url</label>
		<input type = 'url' name = 'url'/><br/>

	<label>week</label>
		<input type = 'week' name = 'week'/><br/>
	
	<label>etc</label>
		<textarea rows = '10' cols = '40' name = 'etc'></textarea><br/>
	
	<fieldset>
		<select size = '1' multiple = multiple/>
		<legend>1802기 커리큘럼</legend>
			<optgroup label = "">Application
				<option value = 'java'>Java</option>
				<option value = 'android'>Android</option>
			</optgroup>
			<optgroup label = "">Web
			 <option value = 'html5'>html5</option>
				<option value = 'css'>css</option>
				<option value = 'JavaScript'>JavaScript</option>
				<option value = 'Jsp'>Jsp</option>
			</optgroup>
			<optgroup label = "">Framework			
				<option value = 'ajax'>ajax</option>
				<option value = 'myBatis'>maBatis</option>
				<option value = 'jquery'>jquery</option>
				<option value = 'spring'>spring</option>
			</optgroup>
											
		</select>
	
	</fieldset>
	
	
	<br/>
	<input type = 'submit' value = 'submit'/>
	
</form>
<%
if (request.getMethod().equals("GET")) return;
request.setCharacterEncoding("utf-8");
%>
<ul>
	<li>color: <%=request.getParameter("color") %></li>
	<li>data: <%=request.getParameter("data") %></li>
	<li>datetime: <%=request.getParameter("datetime") %></li>
	<li>datetime-local: <%=request.getParameter("datetime-local") %></li>
	<li>email: <%=request.getParameter("email") %></li>
	<li>month: <%=request.getParameter("month") %></li>
	<li>number: <%=request.getParameter("number") %></li>
	<li>range: <%=request.getParameter("range") %></li>
	<li>search: <%=request.getParameter("search") %></li>
	<li>tel: <%=request.getParameter("tel") %></li>
	<li>time: <%=request.getParameter("time") %></li>
	<li>url: <%=request.getParameter("url") %></li>
	<li>week: <%=request.getParameter("week") %></li>
	<li>etc: <%=request.getParameter("etc") %></li>
</ul>
</body>
</html>