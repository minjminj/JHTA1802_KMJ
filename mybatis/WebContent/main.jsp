<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div id='menu1'>
			<div id='sub1'>BEGIN</div>
			<div id='item1' class='item'>
				<ul>
					<li onclick='loadMenu("./begin/factory_test.jsp")'>begin</li>
					<li onclick='loadMenu("./begin/empList.jsp")'>EmpList(아이디)</li>
					<li onclick='loadMenu("./begin/empList2.jsp")'>EmpList2(이름,연락처)</li>
					<li onclick='loadMenu("./begin/emp_hire.jsp")'>Emp_Hire(입사년)</li>
					<li onclick='loadMenu("./begin/if.jsp")'>동적 if</li>
					<li onclick='loadMenu("./begin/where.jsp")'>동적 where</li>
					<li onclick='loadMenu("./begin/foreach.jsp")'>동적 foreach</li>
				</ul>
			</div>
		</div>
		<div id='menu2'>
			<div id='sub2'>BOARD</div>
			<div id='item2' class='item'>
				<ul>
					<li onclick='loadMenu("./board/insert.jsp")'>게시판입력</li>
					<li onclick='loadMenu("./board/list.jsp")'>게시판목록</li>
				</ul>
			</div>
		</div>

<script>
$(function(){
	var content;
	if(sessionStorage.getItem("content") != null){
		content = sessionStorage.getItem("content");
		loadMenu(content);
	}
});

function loadMenu(pageurl){
	$('#content').load(pageurl);
	sessionStorage.setItem("content", pageurl);
}

//item1은 숨겨져 있다가 sub1이 클릭되면 나타남
	$('#item1').hide();
	$('#sub1').click(function(){
		$('#item2').hide(400);
		$('#item1').slideToggle(500); 
		$('#item1 li').click(function(){
			$('.item').hide();
		});
	});
	
	// item2은 숨겨져 있다가 sub2이 클릭되면 나타남
	$('#item2').hide();
	$('#sub2').click(function(){
		$('#item1').hide(400);
		$('#item2').slideToggle(500);
		$('#item2 li').click(function(){
			$('.item').hide();
		});
	});
</script>
</body>
</html>