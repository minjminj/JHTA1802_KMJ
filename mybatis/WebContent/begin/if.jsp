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
		var param = 'findStr=' +  $('#findStr').val();
		var page = './begin/if.jsp';
		$('#content').load(page, param);
	});
});
</script>
</head>
<body>
<div id='if'>
	<h3>입사월이 입력된 경우만 입사월을 where 조건으로 검색하도록 if/ 를 사용하여 sql문장을 처리하시오</h3>
		<input type='text' id='findStr'/>
		<input type='button' id='btnSearch' value='Search'/>
	<div id='result'>
	<%
		EmpDao dao = new EmpDao();
		String findStr = "";
		if (request.getParameter("findStr") != null){
			findStr = request.getParameter("findStr");
		}
		List<EmpVo> list = dao.select_if(findStr);
			// 만약 setAttribute했으면 c:foreach로 사용할 수 있다.
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