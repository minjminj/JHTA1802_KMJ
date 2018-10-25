<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>use_choose</title>
</head>
<body>
<form>
	<input type='text' name='member'/>
	<input type='submit' name='btn' value='스웩'/>
</form>

<c:choose>
	<c:when test="${param.member =='min' }">
	너 민정이구나<br/>
	</c:when>
	<c:when test="${param.member == 'gil' }">
	너 길동이구나<br/>
	</c:when>
	<c:when test="${param.member == 'hee' }">
	너 희동이구나<br/>
	</c:when>
	<c:otherwise>
	너는 누구니?<br/>
	</c:otherwise>
</c:choose>
</body>
</html>