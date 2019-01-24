<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>TEST</title>
</head>
<body>
	<div align="center">
		<form action="checkLogin" method="post">
		<h1>教师登录</h1>
		<hr>
			<table>
				<tr>
					<td>用户名：</td>
					<td><input id="username" name="t_username" type="text"></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input id="password" name="t_password" type="password"></td>
				</tr>
			</table>
			<input type="submit" value="提交">
		</form>
	</div>
</body>


</html>