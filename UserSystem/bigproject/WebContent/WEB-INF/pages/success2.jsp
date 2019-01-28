<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>TEACHER</title>
</head>
<body>
	<div>
		<h1>Welcome, ${sessionScope.teacher.t_name} Teacher</h1>
	</div>
	<h4>选择操作</h4>
	<div>
		<a href="updateT">信息修改</a>&emsp;<a href="registS">学生录入</a>&emsp;<a
			href="registT" style="visibility:${sessionScope.teacher.gid lt 3 ? 'visible' : 'hidden'};" id="registT">教师录入</a>
	</div>
	<hr>
	<div align="center">
		<iframe src="showpage" style="width: 60%; height: 400px;"></iframe>
	</div>
	<hr>
	<form action="outLogin" method="post">
		<input type="submit" value="登出">
	</form>
</body>
<script type="text/javascript">
	
</script>
</html>