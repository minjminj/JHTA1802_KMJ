<%@page import="bean.DepartmentVo"%>
<%@page import="bean.EmpVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.departments {
	display: inline-block;
	width: 200px;
	margin: 5px;
}
</style>
<script>
$(function(){
	$('#btnSearch').click(function(){
		var param = $('#frm').serialize();
		var page = './begin/emp3.jsp';
		$('#result').load(page, param);
	});
	
	
});
</script>
</head>
<body>
<div id='foreach'>
	<h3>departments 테이블을 사용하여 부서코드를 select하여 체크박스 형태로 부서코드와 부서명을 나열한 후, 해당 부서코드를 선택하면 부서코드를 foreach/로 sql문을 생성하고 이에 해당하는 직원들의 사번, 성명, 연락처, 급여(EmpVo)를 조회하시오</h3>
	<%
		EmpDao dao = new EmpDao();
		List<DepartmentVo> list = dao.select_dept();
		request.setAttribute("list", list);
	%>
	<form name='frm' id='frm' method='post'>
		<c:forEach var='k' items='${list}'>
			<div class='departments'>
			<label><input type='checkbox' name='departments' value='${k.department_id}'/>${k.department_name}</label>
			</div>		
		</c:forEach>		
		<input type='button' id='btnSearch' value='Search'/>
	</form>
	<div id='result'></div>	
</div>
</body>
</html>