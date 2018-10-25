<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>gugudan_process</title>
</head>
<body>
<%
		int dan = Integer.parseInt(request.getParameter("dan"));
		StringBuffer sb = new StringBuffer();
		
		for(int i=1 ; i<10 ; i++){
			String temp = String.format("%d * %d = %d <br/>", dan, i, (dan*i));
			sb.append(temp);
		}
		out.print(sb.toString());
	%>
</body>
</html>