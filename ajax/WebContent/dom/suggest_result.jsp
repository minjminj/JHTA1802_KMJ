<%@page import="bean.FindEmpVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.FindEmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<% 
	FindEmpDao dao = new FindEmpDao();
	
	String findStr = "";
	if (request.getParameter("findStr") != null) {
		findStr = request.getParameter("findStr");
	}
	List<FindEmpVo> list = dao.select(findStr);
	request.setAttribute("list", list);
%>

[
	<c:forEach var='i' items='${list }'>
		{
			"id" 	 : "${i.empId}",
			"name"   : "${i.name }",
			"phone"  : "${i.phone }",
			"email"  : "${i.email }",
			"salary" : "${i.salary }"
		},
	</c:forEach>
	{}
]