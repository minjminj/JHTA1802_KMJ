<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='manipulation'>
	<h3>manipulation</h3>
	<div id='info'>
		특정 요소에 또 다른 특정 요소를 추가하거나 삭제하는 기능.
		<ul>
			<li>wrap()</li>
			<li>append() | prepend()</li>
			<li>before() | after()</li>
			<li>remove()</li>
			<li>empty()</li>
		</ul>
	</div>

	<span id='wrap_target'>wrap_target</span><br/>
	<span id='append_target'>append_target</span><br/>
	<span id='prepend_target'>prepend_target</span><br/>
	<span id='before_target'>[before_target]</span><br/>
	<span id='after_target'>[after_target]</span><br/>
	<div id='remove_target'>remove_target<br/></div>
	<div id='empty_target'>empty_target</div><br/>
	<hr/>
	<p/>
	<input type='button' value='Wrap' 	 id='btnWrap'	 class='btn'/>
	<input type='button' value='Append'  id='btnAppend'  class='btn'/>
	<input type='button' value='Prepend' id='btnPrepend' class='btn'/>
	<input type='button' value='Before'  id='btnBefore'  class='btn'/>
	<input type='button' value='After' 	 id='btnAfter'   class='btn'/>
	<input type='button' value='Remove'  id='btnRemove'  class='btn'/>
	<input type='button' value='Empty' 	 id='btnEmpty'   class='btn'/>
</div>

<script>
var str = "<font color='red'>내가 너를 감싸주마</font>";
var div = "<font color='blue'>제가 꿔다논 보릿자루!</font>"

// str요소안에 #wrap_target 내용이 들어가 감싸준다.
$('#btnWrap').click(function(){
	$('#wrap_target').wrap(str);
});
$('#btnAppend').click(function(){
	$('#append_target').append(div);
});
$('#btnPrepend').click(function(){
	$('#prepend_target').prepend(div);
});
$('#btnBefore').click(function(){
	$('#before_target').before(div);
});
$('#btnAfter').click(function(){
	$('#after_target').after(div);
});
$('#btnRemove').click(function(){
	$('#remove_target').remove();
});
$('#btnEmpty').click(function(){
	$('#empty_target').empty();
	
});
</script>
</body>
</html>