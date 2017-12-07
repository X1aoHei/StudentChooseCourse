<%@page import="java.util.Map" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选课</title>
</head>
<body>
	<%-- <jsp:useBean id="bpo123" class="Bean.CourseBean"/> --%>
	<%-- <%
	String err="";
	String stuid = (String)session.getAttribute("username");
	String courseid = request.getParameter("courseid");
	try{
		bpo123.addsc(stuid, courseid);
	}catch(Exception e){
		err = "选课失败："+e.getMessage();
	}
	request.setAttribute("err", err);
	request.getRequestDispatcher("PickingCourse.jsp").forward(request, response);
	
	%> --%>
	
	
	<%-- <%
	String stuid = (String)session.getAttribute("username");
	String courseid = request.getParameter("courseid");
	
	
	Map<String,String> err = sc1.check(stuid,courseid);
	if(err == null||err.size()==0){
		sc1.addsc(stuid, courseid);
		response.sendRedirect("getCourse.jsp");
	}else{
		request.setAttribute("err", err);
		request.getRequestDispatcher("PickingCourse.jsp").forward(request, response);
	} 
	
	%> --%>
	
	
	
	<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	
	%>
	
	<jsp:useBean id="sc1" class="Bean.ScBean"/>
	<jsp:useBean id="sc2" class="Bpo.CourseBpo"/>
	
	<c:set var="stuid" value="${sessionScope.username }"/>
	<c:set var="courseid" value="${param.courseid }"/>
	<c:set var="err000" value="${sc1.check(stuid,courseid) }"/> 
	<c:choose>
		<c:when test="${err000 == true}">
			
			
		
		<c:redirect url="/Student/getCourse.jsp"/>
		</c:when>
		<c:otherwise>
			<jsp:forward page="/Student/PickingCourse.jsp">
				<jsp:param name="err" value="选课失败!请不要重复选课"/>
			
			</jsp:forward>
		</c:otherwise>
	</c:choose>
	

	
	
	
	
	
	
	
	 
	<%-- <c:if test="${err.size()==0 }">
		<%sc1.addsc(stuid, courseid); %>
		<c:redirect url="getCourse.jsp"/>
	</c:if>
	<c:if test="${err.size()!=0 }">
		<jsp:forward page="PickingCourse.jsp">
				<jsp:param name="err" value="${err }"/>
			
		</jsp:forward>
	</c:if> --%>
	
<%-- 	<jsp:useBean id="bpo1" class="Bpo.CourseBpo"/>
	<%
	String err="";
	String stuid = (String)session.getAttribute("username");
	String courseid = request.getParameter("courseid");
	try{
		bpo1.addsc(stuid, courseid);
		response.sendRedirect("getCourse.jsp");
	}catch(Exception e){
		err = "选课失败："+e.getMessage();
		request.setAttribute("err", err);
		request.getRequestDispatcher("PickingCourse.jsp").forward(request, response);
	}
	
	
	%> --%>
	
	
</body>
</html>