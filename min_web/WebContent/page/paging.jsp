<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>페이징 기법</title>
</head>
<body>
<form name = 'frm' method='post'>
	<input type='text'	name='findStr' value='' />
	<input type='text' name='nowPage' value='1' size='3'/>
	<input type='submit' value='검색' />
</form>
<%
	Connection con = new DBConnection().getConn();
	String findStr = "";
	int nowPage = 1;
	if (request.getParameter("findStr") != null){
		findStr = request.getParameter("findStr");
	}
	if (request.getParameter("nowPage") != null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}

	// 검색에 해당하는 전체 건수
	String sql = "select count(first_name) totSize from employees "
				+ " where first_name like ?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, "%" + findStr + "%");
	ResultSet rs = ps.executeQuery();
	rs.next();
	
	
	// paging var	
	int totSize = rs.getInt("totSize");
	int listSize = 10;
	int blockSize = 7;
	
	int totPage = (int)Math.ceil(totSize/(double)listSize);
	int totBlock = (int)Math.ceil(totPage/(double)blockSize);
	int nowBlock = (int)Math.ceil(nowPage/(double)blockSize);
	
	int endPage = nowBlock * blockSize;
	int startPage = endPage - blockSize + 1;
	
	int endNo = nowPage * listSize;
	int startNo = endNo - listSize + 1;
	
	// startNo ~ endNo까지의 데이터를 가져옴
	sql = "select * from (	select rownum num, r.* from ( 	select * from employees where first_name like ? order by first_name )r  )where num between ? and ? ";

	
	ps = con.prepareStatement(sql);
	ps.setString(1, "%" + findStr + "%");
	ps.setInt(2, startNo);
	ps.setInt(3, endNo);
	
	rs = ps.executeQuery();
	
	out.print("<h4>Result</h4>");
	
	
	while (rs.next()){
		out.print(rs.getString("num") + " ............. ");
		out.print(rs.getString("first_name") + " ............. ");
		out.print(rs.getInt("salary") + " ............... ");
		out.print(rs.getString("email") + " ..............." + "<br/> ");
	}
%>

<ol>
	<li>totSize: <%=totSize %></li><br/>
	<li>totPage: <%=totPage %></li><br/>
	<li>totBlock: <%=totBlock %></li><br/>
	<li>nowBlock: <%=nowBlock %></li><br/>
	
	<li>startPage: <%=startPage %></li><br/>
	<li>endPage: <%=endPage %></li><br/>
	<li>startNo: <%=startNo %></li><br/>
	<li>endNo: <%=endNo %></li>
</ol>

<script>
	var ff = document.frm;
	var findStr = '<%=findStr%>'
	var nowPage = '<%=nowPage%>'
</script>
</body>
</html>