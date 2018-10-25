<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>score3_result</title>
</head>
<body>
<%
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	if (kor<0 || kor>100){
	//	RequestDispatcher dispatcher = request.getRequestDispatcher("score3.jsp");
		request.setAttribute("msgKor", "점수의 범위가 1~100사이를 벗어났습니다.");
	//	dispatcher.forward(request, response);
	}
// 	else if (request.getParameter("kor").trim().equals("")){
// 		request.setAttribute("msgKor", "점수를 입력해주세요.");
// 	}

	if (eng<0 || eng>100){
	//	RequestDispatcher dispatcher = request.getRequestDispatcher("score3.jsp");
		request.setAttribute("msgEng", "점수의 범위가 1~100사이를 벗어났습니다.");
	//	dispatcher.forward(request, response);
	}
// 	else if (request.getParameter("eng").trim().equals("")){
// 		request.setAttribute("msgEng", "점수를 입력해주세요.");
// 	}
	
	if (mat<0 || mat>100){
	//	RequestDispatcher dispatcher = request.getRequestDispatcher("score3.jsp");
		request.setAttribute("msgMat", "점수의 범위가 1~100사이를 벗어났습니다.");
	//	dispatcher.forward(request, response);
	}
// 	else if (request.getParameter("mat").trim().equals("")){
// 		request.setAttribute("msgMat", "점수를 입력해주세요.");
// 	}
	
	int tot = kor + eng + mat;
	double avg = tot / 3.0;
	out.print("<li> 국어: " + kor);
	out.print("<li> 영어: " + eng);
	out.print("<li> 수학: " + mat);
	out.print("<li> 총점: " + tot);
	out.print("<li> 평균: " + avg);
%>

</body>
</html>