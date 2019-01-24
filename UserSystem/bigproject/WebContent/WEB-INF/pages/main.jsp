<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
h1 {
	text-align: center
}

.div1 {
	display: inline;
	width: 49%;
	margin: 5px;

}
a{
	text-decoration: none;
	color: #FFB90F;
	font-weight: bold;
	font-family: Microsoft YaHei;
}
a:hover{
	color: #FF7F24;
}
a:active{
	color: #FFDEAD;
}

</style>
</head>
<body>
	<h1>请选择你的身份</h1>
	
	<div class="div1" style="float: left;" align="right"><a href="student/login2">学生</a></div>
	<div class="div1" style="float: left;"><a href="teacher/login">老师</a></div>
</body>
</html>