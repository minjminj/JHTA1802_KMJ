<%@page import="bean.EmpVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.list{
	display: inline-block;
	width: 200px;
	margin: 5px;
	border: 1px solid grey;
	
}
</style>
</head>
<body>
<%
	String[] departments = request.getParameterValues("departments");
	
	EmpDao dao = new EmpDao();
	List<EmpVo> list = dao.select_foreach(departments);
	
	request.setAttribute("d_list", list);
%>
<h4>부서원[검색인원 : ${fn:length(d_list) }]</h4>
<c:forEach var='vo' items='${d_list}'>
	<ul class='list'>
		<li> 사번: ${vo.employee_id } </li>
		<li> 성명: ${vo.first_name } </li>
		<li> 연락처: ${vo.phone_number } </li>
		<li> 급여: ${vo.salary } </li>
	</ul>
</c:forEach>
</body>
</html>