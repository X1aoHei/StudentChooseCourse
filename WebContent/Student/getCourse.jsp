<%@page import="Bean.StudentBean"%>
<%@ page import="java.util.List" %>
<%@page import="Bean.CourseBean" %>
<%@page import="Bpo.ScBpo" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>已选课程</title>
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
	table tr:first-child{background:#0066CC; color:#fff;font-weight:bold;} 
	table{border-top:1pt solid #C1DAD7;border-left:1pt solid #C1DAD7;margin: 0 auto;} 
	td{ padding:5px 10px; text-align:center;border-right:1pt solid #C1DAD7;border-bottom:1pt solid #C1DAD7;}
	tr:nth-of-type(odd){ background:#F5FAFA;} 
	tr:hover{ background: #E0F0F0;}
</style>
</head>
<body>
	<header><div id="text"><img src="/07/image/01.jpg" width="50" height="50"/></div><jsp:include page="../addone.jsp"></jsp:include></header>
	
	<div id="section">
		<div id="text01"><a href="/07/Student/PickingCourse.jsp">选择课程</a></div>
		<div id="text02"><a href="/07/Student/getCourse.jsp">已选课程</a></div>
		<div id="text03"><a href="/07/Student/Information.jsp">个人信息</a></div>
		
	</div>
	
	<div id="aside01">
		<table width='800' border='0' cellspacing='0' cellpadding='0' align='center'>
		<tr><td>课程号</td><td>课程名</td><td>学分</td><td>先修学号</td><td>当前选课人数</td></tr>
		
		<%-- <%
		String stuid = (String)session.getAttribute("username");
		List<CourseBean> course = bpo.getCoursebystuid(stuid);
		for(int i=0;i<course.size();i++){
			CourseBean course0 = course.get(i);
			ScBpo bpo1 = new ScBpo();
			List<StudentBean> list = bpo1.getStudentList(course0.getCourseid());
			
		%>
		<tr><td><%=course0.getCourseid() %></td><td><%=course0.getCname() %></td><td><%=course0.getCcredit() %></td><td><%=course0.getCpre() %></td><td><%=list.size() %></td></tr>
		<% 	
		}
		%> --%>
		
		<jsp:useBean id="bpo" class="Bpo.CourseBpo"/>
		<c:set var="stuid" value="${sessionScope.username }"/>
		<c:set var="course" value="${bpo.getCoursebystuid(stuid) }"/>
		<c:forEach var="tmp1" items="${course }">
		<jsp:useBean id="bpo1" class="Bpo.ScBpo"/>
		<c:set var="list" value="${bpo1.getStudentList(tmp1.courseid) }"/>
		<tr>
				<td>${tmp1.courseid}</td>
				<td>${tmp1.cname}</td>
				<td>${tmp1.ccredit}</td>
				<td>${tmp1.cpre}</td>
				<td>${list.size()}</td>
		</tr>
		</c:forEach>
		
		</table> 
		
	</div>
	
	<div id="footer">版权信息：<%="山东建筑大学" %>&nbsp;&nbsp;联系邮箱：<%="1719749848@qq.com" %></div>	
</body>
</html>