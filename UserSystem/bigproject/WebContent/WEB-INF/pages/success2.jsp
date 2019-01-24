<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<input value="${sessionScope.teacher.gid}" style="visibility: hidden;" id="gid">
	<div>
		<h1>Welcome, ${sessionScope.teacher.t_name} Teacher</h1>
	</div>
	<h4>选择操作</h4>
	<div>
		<a href="updateT">信息修改</a>&emsp;<a href="registS">学生录入</a>&emsp;<a
			href="registT" style="visibility: hidden;" id="registT">教师录入</a>
	</div>

	<form action="outLogin" method="post">
		<input type="submit" value="登出">
	</form>
</body>
<script type="text/javascript">
</script>
</html>