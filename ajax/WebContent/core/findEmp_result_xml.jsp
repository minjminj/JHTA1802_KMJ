<?xml version="1.0" encoding="UTF-8"?>
<%@page import="bean.FindEmpVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.FindEmpDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
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

<employees>
				<c:forEach var='i' items='${list }'>
				<employee>
					<id>${i.empId}</id>
					<name>${i.name }</name>
					<phone>${i.phone }</phone>
					<salary>${i.salary }</salary>
				</employee>
				</c:forEach>

</employees>