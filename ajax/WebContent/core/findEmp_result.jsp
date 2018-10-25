<%@page import="bean.FindEmpVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.FindEmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>findEmp_result</title>
</head>
<body>
<% 
	FindEmpDao dao = new FindEmpDao();
	
	String findStr = "";
	if (request.getParameter("findStr") != null) {
		findStr = request.getParameter("findStr");
	}
	List<FindEmpVo> list = dao.select(findStr);
	request.setAttribute("list", list);
%>
<div id='findEmp_result'>
	<h3>사번, 연락처, 급여정보를 적당한 layout으로 출력</h3>
	<table border='1'>
		<tr>
			<td>사번</td>
			<td>성명</td>
			<td>연락처</td>
			<td>급여</td>
		</tr>
		
<%-- 		<c:choose>
			<c:when test = '${! empty list}'>
				<c:forEach var='i' items='${list }'>
				<tr>
					<td>${i.empId}</td>
					<td>${i.name }</td>
					<td>${i.phone }</td>
					<td>${i.salary }</td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan=5 align=center>검색결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose> --%>
		
		
		
		
		
		<c:forEach var='i' items='${list }'>
			<tr>
				<td>${i.empId}</td>
				<td>${i.name }</td>
				<td>${i.phone }</td>
				<td>${i.salary }</td>
			</tr>
		</c:forEach>
	
	</table>
</div>
</body>
</html>