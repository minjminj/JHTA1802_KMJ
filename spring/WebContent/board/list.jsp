<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

</script>
</head>
<body>
<div id='b_list'>

	<h3>Board List(by id, subject, doc)</h3>
	<form name='frm' id='frm' method='post'>
		<input type='text' name='findStr' value='${param.findStr}'/>
		<input type='button' id='btn' value="FIND" class='btn'/>
		<input type='hidden' name='np' id='np' value='${np }'/>
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
		<input type='button' id='btnRegister' value='글등록' class='btn'/>
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