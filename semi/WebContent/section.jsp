<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
</head>

<body>
		<%	
			String content = "web/main.jsp";
			if(request.getParameter("content") != null) {
				content = request.getParameter("content");
			}
			request.setAttribute("content", content);
		%>
		<c:choose>
			<c:when test="${content eq 'web/main.jsp'}">
				<jsp:include page="section_main.jsp" />
			</c:when>
			<c:otherwise>
<%-- 				<jsp:include page="section_normal.jsp" /> --%>
			</c:otherwise>
		</c:choose>
		
		<div id='content'>
			<jsp:include page="<%=content %>" />
		</div>
	
</body>
</html>