<%@page import="javax.imageio.ImageIO"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일전송결과</title>
</head>
<body>
<h3>파일 전송 결과</h3>
<%
String uploadDir = "C:/new_workspace/min_web/WebContent/upload/";
String encType = "utf-8";
int fileSize = 1024*1024*10; // 10Mb (1024*1024가 1메가)

// thumb nail과 관계된 변수들
// --------------------
ParameterBlock pb = null;
RenderedOp op = null;
BufferedImage bi = null;
BufferedImage thumb = null;
Graphics2D g = null;
File file = null;

try {
	MultipartRequest multi = new MultipartRequest(
			request, uploadDir, fileSize, encType, new DefaultFileRenamePolicy());

	// 입력값 출력(request.getParameter() --> multi로)
	out.print("<li>" + multi.getParameter("id"));
						// request.getParameter("id")의 기능과 같음.
	
	// file 태그명과 원본파일명, 연결된 파일명의 정보
	Enumeration tags = multi.getFileNames();
	while (tags.hasMoreElements()){
		String tag = (String)tags.nextElement();
		String fileName = multi.getOriginalFileName(tag);
		String reName = multi.getFilesystemName(tag);
		
		out.print("<li> Tag Name : " + tag);
		out.print("<li> 원본파일명 : "  + fileName);
		out.print("<li> 변경된 파일명: " + reName);
		
		//thumb nail 생성
		pb = new ParameterBlock();
		pb.add(uploadDir + reName);
		op = JAI.create("fileload", pb);
		
		bi = op.getAsBufferedImage();
		thumb = new BufferedImage(70,70, BufferedImage.TYPE_INT_RGB);
		
		g = thumb.createGraphics();
		g.drawImage(bi, 0, 0, 70, 70, null);
		
	
		file = new File(uploadDir + "sm_" + reName); // 썸네일 파일을 생성할때
		// 업로드 된 파일을 수정할때 기존 파일 지우는 logiccccc file.delete()
		String ext = reName.substring(reName.indexOf(".")+1);
		
		ImageIO.write(thumb,ext,file);
		
		System.gc();
	}
} catch (Exception ex){
	out.print(ex.toString() );
}
%>
</body>
</html>

