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
<title>servlet list</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<style>
	#btnFind {
		font-family: 'Do Hyeon', sans-serif;
	}	
	
	.b {
		border: 0px;
		background-color: #C8C8A9;
		
	}
.row {
    text-align: center;	
}
.row1{
		display: inline-block;
		width: 300px;
		border: 1px solid #999999;
		margin-top: 10px;
   	 margin-left: 50px;
	}
	
	.id {
		
		width: 150px;
		text-align: left;		
	}
	
	.name {
	
		width: 80px;
		text-align: left;	
	}
	
	
	.phone {
	
		width: 170px;
		text-align: left;	
	}
	
	.email {
	
		width: 200px;
		text-align: left;	
	}
	
	.rdate {
		
		width: 140px;
		text-align: left;	
	}	
</style>
</head>

<body>


<div class='list'>
	<h3 class='title animated slideInLeft'>회원 조회</h3>
	
	<div class='findStr'>
		<form name='fff' method='POST' action='list.hta' >
			<input type='text' name='findStr' value='${findStr }'/>
			<input type='submit' name='btnFind' value='검색' id='btnFind' /><br/><br/>
			<input type='hidden' name='nav' value="${param.nav }" />
			<input type='hidden' name='sec' value="${param.sec }" />
			<input type='hidden' name='id'/>
			<input type='hidden' name='email'/>
			<input type='hidden' name='nowPage' value='${d.nowPage }'/>
		</form>
	</div>
		
		<div id='findResult'>
		
		
		<c:forEach var='i' items='${vo }'>
			
				<div class='row1'>
					<span class='image'><img src='../upload/sm_${i.photo }' width='70px' height='105px'/></span>
					<span class='id'>
						<a href='#' onclick="go('${i.id}')">아이디: ${i.id}</a>
					</span>	
					<span class='name'>이름: ${i.name}</span>	
					<span class='phone'>연락처: ${i.phone}</span>	
					<span class='email1'>
						<a href='#' onclick="send('${i.email}')">이메일: ${i.email}</a>
					</span><br/>
					<span class='rdate'>가입일: ${i.rdate}</span>	
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
	//ff.sec.value = 'view.jsp'; 어차피 서블릿에서 dispatcher로 값을 넘기기 때문에 필요 없다.
	ff.action = 'view.hta';
	ff.submit();
}

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