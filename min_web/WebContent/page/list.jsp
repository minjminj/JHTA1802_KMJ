<%@page import="bean.MemberVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>서블릿 아닌 list</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<style>
	#btnFind {
		font-family: 'Do Hyeon', sans-serif;
	}	
	
	.b {
		border: 0px;
		background-color: #C8C8A9;
		
	}
	
.row1{
		
		display: inline-block;
		width: 300px;
		border: 1px solid #999999;
		margin-top: 10px;
   	 margin-left: 50px;
	}
	
	.id1 {
		display: block;
		width: 150px;
		text-align: left;		
	}
	
	.name1 {
		display: block;
		width: 80px;
		text-align: left;	
	}
	
	
	.phone1 {
		display: block;
		width: 170px;
		text-align: left;	
	}
	
	.email1 {
		display: block;
		width: 200px;
		text-align: left;	
	}
	
	.rdate1 {
		display: inline;
		width: 140px;
		text-align: left;	
	}
	
	
</style>
</head>

<body>

<%
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
		<form name='fff' method='POST'  >
			<input type='text' name='findStr' value='${findStr }'/>
			<input type='submit' name='btnFind' value='검색' id='btnFind' /><br/><br/>
			<input type='hidden' name='nav' value="${param.nav }" />
			<input type='hidden' name='sec' value="${param.sec }" />
			<input type='hidden' name='id'/>
			<input type='hidden' name='email'/>
			<input type='hidden' name='nowPage' value='${d.nowPage }'/>
		</form>
	</div>
	
<!-- 	<div id='wrapMenu'> -->
<!-- 		<div id='listmenu' class='row  animated fadeIn'> -->
<!-- 			<span class='id'>아이디</span> -->
<!-- 			<span class='name'>성명</span> -->
<!-- 			<span class='phone'>연락처</span> -->
<!-- 			<span class='email'>이메일</span> -->
<!-- 			<span class='rdate'>가입일</span> -->
<!-- 		</div> -->
		
		<div id='findResult'>
		
		<c:forEach var='i' items='<%=list %>'>
			
				<div class='row1'>
					<span class='id1'>
						<a href='#' onclick="go('${i.id}')">아이디: ${i.id}</a>
					</span><br/>
					<span class='name1'>이름: ${i.name}</span>	<br/>
					<span class='phone1'>연락처: ${i.phone}</span>	<br/>
<!-- 					<span class='email'> -->
<%-- 						<a href='index.jsp?nav=${param.nav }&sec=../mail/mail.jsp'>${i.email}</a> --%>
<!-- 					</span>	 -->
					<span class='email1'>
						<a href='#' onclick="send('${i.email}')">이메일: ${i.email}</a>
					</span>	<br/>
					<span class='rdate1'>가입일: ${i.rdate}</span>	<br/>
					<span><img src='../upload/${i.photO }' width='60px' height='60px'/></span>
				</div>
		</c:forEach>
		
		</div><p/>
		<div class='row'>
		<!-- 페이지 이동을 위한 버튼 -->
		<c:if test='${d.nowBlock > 1 }'>
			<input type='button' value='&lt&lt' onclick='movePage(1)' class='b'/>
			<input type='button' value='&lt' onclick='movePage(${d.startPage} - 1)' class='b'/>
		</c:if>
		
		<c:forEach var='k' begin='${d.startPage }' end='${d.endPage }'>
			<c:choose>
			<c:when test='${d.nowPage == k }'>
				<input type='button' value='${k}' onclick='movePage(${k})' class='b np'/>
			</c:when>
			<c:otherwise>
				<input type='button' value='${k}' onclick='movePage(${k})' class='b'/>
			</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test='${d.nowBlock < d.totBlock}'>
			<input type='button' value='&gt' onclick='movePage(${d.endPage} + 1)'  class='b'/>
			<input type='button' value='&gt&gt' onclick='movePage(${d.totPage})' class='b'/>
		</c:if>
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

// function send(email){ //그냥 원래 페이지에서 mail.jsp 찾아가기
// 	var ff = document.fff;
// 	ff.email.value = email;
// // 	ff.method='post';  // test
// 	ff.sec.value = '../mail/mail.jsp';
// 	ff.action = 'index.jsp';
// 	ff.submit();
// }

function send(email){ // 새창으로 mail.jsp 띄우기
	var win = window.open('../mail/mail.jsp', 'win_email', 'width=680px', 'height=400px');
	wid.onload=function(){
		win.document.frmMail.receiver.value=email;
	}
}

function movePage(nowPage){
	var ff = document.fff;
	
	ff.nowPage.value = nowPage;
	ff.submit();
}
</script>
</body>
</html>