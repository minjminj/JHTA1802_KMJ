<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>use_if</title>
</head>
<body>
<c:if test='true'>
무조건 수행<br/>
</c:if>

<form>
<input type='text' name='name'/>
<input type='text' name='age'/>
<input type='submit' name='btn' value='욥욥'/>
</form>

<c:set var='nn' value='${param.name }'/>
<c:set var='kk' value='${param.kor }'/>


<c:if test="${param.name =='mj'}">
name은 ${param.name } <br/>
</c:if>

<c:if test='${param.age > 18 }'>
당신의 나이는 18세 이상입니다.
</c:if>
</body>
</html>