<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">

<title>Insert title here</title>
</head>
<body>

<form action="multi-file" method="post" enctype="multipart/form-data">
	파일 : <input type="file" name="multiFile" multiple><br>
	파일 설명 : <input type="text" name="fileContent"><br>
	<button type="submit">Submit</button>
</form>

</body>
</html>