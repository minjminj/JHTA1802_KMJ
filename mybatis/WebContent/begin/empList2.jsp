<%@page import="java.util.List"%>
<%@page import="bean.EmpVo"%>
<%@page import="bean.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.findList {
	display: inline-block;
	border: 1px solid #999999;
	margin: 5px;
	width: 215px;
	border-radius: 6px;
	box-shadow: 3px 3px 3px #999999;
}
.findList li {
	list-style: none;
}
</style>
</head>
<body>
<div id='list2'>
	<h3>Search Employees(by id)</h3>
	<form name='frm' id='frm' method='post'>
		<input type='text' name='findStr'/>
		<input type='button' id='btn' value='RUN'/>
	</form>
	<h3>Result</h3>
	<div id='result'>
	<%
		String findStr = request.getParameter("findStr");
		if (findStr != null){
			EmpDao dao = new EmpDao();
			List<EmpVo> list = dao.select2(findStr);
			if (list == null){
				out.print("데이터가 없습니다.");
			} else {
					System.out.println("222222222");
				for (int i=0 ; i<list.size(); i++){
					out.print("<ul class='findList'>");
					out.print("<li> eid: " + list.get(i).getEmployee_id());
 					out.print("<li> fn: " + list.get(i).getFirst_name());				
 					out.print("<li> Ph: " + list.get(i).getPhone_number());
 					out.print("<li> Sal: " + list.get(i).getSalary());
					out.print("</ul>");
				}
			} 
		} else {
			out.print("검색어를 입력해주세요");
		}
	%>
	</div>
</div>
<script>
$(function(){
	$('#btn').click(function(){
		var param = $('#frm').serialize();
		var url = './begin/empList2.jsp';
		console.log(param);
		
		$('#content').load(url, param);
	});
	
});
</script>
</body>
</html>