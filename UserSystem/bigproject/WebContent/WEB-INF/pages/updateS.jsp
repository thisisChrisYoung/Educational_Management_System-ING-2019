<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>UPDATE INFORMATION</title>
<style type="text/css">
a {
	text-decoration: none;
	color: #FFB90F;
	font-weight: bold;
	font-family: Microsoft YaHei;
}

a:hover {
	color: #FF7F24;
}

a:active {
	color: #FFDEAD;
}
</style>
</head>
<body>
	<h1>信息修改</h1>
	<hr>
	<div>
		<form action="doUpdate" method="post" onsubmit="return checkSubmit()">
			<table>
				<tr>
					<td>学号：</td>
					<td><input type="text" name="sid" id="sid"
						value="${sessionScope.student.sid}" readonly="readonly"></td>
				</tr>
				<tr>
					<td>账号：</td>
					<td><input type="text" name="s_username" id="user"
						onkeyup="checkUser()" value="${sessionScope.student.s_username}"
						readonly="readonly"><span id="s2"></span></td>
				</tr>
				<tr>
					<td>修改密码：</td>
					<td><a href="updateSPW">点击修改</a></td>
				</tr>
				<tr>
					<td>姓名：</td>
					<td><input type="text" name="s_name" id="name"
						onkeyup="checkName()" value="${sessionScope.student.s_name}"
						readonly="readonly"><span id="s1"></span></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td><input type="radio" name="sex" id="sex" value="男">男&emsp;<input
						type="radio" name="sex" id="sex" value="女" checked="checked">女</td>
				</tr>
				<tr>
					<td>出生日期：</td>
					<td><input type="date" name="birthday" id="birthday"
						value="${sessionScope.student.birthday}"></td>
				</tr>
				<tr>
					<td>联系电话：</td>
					<td><input type="text" name="s_phone" id="mobile"
						onkeyup="checkMobile()" value="${sessionScope.student.s_phone}"><span
						id="s5"></span></td>
				</tr>
			</table>
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
		var check = checkName() && checkUser() && checkMobile();
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