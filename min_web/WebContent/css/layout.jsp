<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>layout</title>

<style>
	body {
		width: 960px;
		margin: 0 auto;
	}
	
	#wrap {
		overflow: hidden;
	}
	
	#aside {
		width: 200px;
		float: left;
	}
	
	#content {
		width: 760px;
		float: left;	
	}
</style>
</head>
<body>

<div id='header'>
	<h1>Header</h1>
</div>
<div id='navi'>
	<h1>Navigation</h1>
</div>
<div id='wrap'>
	<div id='aside'>
		<h2>Aside</h2>
		<p>
		많은 내용<br/>
		많은 내용<br/>
		많은 내용<br/>
		</p>
	</div>
	<div id='content'>
		<h2>Content</h2>
		<p>
		많은 내용 많은 내용 많은 내용 많은 내용 많은 내용 많은 내용 많은 내용 많은 내용<br/>
		많은 내용 많은 내용 많은 내용 많은 내용 많은 내용 많은 내용 많은 내용 많은 내용<br/>
		많은 내용 많은 내용 많은 내용 많은 내용 많은 내용 많은 내용 많은 내용 많은 내용<br/>
		</p>
	</div>
</div>
<div id='footet'>
	<h1>Footer</h1>
</div>

</body>
</html>