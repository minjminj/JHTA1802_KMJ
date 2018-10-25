<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>display</title>

<style>
	#box{
		display:none;
		/* 자리도 차지하지 않고 내용을 감춤 */
	}
	#box2{
		visibility:hidden;
		/* 자리는 차지하지만 내용을 감춤 */
	}
	
	#block>span, #inline>span, #inline-block>span{
		border:3px solid #D4D3CE;
		background-color:#FA8F14;
	}
	
	#block>span{		/* width와 height 지정한대로 크기 변화, 한줄에 한 요소씩 출력*/
		display: block;
		width: 100px; height:100px;
	}
	
	#inline>span{		/* width와 height 지정해도 변화 없음, inline이라 한줄에 모두 출력*/
		display: inline;
		width:100px; height:100px;
	}
	
	#inline-block>span{		/* width와 height 지정한대로 크기 변화, inline의 특성대로 한줄에 모두 출력*/
		display: inline-block;
		width:100px; height:100px;
	}
	
</style>
</head>
<body>
<h1>display</h1>
<span>첫번째줄</span>
<div id='box'>두번째줄</div>
<span>세번째줄</span>

<h1>visibility</h1>
<span>첫번째줄</span>
<div id='box2'>두번째줄</div>
<span>세번째줄</span>

<h1>display: block</h1>
<div id='block'>
	<span>AAAA</span>
	<span>BBBB</span>
	<span>CCCC</span>
</div>

<h1>display: inline</h1>
<div id='inline'>
	<span>AAAA</span>
	<span>BBBB</span>
	<span>CCCC</span>
</div>
<h1>display: inline-block</h1>
<div id='inline-block'>
	<span>AAAA</span>
	<span>BBBB</span>
	<span>CCCC</span>
</body>
</html>