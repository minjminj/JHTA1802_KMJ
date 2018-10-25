<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>For 수정</title>

<style>

.bbb{
	position: absolute;
	top: 50%;
	left: 50%;
	tranform: translate(-50%, -50%);
	width: 200px;
	height: 75px;
	background: white;
	border-radius: 75px;
	text-align: center;
	font-size: 30px;
	line-height: 75px;
	text-decoration: none;
	color: #262626;
	transition: 0.5s;
	text-transform: uppercase;
}

.bbb.active {
	background: transparent;
	color: white;
}

.bbb:before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	background: #ff0047;
	width: 50%;
	height: 100%;
	transition: 0.5s;
	z-index: -1;
	transform: translateX(-200px) rotate(-325deg);
	opacity: 0;
	visibility: hidden;
}

.bbb.active:before {
	left: 30px;
	transform: translateX(0) rotate(35deg);
	border-top-left-radius:75px;
	border-bottom-left-radius:75px;
	opacity: 1;
	visibility: visible;
}

.bbb:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	background: #ff0047;
	width: 50%;
	height: 100%;
	transition: 0.5s;
	z-index: -1;
	transform: translateX(200px) rotate(325deg);
	opacity: 0;
	visibility: hidden;
}

.bbb.active:after {
	right: 30px;
	transform: translateX(0) rotate(-35deg);
	border-top-right-radius:75px;
	border-bottom-right-radius:75px;
	opacity: 1;
	visibility: visible;
}
</style>

</head>
<body>
<h3 id='modifymem' class='animated slideInLeft'>회원 정보 수정 결과</h3>
<jsp:useBean id="member" class='bean.MemberVo' scope='page'/>
<jsp:setProperty property="*" name="member"/>
<%
	
	int nowPage = 1;
	
	if (request.getParameter("nowPage") != null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	MemberDao dao = new MemberDao();
	if (dao.update(member)){

		out.print("정상적으로 수정됨.");
	} else{
		out.print("수정 중 오류 발생");
	}


%>

<div id='modi' class='animated fadeIn'>
	<form name='frmStore' method='post'>
		<input type='hidden' value='${param.nav }' name='nav'/>
		<input type='hidden' value='${param.sec }' name='sec'/>
		<input type='hidden' value='${param.findStr }' name='findStr'/>
		<input type='button' value='목록' name='btnList' class='bbb'/>
		<input type='hidden' name='nowPage' value='${param.nowPage }'/>
	</form>
</div>

<script>
var ff = document.frmStore;

ff.btnList.onclick = function(){
	ff.nav.value = 'chap08_member_control.jsp'
	ff.sec.value = 'list.jsp';
	ff.submit();
}
</script>
</body>
</html>