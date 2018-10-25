<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <style>
        .msg{
            margin-left:4px;
            font-size:11px;
            color:#ff0000;
        }
        </style>
    </head>
    <body>
    <%
    
    String kor = request.getParameter("kor");
    String mat = request.getParameter("mat");
    String eng = request.getParameter("eng");
        
    kor = (kor == null)? "":kor;
    mat = (mat == null)? "":mat;
    eng = (eng == null)? "":eng;
 
    String msgKor="", msgMat="", msgEng="";
    
    if(request.getAttribute("msgKor") != null){
        msgKor = (String)request.getAttribute("msgKor");
    }
    if(request.getAttribute("msgMat") != null){
        msgMat = (String)request.getAttribute("msgMat");
    }
    if(request.getAttribute("msgEng") != null){
        msgEng = (String)request.getAttribute("msgEng");
    }
    
    
    %>
        <h3>
            3개의 성적을 입력받아 총점, 평균, 학점을 구하여
            동일한 페이지에 출력하시오.
        </h3>
        <form name='frm' method='post' action='score3_result.jsp'>
            <label>국어</label>
            <input type='text' name='kor' value="<%=kor%>"/>
            <output class='msg'><%=msgKor %></output>
            <br/>
            
            <label>수학</label>
            <input type='text' name='mat' value="<%=mat%>"/>
            <output class='msg'><%=msgMat %></output>
            <br/>
            
            <label>영어</label>
            <input type='text' name='eng' value="<%=eng%>"/>
            <output class='msg'><%=msgEng %></output>
            <br/>
            
            <input type='submit' value='전송'/><br/>
        </form>
        
 
    </body>
</html>


