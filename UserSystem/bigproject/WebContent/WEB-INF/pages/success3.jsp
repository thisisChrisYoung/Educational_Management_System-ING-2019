<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div><h1>Welcome, ${sessionScope.student.s_name}同学</h1></div>
	This is success page!
	<div><a href="updateS">修改信息</a></div>
	<form action="outLogin" method="post">
		<input type="submit" value="登出">
	</form>
</body>
</html>