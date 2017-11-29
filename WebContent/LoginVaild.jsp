<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="user" class="jdbc.AdminOperation" scope="session"/>
	<jsp:setProperty name="user" property="name"/>
	<jsp:setProperty name="user" property="password"/>
	<jsp:setProperty name="user" property="usertype"/>
	<%-- <%
	
	boolean successflag = user.login();
	if(successflag == true){
		session.setAttribute("username", user.getName());
		if(user.getUsertype().equals("1")){
			response.sendRedirect("StudentMain.jsp");
		}else if(user.getUsertype().equals("2")){
			response.sendRedirect("TeacherMain.jsp");
		}
	}else{
		out.println("登录失败");
	}
	%> --%>
	<c:set var="successflag" value="${user.login()}"/>
	<c:if test="${successflag == true }">
		<c:set var="username" value="${user.getName() }" scope="session"></c:set>
		<c:if test="${user.getUsertype().equals('1') }">
			<c:redirect url="Student/StudentMain.jsp">
			</c:redirect>
		</c:if>
		<c:if test="${user.getUsertype().equals('2') }">
			<c:redirect url="Teacher/TeacherMain.jsp">
			</c:redirect>
		</c:if>
	</c:if>
	<c:if test="${successflag != true }">
		<%
		out.println("登录失败请重新登录");
		%>
	</c:if>
</body>
</html>