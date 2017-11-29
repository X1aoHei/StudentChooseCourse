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
	<jsp:useBean id="bpo1" class="Bpo.CourseBpo"/>
	<%
	String err="";
	String stuid = (String)session.getAttribute("username");
	String courseid = request.getParameter("courseid");
	try{
		bpo1.addsc(stuid, courseid);
	}catch(Exception e){
		err = "选课失败："+e.getMessage();
	}
	request.setAttribute("err", err);
	request.getRequestDispatcher("PickingCourse.jsp").forward(request, response);
	
	%>
	

	
	
	
</body>
</html>