<%@page import="bean.BoardVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#list #board_list{
    border-bottom: 1px solid lightblue;
    background-color: lightblue;
    width: 965px;
    margin: 15px auto;
}

#list .board_list{
    border-bottom: 1px solid lightblue;
    width: 965px;
    margin: 15px auto;
}

#list .board_list:hover{
	cursor: pointer;
	background-color: lightblue;
}

#list .serial{
	display: inline-block;
	width: 65px;
	text-align: center;
}
#list .subject{
	display: inline-block;
	width: 150px;
	text-align: center;
}
#list .doc{
	display: inline-block;
	width: 600px;
	text-align: center;
}
#list .id{
	display: inline-block;
	width: 70px;
	text-align: center;
}

</style>
<script>
$(function(){
	$('#list #btn').click(function(){
		var param = $('#frm').serialize();
		var url = './board/list.jsp';
		
		$('#content').load(url, param);
	});
});

function movePage(nowPage){
	document.frm.np.value = nowPage;
	var page = './board/list.jsp';
	var param= $('#frm').serialize();
	$('#content').load(page, param);
	
}

function view(sl){
	document.frm.sl.value = sl;
	var page = './board/view.jsp';
	var param= $('#frm').serialize();
	$('#content').load(page, param);
	
}
</script>
</head>
<body>
<div id='list'>
<%	
		String findStr = "";
		int np = 1 ;
		BoardDao dao = new BoardDao();
		request.setAttribute("d", dao);
		
		if (request.getParameter("findStr") != null){
			findStr = request.getParameter("findStr");
		}
		if (request.getParameter("np") != null){
			np = Integer.parseInt(request.getParameter("np"));
			dao.setNowPage(np);
		}
		
		List<BoardVo> list = dao.select(findStr);
		request.setAttribute("list", list);
		if (list == null){out.print("데이터가 없습니다.");}
%>

	<h3>Board List(by id, subject, doc)</h3>
	<form name='frm' id='frm' method='post'>
		<input type='text' name='findStr' value='${param.findStr}'/>
		<input type='button' id='btn' value="FIND"/>
		<input type='hidden' name='np' id='np' value='${d.nowPage }'/>
		<input type='hidden' name='sl' id='sl'/>
	</form>
	<h3>Result</h3>
	<div id='result'>
	
		<div id='board_list'>
			<span class='serial'> 글번호 </span>
			<span class='subject'> 제목 </span>
			<span class='doc'> 내용 </span>
			<span class='id'> 작성자 </span>
		</div>
		<c:forEach var='b' items='${list}'>
		<div class='board_list' onclick="view('${b.serial}')"  >
			<span class='serial'>${b.serial }</span>
			<span class='subject'>${b.subject }</span>
			<span class='doc'>${b.doc }</span>
			<span class='id'>${b.id }</span>
		</div>
		</c:forEach>
	</div>
	
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
</body>
</html>