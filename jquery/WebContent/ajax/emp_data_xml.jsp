<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// juery autocomplete 파일에서 사용될 기능
String findStr = request.getParameter("findStr");
if (findStr == null) findStr = "";

Connection conn = new DBConnection().getConn();
StringBuilder sb = new StringBuilder();

String sql = "select DISTINCT first_name || ' ' || last_name fn, employee_id, phone_number, salary "
		+ " from employees where lower(first_name) like lower(?) "
		+ " order by fn";
		    
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, "%" + findStr + "%");
ResultSet rs = ps.executeQuery();

out.print("<employees>");
while(rs.next()){
	out.print("<employee>");
		out.print("<id>" +rs.getString("employee_id")+ "</id>");
		out.print("<fn>" +rs.getString("fn")+ "</fn>");
		out.print("<ph>" +rs.getString("phone_number")+ "</ph>");
		out.print("<sal>" +rs.getString("salary")+ "</sal>");
	out.print("</employee>");
}
out.print("</employees>");
%>
