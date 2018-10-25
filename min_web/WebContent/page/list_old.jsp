<%@page import="bean.MemberVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<style>
	#btnFind {
		font-family: 'Do Hyeon', sans-serif;
	}	
	
	.b {
		border: 0px;
		background-color: #C8C8A9;
		
	}
	
</style>
</head>

<body>

<%

	String sec = request.getParameter("sec");
	String findStr = "";
	
	int nowPage = 1;
	if (request.getParameter("nowPage") != null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	if (request.getParameter("findStr") != null){
		findStr = request.getParameter("findStr");
	
	}
	
	MemberDao dao = new MemberDao();
	dao.setNowPage(nowPage);
	request.setAttribute("d", dao);
	
	List<MemberVo> list = dao.select(findStr);
	%>

<div id='list'>
	<h3 id='findmem' class='animated slideInLeft'>회원 조회</h3>
	
	<div id='findStr'>
		<form name='fff' method='POST' >
			<input type='text' name='findStr' value='${param.findStr }'/>
			<input type='submit' name='btnFind' value='검색' id='btnFind' /><br/><br/>
			<input type='hidden' name='nav' value="${param.nav }" />
			<input type='hidden' name='sec' value="${param.sec }" />
			<input type='hidden' name='id'/>
			<input type='hidden' name='nowPage' value='${d.nowPage }'/>
		</form>
	</div>
	
	<div id='wrapMenu'>
		<div id='listmenu' class='row  animated fadeIn'>
			<span class='id'>아이디</span>
			<span class='name'>성명</span>
			<span class='phone'>연락처</span>
			<span class='email'>이메일</span>
			<span class='rdate'>가입일</span>
		</div>
		
		<div id='findResult'>
		<%	for(MemberVo v : list){ %>
				<div class='row'>
					<span class='id'>
						<a href='#' onclick="go('<%=v.getId() %>')"><%=v.getId() %></a>
					</span>	
					<span class='name'><%=v.getName() %></span>	
					<span class='phone'><%=v.getPhone() %></span>	
					<span class='email'><%=v.getEmail() %></span>	
					<span class='rdate'><%=v.getRdate() %></span>	
				</div>
			<% } %>
		</div><p/>
		<!-- 페이지 이동을 위한 버튼 -->
		<% if(dao.getNowBlock() > 1) {%>
			<input type='button' value='&lt&lt' onclick='movePage(1)' class='b'/>
			<input type='button' value='&lt' onclick='movePage(${d.startPage} - 1)' class='b'/>
		<% } %>
		
		<% for (int p=dao.getStartPage() ; p<=dao.getEndPage() ; p++){%>
			<input type='button' value='<%=p %>' onclick='movePage(<%=p%>)' class='b'/>
		<% } %>
		
		<% if (dao.getNowBlock() < dao.getTotBlock()) {%>
			<input type='button' value='&gt' onclick='movePage(${d.endPage} + 1)'  class='b'/>
			<input type='button' value='&gt&gt' onclick='movePage(${d.totPage})' class='b'/>
		<% } %>
	</div>	
</div>

<script>
document.fff.onsubmit = function(){
	var ff = document.fff;
	ff.nowPage.value = 1;
	ff.submit();
}
function go(id){
	var ff = document.fff;
	ff.id.value = id;
	ff.method='post';  // test
	ff.sec.value = 'view.jsp';
	ff.action = 'index.jsp';
	ff.submit();
}

function movePage(nowPage){
	var ff = document.fff;
	
	ff.nowPage.value = nowPage;
	ff.submit();
}
</script>
</body>
</html>