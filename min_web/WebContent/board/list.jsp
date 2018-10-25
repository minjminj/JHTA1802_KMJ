<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board의 list</title>
<style type="text/css">
	
.row1{
		
		display: inline-block;
		margin-top: 10px;
   		margin-left: 60px;
   		padding-left: 10px;
    	padding-right: 10px;
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
	
	.serial > a {
		text-decoration: none;
		color: black;
	}
	
</style>
</head>
<body>
<h3 class='title animated slideInLeft'>List Of Board</h3>

<div class='list'>
	
	<div class='findStr'>
		<form name='fff' method='POST' action='list.do' >
			<input type='text' name='findStr' value='${findStr }'/>
			<input type='submit' name='btnFind' value='검색' id='btnFind' /><br/><br/>
			<input type='hidden' name='nav' value="${param.nav }" />
			<input type='hidden' name='sec' value="${param.sec }" />
			<input type='hidden' name='serial'/>
			<input type='hidden' name='nowPage' value='${d.nowPage }'/>
		</form>
	</div>
	
	
		<div id='listmenu' class='row1  animated fadeIn'>
			<span class='serial'>NO</span>
			<span class='image11'>포토</span>
			<span class='id11'>아이디</span>
			<span class='subject'>제목</span>
			<span class='mdate'>작성일자</span>
			<span class='hit'>조회수</span>
		</div>
		
	<div id='findResult'>
		
		<c:forEach var='i' items='${vo }'>
			
				<div class='row1'>
					<span class='serial'>
						<a href='#' onclick="view('${i.serial }')">${i.serial }</a>
					</span>
					<span class='image11'><img src='../upload/${i.attFile }' width='70px' height='70px'/></span>
					<span class='id11'>${i.id}</span>	
					<span class='subject'>${i.subject}</span>	
					<span class='mdate'>${i.mdate}</span>	
					<span class='hit'>${i.hit}</span>	
				</div>
		</c:forEach>
		</div><p/>
	
		<input type ='button' value='Write' onclick='go()' class='btn'>
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
function view(serial) {
	var ff = document.fff
	ff.serial.value = serial;
	ff.action = 'view.do';
	ff.submit();
}

function go() {
	var ff = document.fff
	ff.action = 'register.do';
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