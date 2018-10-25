<%@page import="java.sql.Connection"%>
<%@page import="bean.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
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
	
	Connection conn = new DBConnection().getConn();
	List<String> list = new ArrayList<String>();
		
	String sql = "select employee_id, first_name, phone_number, salary, email from employees "
				+ "where lower(first_name) like lower(?) or lower(last_name) like lower(?) or phone_number like ? or lower(email) like lower(?)";
																									// lower (first_name) like lower(?)
		
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, "%" + findStr + "%");
	ps.setString(2, "%" + findStr + "%");
	ps.setString(3, "%" + findStr + "%");
	ps.setString(4, "%" + findStr + "%");
			
	ResultSet rs = ps.executeQuery();
	while(rs.next()) {
		list.add(rs.getString("first_name"));
		list.add(rs.getString("phone_number"));
		list.add(rs.getString("email"));
	}
	conn.close();
	request.setAttribute("list", list);
%>

[
	<c:forEach var='i' items="${list }">
		"${i }",
	</c:forEach>
	""
]