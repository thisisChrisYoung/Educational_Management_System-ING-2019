<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>Welcome, ${sessionScope.teacher.t_name}</h1>
	</div>
	This is success page!
	<div>
		<h4>选择操作</h4>
		<div>
			<a href="updateT">教师信息修改</a>&emsp;<a href="registS">学生录入</a>&emsp;<a
				href="registT" id="registT">教师录入</a>
		</div>
	</div>
	<form action="outLogin" method="post">
		<input type="submit" value="登出">
	</form>
</body>
</html>