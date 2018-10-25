<%@page import="bean.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>set | remove</title>
</head>
<body>
<h3 id='title'>set | remove</h3>
<pre id='doc'>
-변수지정
&ltc:set var='변수명' value='값' [scope='']/>
-변수제거
&ltc:remove var="변수명" [scope='']/>
</pre><br/>

<c:set var='id' value='a001' />
<c:set var='name' value='hong' />

<li>id = ${id }</li>
<li><c:out value = '${id }' /></li><br/>

<div> JSP의 변수를 set으로 설정하는 방법 </div>
<%
	String phone = "010-1111-1111";
	request.setAttribute("phone", phone);
	
%>

<li> phone = ${phone }</li>
<li><c:set var="phone" value='${phone }' /></li><br/>

<div>JAVA Bean(Object)를 set으로 설정</div>
<%
	MemberVo vo = new MemberVo();
	vo.setId("a001");
	request.setAttribute("vo", vo);
%>
<li> id = ${vo.id }</li>
<li><c:set var='id' value='${vo.id }'/></li>
<li><c:out value='${id }'/></li>
<li><c:out value='${vo.id }'/></li><br/>

<div>jstl property를 사용한 값 지정</div>
<c:set target='${vo}' property='name' value='park'/>
<li> name = ${vo.name }</li>
<c:set var='irum' value='${vo.name }'/>
<li><c:out value="${irum }"></c:out></li>
<li><c:out value='${vo.name }'/></li>

<div>set으로 설정된 변수를 메모리에서 제거</div>
<c:remove var='irum'/>
[<c:out value='${irum }'/>]
</body>
</html>