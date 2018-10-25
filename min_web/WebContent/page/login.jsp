<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>

<style>
#loginmain {
/* 	border: 1.5px outset #7777dd; */
	width: 300px;
	padding: 20px;
	box-sizing: border-box;
	margin: 10px auto;
/* 	box-shadow: 2px 2px 4px #888888; */
/* 	border-radius: 5px; */
}
#loginmain>form>label {
	display: inline-block;
	width: 60px;
	text-align: right;
}
#btnlogin {
	width: 100px; height: 40px;
	margin-left: 70px;
	font-family: 'Do Hyeon', sans-serif;
	border: 0;
	background: #C8C8A9;
	
}
#btnlogin:hover {
	font-family: 'Do Hyeon', sans-serif;
	border: 1px solid white;
	background: black;
	color: white;
}
#loginmain > a {
	display: inline-block;
	width: 100px; height: 40px;	
	margin-left: 42px;
	text-decoration: none;
	font-family: 'Do Hyeon', sans-serif;
	border: 0;
	background: #C8C8A9;
}
#loginmain >a:hover {
	display: inline-block;
	
	font-family: 'Do Hyeon', sans-serif;
	border: 1px solid white;
	background: black;
	color: white;
}
.msg {
	font-size: 11px;
	color: red;
	text-align: center;
}
</style>
</head>
<body>
<%	
	String msg = "";

	String na = "../html/html_index.jsp";
	String se = "../html/anchor.jsp";
	String as =	"./aside_html.jsp";
	
	// 로딩할 페이지에 대한 정보를 가져옴.
	if (request.getParameter("nav") != null){
		na = request.getParameter("nav");
	}
	if (request.getParameter("oldsec") != null){
		se = request.getParameter("oldsec");
	}
	if (request.getParameter("aside") != null){
		as = request.getParameter("aside");
	}
	
	
	// 로그인 시 입력된 아이디와 비밀번호가 데이터에 저장된 정보와 일치하는가 판단하기

	
	
	// 로그인 시 아이디와 비밀번호에 오류가 있다면 메시지로 표시	
	if (request.getAttribute("msg") != null){
		msg = (String)request.getAttribute("msg");
	} else {
		msg = request.getParameter("msg");
	}
	
	if (msg == null) msg="";
	
%>

<div id='loginmain'>
	<h4>login</h4>
	<form name='flogin' method='post' action='login.login'>
		<label>아이디</label>
		<input type='text' name='mid'/><br/>
		
		<label>암호</label>
		<input type='password' name='pwd'/><br/>
		<output name='msg' class='msg'><%=msg %></output><br/>
		
		<p/>
		<input type='submit' value='LOGIN' id='btnlogin' name='btnlogin'/>
		
		<p/>
		<a class='a' href='index.jsp?sec=findId.jsp'>아이디찾기</a> 
		<a class='a' href='index.jsp?sec=findPwd.jsp'>암호찾기</a> 
		
		<input type='hidden' name='nav' value='<%=na%>'/>
		<input type='hidden' name='oldsec' value='<%=se%>'/>
		<input type='hidden' name='aside' value='<%=as%>'/>
	</form>
</div>

<!-- <script>
// 아이디 암호 찾기를 새 창에 띄우기
 var find = document.getElementById('find'); 선생님은 링크에 아이디 부여하심
 find.onclick = function(){
  	var url = 'findid.jsp'
 	var win = window.open(url, 'win', 'width=600px', 'height=300px')
 	여기서 'win'은 새로 열리는 창의 이름. 이름은 아무거나 설정해도 상관없다 하지만 이름을 설정하지
 	않으면 매번 새 창에 열리고 설정하면 설정된 이름의 새창 하나만 열림.
 }
</script> -->



</body>
</html>