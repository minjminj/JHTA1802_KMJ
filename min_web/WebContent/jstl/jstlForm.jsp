<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jstlForm</title>
</head>
<body>
<h4>성명, 국어, 영어 점수를 입력받아 성명, 국어, 영어, 총점, 평균을 계산하여 
c:set/>을 사용하여 각각의 항목을 변수에 저장 한 후 el과 c:out/>을 사용하여 출력</h4>

	<form name='frm' method='post'>
	<label>성명</label> 
	<input type='text' name='irum'/>
	
	<label>국어</label>
	<input type='text' name='kor'/>
	
	<label>영어</label>
	<input type='text' name='eng'/> 
	
	<input type='submit' value='여기 성적' name='btn'/>
	</form>
<p/>



<div>EL</div>
<ul>
	<li>성명: ${param.irum }</li>
	<li>국어: ${param.kor }</li>
	<li>영어: ${param.eng }</li>
	<li>총점: ${param.eng + param.kor}</li>
	<li>평균: ${(param.kor + param.eng)/2 }</li>
</ul>

<p/>
<div>c태그</div>
<c:set var='nn' value='${param.irum }'/>
<c:set var='kk' value='${param.kor }'/>
<c:set var='ee' value='${param.eng }'/>
<c:set var='tt' value='${param.eng + param.kor}'/>
<c:set var='aa' value='${tt/2 }'/>

<ul>
	<li>성명: <c:out value='${nn } '/></li>
	<li>국어: <c:out value='${kk } '/></li>
	<li>영어: <c:out value='${ee } '/></li>
	<li>총점: <c:out value='${tt } '/></li>
	<li>평균: <c:out value='${aa } '/></li>
</ul>
</body>
</html>