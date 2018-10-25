<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#menu .item {
	cursor: pointer;
	color: black;
	text-decoration: none;
}
#menu .item:hover {
	text-decoration: underline;
	background:black;
	color:white;
}
#menu .item:active {
	color: blue;
}

</style>
</head>
<body>
<div id='menu'>
	<div id='home'>
		<fieldset><legend>Home Page</legend>
			<ol>
				<li style='list-style-type : none'><span><a href='../min_web/page/index.jsp' class='item'>min_web</a></span></li>
				<li style='list-style-type : none'><span><a href='../jquery/index.jsp' class='item'>jquery</a></span></li>
			</ol>		
		</fieldset>
	</div>
	
	<div id='core'>
		<fieldset><legend>CORE</legend>
			<ol>
				<li><span class='item' onclick="pageLoad('/ajax/core/gugudan.jsp')">구구단</span></li>
				<li><span class='item' onclick="pageLoad('/ajax/core/sum.jsp')">x~y의 합</span></li>
				<li><span class='item' onclick="pageLoad('/ajax/core/findEmp.jsp')">직원조회</span></li>
				<li><span class='item' onclick="pageLoad('/ajax/core/findEmp_xml.jsp')">직원조회 xml.ver</span></li>
				
				<li><span class='item' onclick="pageLoad('/ajax/core/loadXML.jsp')">load XML</span></li>
				<li><span class='item' onclick="pageLoad('/ajax/core/loadJSP.jsp')">load JSP</span></li>
				<li><span class='item' onclick="pageLoad('/ajax/core/loadTEXT.jsp')">load TEXT</span></li>
				<li><span class='item' onclick="pageLoad('/ajax/core/loadText_B.jsp')">load TEXT</span></li>
				<li><span class='item' onclick="pageLoad('/ajax/core/loadJSON.jsp')">load JSON</span></li>
			</ol>
		</fieldset>
	</div>
	
	<div id='dom'>
		<fieldset><legend>DOM</legend>
			<ol>
				<li><span class='item' onclick="pageLoad('/ajax/dom/node_info.jsp')">Node Information</span></li>
				<li><span class='item' onclick="pageLoad('/ajax/dom/by_class_name.jsp')">By Class Name</span></li>
				<li><span class='item' onclick="pageLoad('/ajax/dom/attribute.jsp')">Attribute</span></li>
				<li><span class='item' onclick="pageLoad('/ajax/dom/appendChild.jsp')">Append Child</span></li>
				<li><span class='item' onclick="pageLoad('/ajax/dom/appendChild2.jsp')">Append Child2</span></li>
				<li><span class='item' onclick="pageLoad('/ajax/dom/suggest.jsp')">Suggest</span></li>
			</ol>
		</fieldset>
	</div>
	
	<div id='xml'>
		<fieldset><legend>XML</legend>
			<ol>
				<li><span>xml 1</span></li>
				<li><span>xml 2</span></li>
				<li><span>xml 3</span></li>
			</ol>
		</fieldset>
	</div>
	
	<div id='jsp'>
		<fieldset><legend>JSP</legend>
			<ol>
				<li><span>jsp 1</span></li>
				<li><span>jsp 2</span></li>
				<li><span>jsp 3</span></li>
			</ol>
		</fieldset>
	</div>
</div>


</body>
</html>