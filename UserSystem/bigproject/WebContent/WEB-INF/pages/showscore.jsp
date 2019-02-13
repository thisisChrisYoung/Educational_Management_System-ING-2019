<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<table border="1">
			<tr>
				<th>课程名</th>
				<th>成绩</th>
			</tr>
			<c:forEach items="${listScore}" var="score">
				<tr>
					<td>${score.course_name }</td>
					<td>${score.course_score }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<%-- ${listScore} --%>
</body>
</html>