<%@page import="Bean.StudentBean"%>
<%@page import="Bpo.ScBpo"%>
<%@page import="Bpo.CourseBpo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.CourseBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选择课程</title>
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
		<%-- <%
		String err = (String)request.getAttribute("err");
		if(err == null){
			err = "";
		}
		String courseid = (String)request.getParameter("courseid");
		if(courseid == null){
			courseid = "";
		}
		String cname = (String)request.getParameter("cname");
		if(cname == null){
			cname="";
			
		}
		%> --%> 
		
		
		
		<c:set var="err" value="${requestScope.err }"/>
		
		<c:set var="courseid" value="${param.courseid }"/>
		
		<c:set var="cname" value="${param.cname }"/>
		
		
		
		
		
		
		
		
		
		<form action="/07/getCourse" method="post">
		<div id="query">
			<input type="text" name="courseid" value="${courseid }">&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="cname" value="${param.cname }">&nbsp;&nbsp;<input type="submit" value="查询">&nbsp;&nbsp;<input type="reset" value="重置">
		</div>
		<table width='800' border='0' cellspacing='0' cellpadding='0' align='center'>
		<tr><td>课程号</td><td>课程名</td><td>学分</td><td>先修学号</td><td>当前选课人数</td><td>操作</td></tr>
		<div id="err0">
		<%-- <%=err %> --%>
		<c:out value="${err }" default=""/>
		</div>
		<%-- <%
		List<CourseBean> course = (List<CourseBean>)request.getAttribute("course");
		
		if(course==null){
			CourseBpo bpo = new CourseBpo();
			List<CourseBean> course1 = bpo.getAllCourse();
			for(int i=0;i<course1.size();i++){
				CourseBean course0 = course1.get(i);
				ScBpo sc = new ScBpo();
				List<StudentBean> sclist = sc.getStudentList(course0.getCourseid());
				String scnum = Integer.toString(sclist.size());
				if(sclist.size() == 0){
					scnum = "无学生选择该课程";
				}
		%>
		<tr><td><%=course0.getCourseid() %></td><td><%=course0.getCname() %></td><td><%=course0.getCcredit() %></td><td><%=course0.getCpre() %></td><td><%=scnum %></td><td><a href="addsc.jsp?courseid=<%=course0.getCourseid()%>" onclick="if(!confirm('确定要选择该课吗?')) return false;">选中</a></td></tr>
		<%
			}
		}else{
			CourseBpo bpo = new CourseBpo();
			for(int i=0;i<course.size();i++){
				CourseBean course0 = course.get(i);
				ScBpo sc = new ScBpo();
				List<StudentBean> sclist = sc.getStudentList(course0.getCourseid());
				String scnum = Integer.toString(sclist.size());
				if(sclist.size() == 0){
					scnum = "无学生选择该课程";
				}
		%>
		<tr><td><%=course0.getCourseid() %></td><td><%=course0.getCname() %></td><td><%=course0.getCcredit() %></td><td><%=course0.getCpre() %></td><td><%=scnum %></td><td><a href="addsc.jsp?courseid=<%=course0.getCourseid()%>" onclick="if(!confirm('确定要选择该课吗?')) return false;">选中</a></td></tr>
		<% 
			}
		}
		
		
		%> --%>
		
		<c:set var="course" value="${requestScope.course }"/>
		<c:choose>
		<c:when test="${empty course }">
			<jsp:useBean id="bpo" class="Bpo.CourseBpo"/>
			<c:set var="course1" value="${bpo.getAllCourse() }"/>
			<c:forEach var="tmp" items="${course1 }">
			<jsp:useBean id="sc" class="Bpo.ScBpo"/>
			<c:set var="sclist" value="${sc.getStudentList(tmp.courseid)}"/>
			
			
			<tr>
				<td>${tmp.courseid}</td>
				<td>${tmp.cname}</td>
				<td>${tmp.ccredit}</td>
				<td>${tmp.cpre}</td>
				<td>${sclist.size()}</td>
				<td><a href="addsc.jsp?courseid=${tmp.courseid }" onclick="if(!confirm('确定要选择该课吗?')) return false;">选中</a></td>
			</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			
			<c:forEach var="tmp" items="${course }">
			<jsp:useBean id="sc1" class="Bpo.ScBpo"/>
			<c:set var="sclist1" value="${sc1.getStudentList(tmp.courseid) }"/>
			
			
			<tr>
				<td>${tmp.courseid}</td>
				<td>${tmp.cname}</td>
				<td>${tmp.ccredit}</td>
				<td>${tmp.cpre}</td>
				<td>${sclist1.size()}</td>
				<td><a href="addsc.jsp?courseid=${tmp.courseid }" onclick="if(!confirm('确定要选择该课吗?')) return false;">选中</a></td>
			</tr>
			</c:forEach>
		</c:otherwise>	
		</c:choose>
		</table>
		</form>
	</div>
	
	<div id="footer">版权信息：<%="山东建筑大学" %>&nbsp;&nbsp;联系邮箱：<%="1719749848@qq.com" %></div>
</body>
</html>