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
</head>
<body>
<div id='list'>
	<h3>Search Employees(by id)</h3>
	<form name='frm' id='frm' method='post'>
		<input type='number' name='employee_id' value='${param.employee_id}'/>
		<input type='button' id='btn' value='RUN'/>
	</form>
	<h3>Result</h3>
	<div id='result'>
	<%
		String eid = request.getParameter("employee_id");
		if (eid != null){
			int id = Integer.parseInt(eid);
			EmpDao dao = new EmpDao();
			EmpVo vo = dao.select(id);
			if (vo == null){
				out.print("데이터가 없습니다.");
			} else {
				out.print("<li> eid: " +vo.getEmployee_id());
				out.print("<li> fn: " +vo.getFirst_name());
				out.print("<li> Ph: " +vo.getPhone_number());
				out.print("<li> Sal: " +vo.getSalary());
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
		var url = './begin/empList.jsp';
		
		$('#content').load(url, param);
	});
	
});
</script>
</body>
</html>