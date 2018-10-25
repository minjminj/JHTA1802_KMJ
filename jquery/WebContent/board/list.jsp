<%@page import="bean.BoardVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board의 list</title>
<style type="text/css">
	
.row1{
		display: inline-block;
		margin-top: 10px;
/*    		margin-left: 60px; */
   		padding-left: 10px;
    	padding-right: 10px;
    	border-bottom: 0.5px solid #C2A99B;
}

.row2{
		display: inline-block;
		margin-top: 10px;
/*    		margin-left: 60px; */
   		padding-left: 10px;
    	padding-right: 10px;
    	border-bottom: 0.5px solid #C2A99B;
    	background: #c2a95f;
}
	
.row1:hover, .row1_re:hover {
	background: #c2a95f;
}

.row1_re {
	box-sizing: border-box;
	margin-left: 40px;
	margin-top: 10px;
	font-size: 14px;
	border-bottom: 0.5px solid #C2A99B;
    width: 700.24px;
	
}

.findStr {
	text-align: right;
	margin-right: 10px;
}

#list .btn {
	text-
}

.serial {
	display: inline-block;
	width: 20px;
	text-align: center;
}

.image11{
	display: inline-block;
	width: 75px;
	text-align: center;		
}


.id11 {
	display: inline-block;
	width: 150px;
	text-align: center;		
}

.name11 {
	display: inline-block;
	width: 80px;
	text-align: center;	
}


.subject {
	display: inline-block;
	width: 250px;
	text-align: center;	
}

.mdate {
	display: inline-block;
	width: 150px;
	text-align: center;	
}

.hit {
	display: inline-block;
	width: 50px;
	text-align: center;	
}
	
/* 	.row1_re > .id11 { */
/* 		width: 97px; */
/* 	} */
	
/* 	.row1_re > .mdate { */
/* 		width: 97px; */
/* 	} */
	
/* 	.row1_re > .hit { */
/* 		width: 104px; */
/* 	}  */
	
.serial > a {
	text-decoration: none;
	color: black;
}

.row {
	text-align: center;
}
	
</style>
</head>
<body>
<h3 class='title animated slideInLeft'>List Of Board</h3>

<div class='list'>
<%
	BoardDao dao = new BoardDao();
	String findStr = request.getParameter("findStr");
	if (findStr == null) findStr = "";
	int np = 1;
	if (request.getParameter("nowPage") != null ) np = Integer.parseInt(request.getParameter("nowPage"));
	dao.setNowPage(np);
	List <BoardVo> list = dao.select(findStr);
	request.setAttribute("vo", list);
	request.setAttribute("d", dao);
	request.setAttribute("findStr", findStr);
	
%>
	
	<div class='findStr'>
		<form name='fff' id='fff' method='POST'>
			<input type='text' name='findStr' value='${findStr }'/>
			<input type='button' name='btnFind' value='Search' id='btnFind' class='btn'/><br/><br/>
			<input type='hidden' name='serial'/>
			<input type='hidden' name='nowPage' value='${d.nowPage}'/>
		</form>
	</div>
	
	
		<div id='listmenu' class='row2  animated fadeIn'>
			<span class='serial'>NO</span>
			<span class='image11'>포토</span>
			<span class='id11'>아이디</span>
			<span class='subject'>제목</span>
			<span class='mdate'>작성일자</span>
			<span class='hit'>조회수</span>
		</div>
		
	<div id='findResult'>
		
		<c:forEach var='i' items='${vo }'>
				<c:set var='subject' value='${i.subject}'/>
				<c:choose>
				<c:when test="${fn:contains(subject, 'Re')}">
					<div class='row1_re' onclick="view('${i.serial }')">
						<span class='serial'>
							<a href='#' style='font-size:10px'>ㄴRE</a>
						</span>
						<span class='image11'><img src='./upload/${i.attFile }' width='50px' height='50px'/></span>
						<span class='id11'>${i.id}</span>	
						<span class='subject'>${i.subject}</span>	
						<span class='mdate'>${i.mdate}</span>	
						<span class='hit'></span>	
					</div>
				</c:when>
				<c:otherwise>
					<div class='row1' onclick="view('${i.serial }')">
						<span class='serial'>
							<a href='#'>${i.serial }</a>
						</span>
						<span class='image11'><img src='./upload/${i.attFile }' width='70px' height='70px'/></span>
						<span class='id11'>${i.id}</span>	
						<span class='subject'>${i.subject}</span>	
						<span class='mdate'>${i.mdate}</span>	
						<span class='hit'>${i.hit}</span>	
					</div>
				</c:otherwise>
				</c:choose>
		</c:forEach>
		</div><p/>
	
		<input type ='button' value='Write' id='btnRegister' class='btn'>
		<div class='row'>
		<!-- 페이지 이동을 위한 버튼 -->
		<c:if test='${d.nowBlock > 1 }'>
			<input type='button' value='&lt&lt' onclick='movePage(1)' class='btn'/>
			<input type='button' value='&lt' onclick='movePage(${d.startPage} - 1)' class='btn'/>
		</c:if>
		
		<c:forEach var='k' begin='${d.startPage }' end='${d.endPage }'>
			<c:choose>
			<c:when test='${d.nowPage == k }'>
				<input type='button' value='${k}' onclick='movePage(${k})' class='btn np'/>
			</c:when>
			<c:otherwise>
				<input type='button' value='${k}' onclick='movePage(${k})' class='btn'/>
			</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test='${d.nowBlock < d.totBlock}'>
			<input type='button' value='&gt' onclick='movePage(${d.endPage} + 1)'  class='btn'/>
			<input type='button' value='&gt&gt' onclick='movePage(${d.totPage})' class='btn'/>
	 	</c:if>
	</div>
</div>
<script>

$(function(){
	$('.list #btnRegister').click(function(){
		var page = './board/register.jsp';
		var param= $('#fff').serialize();
		$('#content').load(page, param);
	});
	
	$('.list #btnFind').click(function(){
		var page = './board/list.jsp';
 		var param = $('#fff').serialize();
 		$('#content').load(page, param);
	});
});

function view(serial){
	var ff= document.fff;
	ff.serial.value = serial;
	var page = './board/view.jsp';
	var param= $('#fff').serialize();
	$('#content').load(page, param);
	
}

function movePage(nowPage){
	var ff = document.fff;
	ff.nowPage.value = nowPage;
	var page = './board/list.jsp';
	var param= $('#fff').serialize();
	$('#content').load(page, param);
	
}
</script>
</body>
</html>