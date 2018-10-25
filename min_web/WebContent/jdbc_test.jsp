<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Oracle JDBC Driver Testing...</title>

<style>
.item1{
	display: inline-block;
	width: 150px;
}
.item2 {
	display: inline-block;
	width: 250px;
}
</style>
</head>
<body>
<%
// String driver = "oracle.jdbc.driver.OracleDriver";		// 드라이버명은 문자열 상수로 자바에 설정되어 있음.\
// String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";
// String dbUser = "hr";
// String dbPwd = "hr";

// try{
// 	//driver load
// 	Class.forName(driver);
// 	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
// 	out.print("connection good");
// } catch(Exception ex){
// 	out.print(ex.toString());
// }

Connection conn = new DBConnection().getConn();

if(conn != null){
	out.print("good");
}

try{
	String sql = "select first_name, phone_number from employees"
			   		// 따옴표 안에 where안에 공백을 준 이유는 sql문에서 emlpoyees하고 한칸 공백을 줘야하니까.
			   + " where first_name like ?";
						// JDBC에서 sql문에 ?는 파라미터를 나타냄.
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, "%a%");	// %a%가 ?의 자리로 작은따옴표에 감싸진채로 들어감. like '%a%'
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		out.print("<div>");
		out.print("<span class='item1'>" + rs.getString("first_name") + "</span>");
		out.print("<span class='item2'>" + rs.getString("phone_number") + "</span>");
	}
} catch(Exception ex){
	out.print(ex.toString());
}
%>
</body>
</html>