<%@page import="java.util.ArrayList"%>
<%@page import="bean.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>vo, array, collection에 데이터 저장 후 el로 출력</h3>
<%
MemberVo v = new MemberVo();
v.setId("a001");
v.setName("홍길동");
v.setAr("서울 종로구");

request.setAttribute("v", v);
/* -------------------------------*/

String[] hobby = {"축구", "배구", "농구", "탁구", "족구"};
request.setAttribute("hobby", hobby);

ArrayList<String> mnt = new ArrayList<String>();
mnt.add("한라산");
mnt.add("백두산");
mnt.add("설악산");
pageContext.setAttribute("mnt", mnt);

/* -------------------------------*/
ArrayList<MemberVo> list = new ArrayList<MemberVo>();
v = new MemberVo();
v.setId("b001");
v.setName("kim");
list.add(v);

v.setId("c001");
v.setName("hong");
list.add(v);

v.setId("d001");
v.setName("choi");
list.add(v);

pageContext.setAttribute("list", list);

%>


<ol>
	<li>ID: ${v.id }</li>
	<li>Name: ${v.name }</li>
	<li>Address: ${v.ar }</li>
</ol><hr/>
<p>당신의 취미는 ${hobby[1]}, ${hobby[2] }, ${hobby[3] }, ${hobby[4] }를 가지고 있군요.
${Arrays.toString(hobby) }

<hr/>

<ol>
	<li>${mnt[0] }</li>
	<li>${mnt[1] }</li>
	<li>${mnt[2] }</li>
</ol>
<hr/>
<ol>
	<li>${list[0].id} [${list[0].name}]</li>
	<li>${list[1].id} [${list[1].name}]</li>
	<li>${list[2].id} [${list[2].name}]</li>
</ol>
</body>
</html>