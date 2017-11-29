<%@page import="Bean.StudentBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
<style>
*{
		margin: 0;
		padding: 0;
	}
	header{
		width:1000px;
		background-color: red;
		height: 150px;
		color:yellow;
	}
	#section{
		width:200px;
		height:400px;
		background-color: yellow;
		float: left;
		text-align: center;
	}
	#footer{
		background-color: blue;
		width:1000px;
		
		margin-top: 400px;
	}
	#aside01{
		float: left;
		width:800px;
		height:400px;
		background-color: white;
		text-align: center;
		
	}

	#button{
	text-align: center;
	}
	#err0{
	color:red;
	}
	
	table{border-top:1pt solid #C1DAD7;border-left:1pt solid #C1DAD7;margin: 0 auto;} 
	td{ padding:5px 10px; text-align:center;border-right:1pt solid #C1DAD7;border-bottom:1pt solid #C1DAD7;}
	tr:nth-of-type(odd){ background:#F5FAFA;} 
	tr:hover{ background: #E0F0F0;} 
</style>

</head>
<body>
	<header><div id="text"><img src="/07/image/01.jpg" width="50" height="50"/></div><jsp:include page="../addone.jsp"></jsp:include></header>
	<div id="section">
		<div id="text01"><a href="PickingCourse.jsp">选择课程</a></div>
		<div id="text02"><a href="getCourse.jsp">已选课程</a></div>
		<div id="text03"><a href="Information.jsp">个人信息</a></div>
		
	</div>
	
	<div id="aside01">
		
		<jsp:useBean id="stubpo" class="Bpo.StudentBpo"/>
		<%-- <%
		String stuid = (String)session.getAttribute("username");
		StudentBean stu = stubpo.get(stuid);
		
		%>
		<table width='800' border='0' cellspacing='0' cellpadding='0' align='center'>
			<tr><td>学号</td><td><%=stu.getStuid() %></td></tr>
			<tr><td>学生名</td><td><%=stu.getSname() %></td></tr>
			<tr><td>性别</td><td><%=stu.getSex() %></td></tr>
			<tr><td>年龄</td><td><%=stu.getAge() %></td></tr>
			<tr><td>生日</td><td><%=stu.getBirthday() %></td></tr>
			<tr><td>班级信息</td><td><%=stu.getClassname() %></td></tr>
		</table> --%>
		
		<c:set var="stuid" value="${sessionScope.username }"/>
		<c:set var="stu" value="${stubpo.get(stuid) }"/>
		<table width='800' border='0' cellspacing='0' cellpadding='0' align='center'>
			<tr><td>学号</td><td><c:out value="${stu.stuid }" /></td></tr>
			<tr><td>学生名</td><td><c:out value="${stu.getSname() }" /></td></tr>
			<tr><td>性别</td><td><c:out value="${stu.getSex() }" /></td></tr>
			<tr><td>年龄</td><td><c:out value="${stu.getAge() }" /></td></tr>
			<tr><td>生日</td><td><c:out value="${stu.getBirthday() }" /></td></tr>
			<tr><td>班级信息</td><td><c:out value="${stu.getClassname() }"/></td></tr>
		</table>
		
		
	</div>
	
	<div id="footer">版权信息：<%="山东建筑大学" %>&nbsp;&nbsp;联系邮箱：<%="1719749848@qq.com" %></div>
	
	
</body>
</html>