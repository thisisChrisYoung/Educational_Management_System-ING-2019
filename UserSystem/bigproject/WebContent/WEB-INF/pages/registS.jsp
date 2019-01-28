<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>学生注册页面</h1>
	<hr>
	<div>
		<form action="doRegistS" method="post" onsubmit="return checkSubmit()">
			<table>
				<tr>
					<td>*账号：</td>
					<td><input type="text" name="s_username" id="user"
						onkeyup="checkUser()"><span id="s2"></span></td>
				</tr>
				<tr>
					<td>*密码：</td>
					<td><input type="password" name="s_password" id="password"
						onkeyup="checkPassword()"><span id="s3"></span></td>
				</tr>
				<tr>
					<td>*确认密码：</td>
					<td><input type="password" name="s_password2" id="password2"
						onkeyup="checkPWTrue()"><span id="s4"></span></td>
				</tr>
				<tr>
					<td>*姓名：</td>
					<td><input type="text" name="s_name" id="name"
						onkeyup="checkName()"><span id="s1"></span></td>
				</tr>
				<tr>
					<td>*性别：</td>
					<td><input type="radio" name="sex" id="sex" value="男">男&emsp;<input
						type="radio" name="sex" id="sex" value="女" checked="checked">女</td>
				</tr>
				<tr>
					<td>出生日期：</td>
					<td><input type="date" name="birthday" id="birthday"></td>
				</tr>
				<tr>
					<td>*联系电话：</td>
					<td><input type="text" name="s_phone" id="mobile"
						onkeyup="checkMobile()"><span id="s5"></span></td>
				</tr>
				<tr>
					<td>辅导员：</td>
					<td><input type="text" name="tid" id="tid"
						value="${sessionScope.teacher.tid}" readonly="readonly"></td>
				</tr>
			</table>
			<p style="font-size: 10px; color: red;">注：*号项为必填</p>
			<input type="submit" value="提交">
		</form>
		<form action="checkLogin" method="post">
			<input type="submit" value="返回">
		</form>
	</div>
</body>

<script type="text/javascript">
	function checkName() {//验证名字
		var check = false;
		var name = document.getElementById("name").value;
		var re = /^[\u4e00-\u9fa5]{2,4}$/;
		if (!name) {
			document.getElementById("s1").innerHTML = "❌请输入汉字";
			check = false;
		} else if (!re.test(name)) {
			document.getElementById("s1").innerHTML = "❌";
			check = false;
		} else {
			document.getElementById("s1").innerHTML = "✔";
			check = true;
		}
		return check;
	}

	function checkUser() {//验证账号
		var check = false;
		var user = document.getElementById("user").value;
		var re = /^[a-zA-z]\w{5,11}$/;
		if (!user) {
			document.getElementById("s2").innerHTML = "❌请输入账号";
			check = false;
		} else if (!re.test(user)) {
			document.getElementById("s2").innerHTML = "❌";
			check = false;
		} else {
			document.getElementById("s2").innerHTML = "✔";
			check = true;
		}
		return check;
	}

	function checkPassword() {//验证密码
		var check = false;
		password = document.getElementById("password").value;
		var re = /^[a-zA-Z0-9]{6,16}$/;
		if (!password) {
			document.getElementById("s3").innerHTML = "❌请输入密码";
			check = false;
		} else if (!re.test(password)) {
			document.getElementById("s3").innerHTML = "❌";
			check = false;
		} else {
			document.getElementById("s3").innerHTML = "✔";
			check = true;
		}
		return check;
	}

	function checkPWTrue() {//确认密码
		var check = false;
		var password2 = document.getElementById("password2").value;
		password = document.getElementById("password").value;
		if (!password2) {
			document.getElementById("s4").innerHTML = "❌请确认密码";
			check = false;
		} else if (password == password2) {
			document.getElementById("s4").innerHTML = "✔";
			check = true;
		} else {
			document.getElementById("s4").innerHTML = "❌";
			check = false;
		}
		return check;
	}

	function checkMobile() {//验证手机
		var check = false;
		var phone = document.getElementById("mobile").value;
		var re = /^[1][3,4,5,7,8]\d{9}$/;
		if (!phone) {
			document.getElementById("s5").innerHTML = "❌请输入号码";
			check = false;
		} else if (!re.test(phone)) {
			document.getElementById("s5").innerHTML = "❌";
			check = false;
		} else {
			document.getElementById("s5").innerHTML = "✔";
			check = true;
		}
		return check;
	}

	function checkSubmit() {
		var check = checkName() && checkUser() && checkPassword()
				&& checkPWTrue() && checkMobile();
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