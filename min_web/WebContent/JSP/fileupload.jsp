<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>file upload</title>
</head>
<body>
<h3>파일 업로드</h3>
<form name='frm' method='post' enctype='multipart/form-data' action='fileupload_result.jsp'/>
				<!-- enctype은 getParameter로 값을 가져올 수 없다 -->
	<input type='text' name='id' value='kim m.j'/>
	<input type='file' name='file1'/>
	<p/>
	
	<input type='submit' value='파일전송'/>
</form>


</body>
</html>