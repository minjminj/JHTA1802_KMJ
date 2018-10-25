<%@page import="bean.EmpVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.list {
	display: inline-block;
	width: 300px;
	border: 1px solid grey;
	margin: 5px;
}
</style>
<script>
$(function(){
	$('#btnSearch').click(function(){
		var param = $('#frm').serialize();
		var page = './begin/where.jsp';
		$('#content').load(page, param);
	});
});
</script>
</head>
<body>
<div id='where'>
	<h3>사원명과 입사년을 입력받아 직원정보를 조회하는데 사원명이나 입사년이 입력된 경우만 조건절에 사용되도록 where/를 사용하여 sql문을 완성하시오</h3>
	<form name='frm' id='frm' method='post'>
		<label>사원명</label><input type='text' name='findStr' value='${param.findStr }'/>
		<label>입사년</label><input type='text' name='hire' value='${param.hire }'/>
		<input type='button' id='btnSearch' value='Search'/>
	</form>
	<div id='result'>
	<%
		EmpDao dao = new EmpDao();
		String findStr = "";
		if (request.getParameter("findStr") != null){
			findStr = request.getParameter("findStr");
		}
		String hire = "";
		if (request.getParameter("hire") != null){
			hire = request.getParameter("hire");
		}
		List<EmpVo> list = dao.select_where(findStr, hire);
		
		if (list == null){
			out.print("데이터가 없습니다");
		} else {
			for (EmpVo k : list){
				out.print("<div class='list'>");
				out.print("<li>" + k.getEmployee_id() + "</li>");
				out.print("<li>" + k.getFirst_name() + "</li>");
				out.print("<li>" + k.getPhone_number() + "</li>");
				out.print("<li>" + k.getHire_date() + "</li>");
				out.print("</div>");
			}
		}
	%>
	</div>
</div>
</body>
</html>