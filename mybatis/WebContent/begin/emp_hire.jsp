<%@page import="bean.EmpVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.findList {
	display: inline-block;
	border: 1px solid #999999;
	margin: 5px;
	width: 215px;
	border-radius: 6px;
	box-shadow: 3px 3px 3px #999999;
}
.findList li {
	list-style: none;
}
</style>
</head>
<body>
<div id='emp_hire'>
	<h3>Search Employees(by year of hire_date)</h3>
	<form name='frm_hire' id='frm_hire' method='post'>
		<input type='number' name='hire_date' />
		<input type='button' id='btn' value='RUN'/>
	</form>
	<h3>Result</h3>
	<div id='result'>
	<%
		String hDate = request.getParameter("hire_date");
		if (hDate != null){
			EmpDao dao = new EmpDao();
			List<EmpVo> list = dao.selectHire(hDate);
			if (list == null){
				out.print("데이터가 없습니다.");
			} else {
				for (EmpVo i:list){
					out.print("<ul class='findList'>");
					out.print("<li> eid: " +i.getEmployee_id());
					out.print("<li> fn: " +i.getFirst_name());
					out.print("<li> Ph: " +i.getPhone_number());
					out.print("<li> Date: " +i.getHire_date());
					out.print("</ul>");
				}
			}
		} else {
			out.print("검색어를 입력해주세요");
		}
	%>
	</div>
</div>
<script>
$(function(){
	$('#btn').click(function(){
		var param = $('#frm_hire').serialize();
		var url = './begin/emp_hire.jsp';
		
		$('#content').load(url, param);
	});
	
});
</script>
</body>
</html>