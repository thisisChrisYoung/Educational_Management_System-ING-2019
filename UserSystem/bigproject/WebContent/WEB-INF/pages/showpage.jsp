<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	<span>学生姓名：</span><input type="text" id="studentname"><input type="button" id="btn3" value="查询">
		<table border="1">
			<tr>
				<th>学生编号</th>
				<th>学生姓名</th>
				<th>性别</th>
				<th>生日</th>
				<th>联系电话</th>
				<th>任课老师</th>
			</tr>
			<c:forEach items="${pInfo.list }" var="stu">
				<tr>
					<td>${stu.sid }</td>
					<td>${stu.s_name }</td>
					<td>${stu.sex }</td>
					<td><fmt:formatDate value="${stu.birthday}" pattern="yyyy-MM-dd" /></td>
					<td>${stu.s_phone }</td>
					<td>${stu.teacher.t_name }</td>
				</tr>
			</c:forEach>
		</table>
		<input type="button" id="btn1" value="上一页">&emsp;<input type="button" id="btn2" value="下一页">
	</div>
</body>
<script type="text/javascript">
pageSize = "${pInfo.pageSize}";
pageNumber = "${pInfo.pageNumber}";
t_name = "${sessionScope.teacher.t_name}";
s_name = "${pInfo.s_name}";
total = ${pInfo.total};

var clickBtn1 = document.getElementById('btn1');
clickBtn1.onclick = function() {
	pageNumber = parseInt(pageNumber)-1;
	 if(pageNumber>=1){
			location.href="showpage?pageSize="+pageSize+"&pageNumber="+pageNumber+"&t_name"+t_name;
		}else{
			pageNumber=1;
		}
		return false; 
};
	
var clickBtn2 = document.getElementById('btn2');
clickBtn2.onclick = function() {
	pageNumber = parseInt(pageNumber)+1;
	if(pageNumber<=total){
			location.href="showpage?pageSize="+pageSize+"&pageNumber="+pageNumber+"&t_name"+t_name;
		}else{
			pageNumber=total;
		}
		return false;
};

var clickBtn3 = document.getElementById('btn3');
clickBtn3.onclick = function(){
	location.href="showpage?pageSize="+pageSize+"&pageNumber=1&t_name"+t_name;
}
</script>
</html>