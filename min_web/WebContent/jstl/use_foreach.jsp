<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	HashMap<String, Object> ha = new HashMap<String, Object>();
	ha.put("name", "김민정");
	ha.put("today", new java.util.Date());
%>

<c:set var='intArray' value='<%=new int[]{1,2,3,4,5} %>'></c:set>
<c:set var='map' value='<%=ha %>'/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>use_foreach</title>
</head>
<body>

<h4>1부터 100까지 홀수의 합</h4>
<c:set var='sum' value='0'/>
<c:forEach var='i' begin='1' end='100' step='2'>
<c:set var='sum' value='${sum+i}'/>
</c:forEach>
결과: ${sum }

<h4>구구단: 4단</h4>
<c:forEach var='i' begin='1' end='9'>
	<li> 4 * ${i } = ${4*i }</li>
</c:forEach>

<h4>int형 배열</h4>
<c:forEach var='i' items='${intArray }' begin='2' end='4' varStatus='status'>
	${status.index }-${status.count } - [${i }]<br/>
</c:forEach>

<h4>Map</h4>
<c:forEach var='i' items='${map }'>
	${i.key } = ${i.value }<br/>
</c:forEach>

</body>
</html>