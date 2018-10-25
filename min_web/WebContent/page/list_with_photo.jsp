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
<title>servlet list22222222222</title>
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
		dispaly: inline-block;
		width: 300px;
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
		width: 150px;
		text-align: left;	
	}
	
	.email1 {
		display: block;
		width: 200px;
		text-align: left;	
	}
	
	.rdate1 {
		display: block;
		width: 140px;
		text-align: left;	
	}
	
</style>
</head>

<body>


<div id='list'>
	<h3 id='findmem' class='animated slideInLeft'>회원 조회</h3>
	
	<div id='findStr'>
		<form name='fff' method='POST' >
			<input type='text' name='findStr' value='${findStr }'/>
			<input type='submit' name='btnFind' value='검색' id='btnFind' /><br/><br/>
			<input type='hidden' name='nav' value="${param.nav }" />
			<input type='hidden' name='sec' value="${param.sec }" />
			<input type='hidden' name='id'/>
			<input type='hidden' name='nowPage' value='${d.nowPage }'/>
		</form>
	</div>
		
		<div id='findResult'>
		<c:forEach var='i' items='${vo }'>
			
				<div class='row1'>
					<span class='id1'>
						<a href='#' onclick="go('${i.id}')">아이디: ${i.id}</a>
					</span>	
					<span class='name1'>이름: ${i.name}</span>	
					<span class='phone1'>연락처: ${i.phone}</span>	
					<span class='email1'>이메일: ${i.email}</span>	
					<span class='rdate1'>가입일: ${i.rdate}</span><p/>	
					<span><img src='../upload/${i.photO }'/></span>
				</div>
				
				
		</c:forEach>
		
		</div><p/>
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

function movePage(nowPage){
	var ff = document.fff;
	
	ff.nowPage.value = nowPage;
	ff.submit();
}
</script>
</body>
</html>