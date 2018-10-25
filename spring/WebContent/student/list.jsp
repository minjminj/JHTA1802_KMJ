<%@page import="bean.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	$('#list #btn').click(function(){
		var param = $('#frm').serialize();
		var url = 'list.std';
		
		$('#content').load(url, param);
	});
});

$(function(){
	$('#list #btn_insert').click(function(){
		var param = $('#frm').serialize();
		var url = './student/insert.jsp';
		
		$('#content').load(url, param);
	});
});

function movePage(nowPage){
	document.frm.np.value = nowPage;
	alert(document.frm.np.value);
	var page = 'list.std';
	var param= $('#frm').serialize();
	$('#content').load(page, param);
	
}

function view(id){
	document.frm.id.value = id;
	var page = 'view.std';
	var param= $('#frm').serialize();
	$('#content').load(page, param);
	
}

function mail(mail){
	$('#list #email').val(mail);
	var page = './mail/mail.jsp';
	var param= $('#frm').serialize();
	$('#content').load(page, param);
	
}
</script>
</head>
<body>
<div id='list'>
	<h3>Student List(by id, name, email)</h3>
	<%	
		if (request.getParameter("np") != null){
			int nowPage = Integer.parseInt(request.getParameter("np"));
		}
	%>
	<form name='frm' id='frm' method='post'>
		<input type='text' name='findStr' value='${param.findStr}'/>
		<input type='button' id='btn' value="검색" class='btn'/>
		<input type='text' name='np' id='np' value='${param.nowPage }'/>
		<input type='hidden' name='id'/>
		<input type='hidden' name='email' id='email'/>
	</form>
	
	<h3>Result</h3>
	<div id='result'>
	
		<div id='student_list'>
			<span class='id'> 아이디 </span>
			<span class='name'> 이름 </span>
			<span class='phone'> 연락처 </span>
			<span class='email'> 이메일 </span>
			<span class='send'></span>
		</div>
		<c:forEach var='b' items='${list}'>
		<div class='student_list'>
			<span class='id'    onclick='view("${b.id }")'>${b.id }</span>
			<span class='name'  onclick='view("${b.id }")'>${b.name }</span>
			<span class='phone' onclick='view("${b.id }")'>${b.phone }</span>
			<span class='email' onclick='view("${b.id }")'>${b.email }</span>
			<span class='send'  onclick='mail("${b.email}")'><img src='./img/mail.JPG' height='10px' width='15px'/></span>
		</div>
		</c:forEach>
		<input type='button' id='btn_insert' value='회원가입' class='btn'/>
		<p/>
	</div>
	
	<div class='row'>
		<!-- 페이지 이동을 위한 버튼 -->
		<c:if test='${dao.nowBlock > 1 }'>
			<input type='button' value='&lt&lt' onclick='movePage(1)' class='btn'/>
			<input type='button' value='&lt' onclick='movePage(${dao.startPage} - 1)' class='btn'/>
		</c:if>
		
		<c:forEach var='k' begin='${dao.startPage }' end='${dao.endPage }'>
			<c:choose>
			<c:when test='${dao.nowPage == k }'>
				<input type='button' value='${k}' onclick='movePage(${k})' class='btn np'/>
			</c:when>
			<c:otherwise>
				<input type='button' value='${k}' onclick='movePage(${k})' class='btn'/>
			</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test='${dao.nowBlock < dao.totBlock}'>
			<input type='button' value='&gt' onclick='movePage(${dao.endPage} + 1)'  class='btn'/>
			<input type='button' value='&gt&gt' onclick='movePage(${dao.totPage})' class='btn'/>
	 	</c:if>
	</div>
</div>
</body>
</html>
