<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// juery autocomplete 파일에서 사용될 기능
String type = request.getParameter("type");
String findStr = request.getParameter("findStr");
if (findStr == null) findStr = "";

Connection conn = new DBConnection().getConn();
StringBuilder sb = new StringBuilder();

String sql = "select DISTINCT first_name || ' ' || last_name fn "
		+ " from employees where lower(first_name) like lower(?) "
		+ " order by fn";
		    
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, "%" + findStr + "%");
ResultSet rs = ps.executeQuery();

if (type.equals("json")){ 
	sb.append("[");
	boolean start = true; // 마지막 ""을 제거하기 위해
	
	while (rs.next()){
		if(!start){
			sb.append(",");
		}
		sb.append("\"" + rs.getString("fn") + "\"");
		start = false;
	}
	sb.append("]");
	out.print(sb.toString());
} else if (type.equals("text")){
	while (rs.next()){
		out.print(rs.getString("fn"));
		out.print("\n");
	}
}
%>
