<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>STUDENT PASSWORD UPDATE</title>
</head>
<body>
	<div>
		<h1>修改密码</h1>
		<hr>
		<div>
			<form action="doUpdatePW" method="post"
				onsubmit="return checkSubmit()">
				<table>
					<tr>
						<td>旧密码：</td>
						<td><input type="password" id="oldpassword" name="t_password"
							onkeyup="checkPWTrue2()"><span id="s1"></span></td>
							<td><input type="password" id="oldpassword2"
							name="s_password" style="visibility: hidden"
							value="${sessionScope.teacher.t_password}"></td>
					</tr>
					<tr>
						<td>新密码：</td>
						<td><input type="password" id="password" name="t_password"
							onkeyup="checkPassword()"><span id="s2"></span></td>
					</tr>
					<tr>
						<td>确认密码：</td>
						<td><input type="password" id="password2" name="t_password2"
							onkeyup="checkPWTrue()"><span id="s3"></span></td>
					</tr>
				</table>
				<input type="submit" value="提交">
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">

	function checkPWTrue2() {//确认旧密码
		var check = false;
		var oldpassword2 = document.getElementById("oldpassword2").value;
		oldpassword = document.getElementById("oldpassword").value;
		if (!oldpassword) {
			document.getElementById("s1").innerHTML = "❌请输入旧密码";
			check = false;
		} else if (ol2dpassword2 == oldpassword) {
			document.getElementById("s1").innerHTML = "✔";
			check = true;
		} else {
			document.getElementById("s1").innerHTML = "❌";
			check = false;
		}
		return check;
	}
	function checkPassword() {//验证密码
		var check = false;
		password = document.getElementById("password").value;
		var re = /^[a-zA-Z0-9]{6,16}$/;
		if (!password) {
			document.getElementById("s2").innerHTML = "❌请输入密码";
			check = false;
		} else if (!re.test(password)) {
			document.getElementById("s2").innerHTML = "❌";
			check = false;
		} else {
			document.getElementById("s2").innerHTML = "✔";
			check = true;
		}
		return check;
	}

	function checkPWTrue() {//确认密码
		var check = false;
		var password2 = document.getElementById("password2").value;
		password = document.getElementById("password").value;
		if (!password2) {
			document.getElementById("s3").innerHTML = "❌请确认密码";
			check = false;
		} else if (password == password2) {
			document.getElementById("s3").innerHTML = "✔";
			check = true;
		} else {
			document.getElementById("s3").innerHTML = "❌";
			check = false;
		}
		return check;
	}

	function checkSubmit() {
		var check = checkPassword() && checkPWTrue() && checkPWTrue2();
		if (!check) {
			alert("信息有误");
			check = false;
		} else {
			check = true;
		}
		return check;
	}
</script>
</html>